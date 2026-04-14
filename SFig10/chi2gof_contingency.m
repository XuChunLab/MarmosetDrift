function [h, p, chi2stat] = chi2gof_contingency(observed)
% 自定义卡方检验函数用于列联表
    
    % 计算期望频数
    row_totals = sum(observed, 2);
    col_totals = sum(observed, 1);
    total = sum(row_totals);
    
    expected = (row_totals * col_totals) / total;
    
    % 计算卡方统计量
    chi2stat = sum(sum((observed - expected).^2 ./ expected));
    
    % 计算自由度
    [rows, cols] = size(observed);
    df = (rows - 1) * (cols - 1);
    
    % 计算P值
    p = 1 - chi2cdf(chi2stat, df);
    
    % 显著性检验 (α=0.05)
    h = p < 0.05;
    
    fprintf('卡方统计量: %.4f\n', chi2stat);
    fprintf('自由度: %d\n', df);
    fprintf('P值: %.4f\n', p);
    fprintf('结果: %s\n', ternary(h, '拒绝原假设', '接受原假设'));
end

function result = ternary(condition, true_val, false_val)
    if condition
        result = true_val;
    else
        result = false_val;
    end
end