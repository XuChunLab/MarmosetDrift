function [beta, stats, h] = PlotLinearFittingWithShading(X, Y, varargin)
% PlotLinearFittingWithShading - 绘制线性回归拟合线及误差范围阴影
%
% 语法：
%   [beta, stats, h] = PlotLinearFittingWithShading(X, Y)
%   [beta, stats, h] = PlotLinearFittingWithShading(X, Y, 'Parameter', Value, ...)
%
% 输入参数：
%   X - 自变量数据向量
%   Y - 因变量数据向量
%
% 可选参数：
%   'Alpha' - 显著性水平，默认0.05（95%置信区间）
%   'ShadingType' - 阴影类型：'confidence'（置信区间，默认）或 'prediction'（预测区间）
%   'LineWidth' - 回归线宽度，默认2
%   'LineColor' - 回归线颜色，默认蓝色 [0, 0.447, 0.741]
%   'ShadingColor' - 阴影颜色，默认与线颜色相同但透明度为0.3
%   'MarkerSize' - 数据点大小，默认36
%   'MarkerColor' - 数据点颜色，默认红色 [0.85, 0.325, 0.098]
%   'ShowEquation' - 是否显示回归方程，默认true
%   'ShowStats' - 是否显示统计信息，默认true
%
% 输出参数：
%   beta - 回归系数 [截距; 斜率]
%   stats - 回归统计信息结构体
%   h - 图形句柄结构体

% 参数解析
p = inputParser;
addRequired(p, 'X', @(x) isnumeric(x) && isvector(x));
addRequired(p, 'Y', @(x) isnumeric(x) && isvector(x));
addParameter(p, 'Alpha', 0.05, @(x) isnumeric(x) && x>0 && x<1);
addParameter(p, 'ShadingType', 'confidence', @(x) ismember(x, {'confidence', 'prediction'}));
addParameter(p, 'LineWidth', 2, @isnumeric);
addParameter(p, 'LineColor', [0, 0.447, 0.741], @(x) isnumeric(x) && length(x)==3);
addParameter(p, 'ShadingColor', [], @(x) isempty(x) || (isnumeric(x) && length(x)==3));
addParameter(p, 'MarkerSize', 36, @isnumeric);
addParameter(p, 'MarkerColor', [0.85, 0.325, 0.098], @(x) isnumeric(x) && length(x)==3);
addParameter(p, 'ShowEquation', true, @islogical);
addParameter(p, 'ShowStats', true, @islogical);

parse(p, X, Y, varargin{:});
params = p.Results;

% 确保X和Y是列向量
X = X(:);
Y = Y(:);

% 检查数据长度
if length(X) ~= length(Y)
    error('X和Y的长度必须相同');
end

% 删除缺失值
validIdx = ~isnan(X) & ~isnan(Y);
X = X(validIdx);
Y = Y(validIdx);

if length(X) < 2
    error('有效数据点不足，至少需要2个点进行线性回归');
end

% 使用更简单的线性回归方法
X_design = [ones(length(X), 1), X];
beta = X_design \ Y;  % 使用反斜杠求解最小二乘问题

% 计算拟合值
x_range = linspace(min(X), max(X), 100)';
X_range_design = [ones(length(x_range), 1), x_range];
y_fit = X_range_design * beta;

% 计算残差和统计信息
residuals = Y - X_design * beta;
MSE = sum(residuals.^2) / (length(Y) - 2);  % 均方误差

% 计算标准误差 - 修复矩阵维度问题
% 使用更稳定的计算方法
XtX_inv = inv(X_design' * X_design);
SE_fit = sqrt(MSE * diag(X_range_design * XtX_inv * X_range_design'));

% 根据阴影类型选择计算方式
t_val = tinv(1 - params.Alpha/2, length(Y) - 2);  % t分布临界值

if strcmp(params.ShadingType, 'confidence')
    % 置信区间
    delta = t_val * SE_fit;
else
    % 预测区间
    SE_pred = sqrt(MSE * (1 + diag(X_range_design * XtX_inv * X_range_design')));
    delta = t_val * SE_pred;
end

% 设置阴影颜色
if isempty(params.ShadingColor)
    shading_color = params.LineColor;
else
    shading_color = params.ShadingColor;
end

% 创建图形
%figure;
%hold on;

% 绘制误差范围阴影
h.shading = fill([x_range; flipud(x_range)], [y_fit - delta; flipud(y_fit + delta)], ...
                shading_color, 'FaceAlpha', 0.3, 'EdgeColor', 'none', ...
                'DisplayName', sprintf('%d%% %s区间', round((1-params.Alpha)*100), ...
                getShadingTypeName(params.ShadingType)));

% 绘制数据点
%h.scatter = scatter(X, Y, params.MarkerSize, params.MarkerColor, 'filled','DisplayName', '数据点');

% 绘制回归线
h.line = plot(x_range, y_fit, 'LineWidth', params.LineWidth,'Color', params.LineColor);

% % 图形美化
% xlabel('X');
% ylabel('Y');
% title('线性回归拟合与误差范围');
% legend('show', 'Location', 'best');
% grid on;
% box on;

% 计算R²和其他统计量
y_mean = mean(Y);
SS_total = sum((Y - y_mean).^2);
SS_residual = sum(residuals.^2);
R_squared = 1 - SS_residual/SS_total;

% 计算F统计量和p值
p_value = 1 - fcdf((SS_total - SS_residual)/(SS_residual/(length(Y)-2)), 1, length(Y)-2);

% 显示回归方程和统计信息
if params.ShowEquation || params.ShowStats
    % 创建信息文本
    info_text = {};
    
    if params.ShowEquation
        if beta(2) >= 0
            equation_text = sprintf('Y = %.4f + %.4f X', beta(1), beta(2));
        else
            equation_text = sprintf('Y = %.4f - %.4f X', beta(1), abs(beta(2)));
        end
        info_text{end+1} = equation_text;
    end
    
    if params.ShowStats
        stats_text = sprintf('R² = %.4f, p = %.4f', R_squared, p_value);
        info_text{end+1} = stats_text;
        info_text{end+1} = sprintf('样本数 = %d', length(X));
    end
    
    % 在图上添加文本框
%     text_pos = [0.05, 0.95];
%     h.text = annotation('textbox', [text_pos(1), text_pos(2)-length(info_text)*0.05, 0.3, length(info_text)*0.05], ...
%                        'String', info_text, 'VerticalAlignment', 'top', ...
%                        'HorizontalAlignment', 'left', 'BackgroundColor', 'white', ...
%                        'EdgeColor', 'black', 'FontSize', 10, 'FitBoxToText', 'on');
end

% 创建stats输出结构体
stats = struct();
stats.R2 = R_squared;
stats.pValue = p_value;
stats.MSE = MSE;
stats.residuals = residuals;

hold off;

% 输出统计信息
fprintf('线性回归结果:\n');
fprintf('回归方程: Y = %.4f + %.4f X\n', beta(1), beta(2));
fprintf('R² = %.4f, p值 = %.4f\n', R_squared, p_value);
fprintf('样本数 = %d\n', length(X));

end

function name = getShadingTypeName(type)
% 获取阴影类型的中文名称
    switch type
        case 'confidence'
            name = '置信';
        case 'prediction'
            name = '预测';
        otherwise
            name = type;
    end
end
%% 251019 from deepseek

% example
% X = [1 6 5 5 5 5 5 5 4 10];
% Y = 2*X + 5 + 3*randn(1,10);
% figure
% hold on
% scatter(X,Y)
% HOLDONPlotLinearFittingWithShading(X, Y);

% 我见到有做线性回归的时候，不仅画出了回归线，还在回归线画出了阴影代表着误差范围。请写一个Matlab函数帮我实现一下 PlotLinearFittingWithShading（X，Y）