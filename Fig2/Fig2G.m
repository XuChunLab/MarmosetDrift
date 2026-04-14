




load('Fig2G.mat')
%% drift distance
figure(Position=[100,100,150,400]), hold on


controlA=allcellsmatricsA(tempwithinday,3:6);
controlB=allcellsmatricsB(tempwithinday,3:6);
tempdistance=sqrt(sum((controlB-controlA).^2,2));
xx=[1,4]
yy=mean(tempdistance); yy=[yy,yy];
ee=std(tempdistance)/sqrt(length(controlA)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)

X=[];Y=[];% for linear regression
MIMatAA=[];MIMatBB=[]; %for shufful control
temp=[1 2 3 4]
for i=1:4
    MIMatA=MIAB_XsessionApartNew{1,i};
    MIMatB=MIAB_XsessionApartNew{2,i};
    tempdistance=sqrt(sum((MIMatB-MIMatA).^2,2));
    scatter(i,mean(tempdistance),14,"black","filled")
    temp(i)=mean(tempdistance);
    ee=std(tempdistance)/sqrt(size(MIMatA,1));
    plot([i,i],mean(tempdistance)+[ee,-ee],"Color",[0 0 0])
    X=[X,tempdistance'*0+i];
    Y=[Y,tempdistance'];
    MIMatAA=[MIMatAA;MIMatA];
    MIMatBB=[MIMatBB;MIMatB];
end
plot([1 2 3 4],temp)
HOLDONPlotLinearFittingWithShading(X,Y) % for linear regression
[r,p]=corr(X',Y')

controlN=size(MIMatBB,1)
controlcell=randsample(1:size(MIMatBB,1),controlN,'false');
controlA=MIMatAA(controlcell,:);
controlcell=randsample(1:size(MIMatBB,1),controlN,'false');
controlB=MIMatBB(controlcell,:);
tempdistance=sqrt(sum((controlB-controlA).^2,2));
xx=[1,4];
yy=mean(tempdistance); yy=[yy,yy];
ee=std(tempdistance)/sqrt(length(controlA)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')

xlim([0.4,4.6])
ylim([0 12])

hold on
controlA=allcellsmatricsA(tempwithinday,3:6);
controlB=allcellsmatricsB(tempwithinday,3:6);
temp=sqrt(sum((controlB-controlA).^2,2));
    MIMatA=MIAB_XsessionApartNew{1,1};
    MIMatB=MIAB_XsessionApartNew{2,1};
    tempdistance=sqrt(sum((MIMatB-MIMatA).^2,2));
tempdistance=tempdistance-temp;  
scatter(4.5,mean(tempdistance),14,"black","filled")
ee=std(tempdistance)/sqrt(size(tempdistance,1));
plot([4.5,4.5],mean(tempdistance)+[ee,-ee],"Color",[0 0 0])
minuswthinday_ACC=tempdistance;

[p12,h]=ranksum(Y(find(X==1)),Y(find(X==2)))
[p13,h]=ranksum(Y(find(X==1)),Y(find(X==3)))
[p14,h]=ranksum(Y(find(X==1)),Y(find(X==4)))