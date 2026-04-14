




load('Fig5DE.mat')

%% Fig5D
figure
hold on
x=mainexample{2,4}(:,1)
y=mainexample{2,4}(:,2)
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
% for i=1:length
%     plot([1+0.2,2-0.2],[temp1(i),temp2(i)],"Color",[0,0,0,0.5])
% end
hold off
xlim([0 9])
ylim([0 1.5])
allpcell{2,4}

%% Fig5E
figure
hold on
x=mainexample{5,9}(:,1)
y=mainexample{5,9}(:,2)
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
% for i=1:length
%     plot([1+0.2,2-0.2],[temp1(i),temp2(i)],"Color",[0,0,0,0.5])
% end
hold off
xlim([0 9])
ylim([0 1.5])
allpcell{5,9}

