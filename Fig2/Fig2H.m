

load('Fig2H.mat')

figure(Position=[100,100,150,400]), hold on

%temp=cat(1,BysDecodeAB_XsessionApart{3,:});
temp=BysDecodeAB_XsessionApart{3,1};
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)

Y=BysDecodeAB_XsessionApart{1,1};
scatter(1,mean(Y),14,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([1,1],mean(Y)+[ee,-ee],"Color",[0 0 0])
Y1=Y;

Y=[BysDecodeAB_XsessionApart{1,2};BysDecodeAB_XsessionApart{1,3}];
scatter(2,mean(Y),14,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([2,2],mean(Y)+[ee,-ee],"Color",[0 0 0])
Y2=Y;

Y=[BysDecodeAB_XsessionApart{1,4};BysDecodeAB_XsessionApart{1,5};BysDecodeAB_XsessionApart{1,6};BysDecodeAB_XsessionApart{1,7}];
scatter(3,mean(Y),14,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([3,3],mean(Y)+[ee,-ee],"Color",[0 0 0])
Y3=Y;

Y=[BysDecodeAB_XsessionApart{1,8};BysDecodeAB_XsessionApart{1,9};BysDecodeAB_XsessionApart{1,10};BysDecodeAB_XsessionApart{1,11};BysDecodeAB_XsessionApart{1,12};BysDecodeAB_XsessionApart{1,13};BysDecodeAB_XsessionApart{1,14};BysDecodeAB_XsessionApart{1,15}];
scatter(4,mean(Y),14,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([4,4],mean(Y)+[ee,-ee],"Color",[0 0 0])
Y4=Y;

temp=cat(1,BysDecodeAB_XsessionApart{2,:});
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')
xlim([0.4,4.6])
xticks([1:4])
ylim([0 1])
yticks([0:0.2:1])


plot([1 2 3 4],[mean(Y1),mean(Y2),mean(Y3),mean(Y4)])
Y=BysDecodeAB_XsessionApart{1,1}-BysDecodeAB_XsessionApart{3,1};
scatter(4.5,mean(Y),14,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([4.5,4.5],mean(Y)+[ee,-ee],"Color",[0 0 0])
minuswhitinday_ACC=Y



ylim([0.3 0.9])
yticks([0.3:0.2:0.9])

p12=ranksum(Y1,Y2)
p13=ranksum(Y1,Y3)
p14=ranksum(Y1,Y4)