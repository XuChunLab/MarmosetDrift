



load("Fig5GH.mat")

%% G
figure
hold on
temp1=mainexample{1,6}(:,1);
temp2=mainexample{1,6}(:,2);
x=[temp1*0+1;temp2*0+2];
y=[temp1;temp2];
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')


hold off
xlim([0 3])
ylim([0 2.5])
allpcell{1,6}


%% H
figure
hold on
temp1=mainexample{7,8}(:,1);
temp2=mainexample{7,8}(:,2);
x=[temp1*0+1;temp2*0+2];
y=[temp1;temp2];
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')


hold off
xlim([0 3])
ylim([0 2.5])
allpcell{7,8}