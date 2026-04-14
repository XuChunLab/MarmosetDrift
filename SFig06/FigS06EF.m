

%% FigS06EF

load('FigS06EF.mat')

figure

subplot(121)
hold on
scatter(tempz*0+rand(1,length(tempz))/2,tempz,6,"black","filled","MarkerFaceAlpha",0.1)
boxplot(tempz,tempz*0+1,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
plot([-1 3],[1 1])
hold off
[p,h] = signrank(tempz,1)
ylim([0 20])
xlim([-1 3])

subplot(122)
hold on
scatter(tempk*0+rand(1,length(tempz))/2,tempk,6,"black","filled","MarkerFaceAlpha",0.1)
boxplot(tempk,tempk*0+1,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
plot([-1 3],[1 1])
hold off
[p,h] = signrank(tempk,1)
ylim([0 3])
xlim([-1 3])

