

%% FigS04C 

load('FigS04C.mat')
temp1=TrainATeOnB(find(earlyandlate<14));
temp2=TrainATeOnB(find(earlyandlate>=14));
%[h,p]=ttest2(temp1,temp2)
[p,h]=ranksum(temp1,temp2)
mean(temp1)
mean(temp2)

figure("Position",[100 100 200 300])
x=[temp1*0+1;temp2*0+2];
y=[temp1;temp2];
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
ylim([0 1])

