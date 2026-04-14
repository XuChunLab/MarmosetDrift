


%% deepseekPlotEllipse 
center = mean(data);

cov_mat = cov(data);

[eigenvec, eigenval] = eig(cov_mat);

[eigenval_sorted, order] = sort(diag(eigenval), 'descend');
eigenvec_sorted = eigenvec(:, order);

conf_level = 0.90;
chi2_critical = sqrt(chi2inv(conf_level, 2)); 
theta = atan2(eigenvec_sorted(2,1), eigenvec_sorted(1,1)); 
a = chi2_critical * sqrt(eigenval_sorted(1)); 
b = chi2_critical * sqrt(eigenval_sorted(2)); 

t = linspace(0, 2*pi, 100);
ellipse = [a * cos(t); b * sin(t)];
R = [cos(theta), -sin(theta); sin(theta), cos(theta)]; 
rotated_ellipse = R * ellipse;

x_ellipse = rotated_ellipse(1,:) + center(1);
y_ellipse = rotated_ellipse(2,:) + center(2);

