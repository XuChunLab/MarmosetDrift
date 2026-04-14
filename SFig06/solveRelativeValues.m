
%% deep seek
function [x, stats] = solveRelativeValues(A)
    % 输入: A - n x n 上三角矩阵 (A(i,j) ≈ x_i - x_j, i < j)
    % 输出: x - 求解的变量值
    %        stats - 包含统计信息的结构体
    
    n = size(A, 1);
    
    % 提取严格上三角元素
    [rows, cols] = find(triu(true(n), 1));
    differences = A(sub2ind([n,n], rows, cols));
    numEqs = length(differences);
    
    % 构建系数矩阵
    B = zeros(numEqs, n);
    for k = 1:numEqs
        i = rows(k);
        j = cols(k);
        B(k, i) = 1;
        B(k, j) = -1;
    end
    
    % 添加约束: sum(x) = 0
    B = [B; ones(1, n)];
    d = [differences; 0];
    
    % 最小二乘求解
    x = B \ d;
    
    % ===== 统计验证 =====
    % 1. 计算残差向量
    residual_vec = B * x - d;
    
    % 2. 分离差值残差和约束残差
    diff_residuals = residual_vec(1:end-1);  % 差值方程的残差
    constraint_residual = residual_vec(end);  % 约束方程的残差
    
    % 3. 计算关键统计量
    stats = struct();
    stats.abs_residuals = diff_residuals;     % 绝对残差
    stats.rel_residuals = diff_residuals ./ differences;  % 相对残差
    stats.max_abs_residual = max(abs(diff_residuals));
    stats.mean_abs_residual = mean(abs(diff_residuals));
    stats.max_rel_residual = max(abs(stats.rel_residuals));
    stats.constraint_residual = constraint_residual;
    
    % 4. 计算决定系数 R²
    SSE = sum(diff_residuals.^2);       % 残差平方和
    SST = sum((differences - mean(differences)).^2);  % 总平方和
    stats.R_squared = 1 - SSE/SST;      % 决定系数
    
    % 5. 计算置信区间 (95% CI)
    res_var = SSE/(numEqs - n);  % 残差方差
    cov_x = inv(B'*B) * res_var; % 参数协方差矩阵
    std_x = sqrt(diag(cov_x));   % 参数标准误差
    t_val = tinv(0.975, numEqs - n); % t-分布临界值
    stats.CI_lower = x - t_val*std_x;
    stats.CI_upper = x + t_val*std_x;
    
    % 6. 残差诊断图
    figure;
    subplot(2,2,1);
    plot(differences, diff_residuals, 'o');
    title('残差 vs 观测值');
    xlabel('观测差值'); ylabel('残差');
    grid on;
    
    subplot(2,2,2);
    normplot(diff_residuals);
    title('残差正态性检验');
    
    subplot(2,2,3);
    plot(x, 'o-', 'MarkerSize', 8, 'LineWidth', 1.5);
    hold on;
    errorbar(1:n, x, t_val*std_x, 'LineStyle','none');
    title('参数估计与95%置信区间');
    xlabel('变量索引'); ylabel('估计值');
    grid on;
    
    subplot(2,2,4);
    bar([stats.max_abs_residual, stats.mean_abs_residual, stats.max_rel_residual]);
    set(gca, 'XTickLabel', {'最大绝对残差', '平均绝对残差', '最大相对残差'});
    title('残差统计摘要');
    
    % 打印关键统计量
    fprintf('\n===== 解有效性统计 =====\n');
    fprintf('最大绝对残差: %.4e\n', stats.max_abs_residual);
    fprintf('平均绝对残差: %.4e\n', stats.mean_abs_residual);
    fprintf('最大相对残差: %.4e\n', stats.max_rel_residual);
    fprintf('约束残差: %.4e\n', stats.constraint_residual);
    fprintf('决定系数 R²: %.4f\n', stats.R_squared);
    fprintf('95%% 置信区间宽度: \n');
    disp(t_val*std_x');
end