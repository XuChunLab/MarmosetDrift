 

clear
waves1st=readNPY(['250226g0waves11.npy']);
waves2nd=readNPY(['250228g0waves10.npy']);
[coeff, score, latent] = pca([waves1st';waves2nd']);


%%
close all
figure("Position",[0 100 1900 260])

subplot(161)
hold on
for i=1:130
    plot(waves1st(:,i),'LineWidth',0.25,'Color',[0.4940 0.1840 0.5560 0.15])
end
plot(mean(waves1st,2),'LineWidth',0.5,'Color',[0.1 0.1 0.1])
hold off
ylim([-250 250])
xlim([0 60])

subplot(162)
hold on
for i=1:130
    plot(waves2nd(:,i),'LineWidth',0.25,'Color',[0.4660 0.6740 0.1880 0.15])
end
plot(mean(waves2nd,2),'LineWidth',0.5,'Color',[0.1 0.1 0.1])
hold off
ylim([-250 250])
xlim([0 60])


subplot(163)
hold on
temp1=[1:size(waves1st,2)];
temp2=[1:size(waves2nd,2)]+size(waves1st,2);
scatter(score(temp1(1:130),1),score(temp1(1:130),2),6,'filled','MarkerFaceColor','#7E2F8E','MarkerFaceAlpha',0.6)
scatter(score(temp2(1:130),1),score(temp2(1:130),2),6,'filled','MarkerFaceColor','#77AC30','MarkerFaceAlpha',0.6)

data=score(temp1,[1:2]);
PlotEllipse
%scatter(data(:,1), data(:,2), 9.6,'filled', 'MarkerFaceAlpha', 0.6,'MarkerFaceColor',[0 0.4470 0.7410]);
plot(x_ellipse, y_ellipse,'LineWidth', 0.5, 'Color',[0.4940 0.1840 0.5560 0.75]);
plot(center(1), center(2), 'o', 'MarkerSize', 5, 'LineWidth', 0.5,'Color',[0.4940 0.1840 0.5560 0.75]);


data=score(temp2,[1:2]);
PlotEllipse
%scatter(data(:,1), data(:,2), 9.6, 'filled', 'MarkerFaceAlpha', 0.6,'MarkerFaceColor',[0.8500 0.3250 0.0980]);
plot(x_ellipse, y_ellipse,'LineWidth', 0.5, 'Color',[0.4660 0.6740 0.1880 0.75]);
plot(center(1), center(2),  'o', 'MarkerSize', 5, 'LineWidth', 0.5,'Color',[0.4660 0.6740 0.1880 0.75]);

hold off
 xlim([-500,500])
 ylim([-400,400])


