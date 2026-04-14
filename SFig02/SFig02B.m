
clear
load('SFig02B.mat')
figure(Position=[100,100,500,300])
hold on
for i=1:17
    scatter(collection{1,i}*0+i,collection{1,i},16,"black","filled",'MarkerFaceAlpha',0.3)
end
N=0
temp=zeros(1,17);
for i=1:17
    temp(i)=mean(collection{1,i});
    N=N+length(collection{1,i})
end
plot(temp)
xlim([0 18])
xticks([1:17])
ylim([0 0.8])
yticks([0:0.2:0.8])