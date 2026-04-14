
%% figS04B

clear
clc
close all
load('FigS04B.mat')

MIMatA=MIAB_XsessionApartNew{1,1};
MIMatB=MIAB_XsessionApartNew{2,1};
tempdistance=sqrt(sum((MIMatB-MIMatA).^2,2));
temp1=tempdistance(find(EarlyLate<14));
temp2=tempdistance(find(EarlyLate>=14));
[p,h]=ranksum(temp1,temp2)

figure("Position",[100 100 200 300])
x=[temp1*0+1;temp2*0+2];
y=[temp1;temp2];
boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
ylim([0 12])
