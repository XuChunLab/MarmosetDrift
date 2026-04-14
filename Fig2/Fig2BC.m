


%% 

% clear
% clc
% close all
% 
% load('glm15thExample_SL_250310mz_m250410version.mat')
% load('X:\weichuanyao\Analyse\SoundLocation250807\PreProcessRawData250808\SL_250310mz_m250410version.mat', 'unites','behavior_Info','PFL_licktime','PFL_presstime','behavior_buzzer')
% 
% 
% for i=1:(size(behavior_Info,1)-1)
%     temp=intersect(find(behavior_buzzer(:,1)>behavior_Info(i,2)),find(behavior_buzzer(:,1)<behavior_Info(i+1,2)));
%     behavior_Info(i,[3,4])=behavior_buzzer(temp(1),[3,1]);
% end
% behavior_Infonew=[behavior_Info(find(behavior_Info(:,9)==1),:);behavior_Info(find(behavior_Info(:,9)==-1),:)];
% RewardedTrials=find(behavior_Infonew(:,9)==1);
% RewardedTrials=RewardedTrials(end);
% UnResponseTrials=find(behavior_Info(:,9)==0);
% UnResponseTrials=UnResponseTrials(1:end-1);
% 
% 
% close all
% celli=7
% ylimmax=30
% 
% xrange=[1591:5590];
% testset=10

%% fig2B
clear
clc
close all
load('Fig2BC.mat')

figure(Position=[200 200 1000 480],Name=num2str(celli))

subplot(3,4,[1,5])
hold on
A=[];
for triali=1:size(behavior_Infonew,1)
    presstime=behavior_Infonew(triali,2);
    %cuetime=behavior_Infonew(triali,4);
    %responsetime=behavior_Infonew(triali,9);
    time=presstime;
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); A=[A;a];
    y=x*0+triali;
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
plot([-1.2,1.8],[RewardedTrials,RewardedTrials]+0.5,'Color',[0,0.4,0.7],'LineWidth',0.25)
%**********250819 new part**********
count=size(behavior_Infonew,1)+1;
plot([-1.2,1.8],[count,count]-0.5,'Color',[0,0.4,0.7],'LineWidth',0.25)
for triali=1:length(UnResponseTrials)
    presstime=behavior_Info(UnResponseTrials(triali),2);time=presstime;temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;y=x*0+count;count=count+1;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); A=[A;a];
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
plot([-1.2,1.8],[count,count]-0.5,'Color',[0,0.4,0.7],'LineWidth',0.25)
for triali=1:length(PFL_presstime)
    time=PFL_presstime(triali);temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;y=x*0+count;count=count+1;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); A=[A;a];
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
plot([-1.2,1.8],[count,count]-0.5,'Color',[0,0.4,0.7],'LineWidth',0.25)
hold off
xlim([-1.2,1.8])
ylim([0,count])
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
%**********250819 new part**********


subplot(3,4,[2,6])
hold on
B=[];
for triali=1:size(behavior_Infonew,1)
    %presstime=behavior_Infonew(triali,2);
    cuetime=behavior_Infonew(triali,4);
    %responsetime=behavior_Infonew(triali,9);
    time=cuetime;
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); B=[B;a];
    y=x*0+triali;
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
%plot([-1.2,1.8],[RewardedTrials,RewardedTrials]+0.5,'Color',[0,0.4,0.7],'LineWidth',2)
%**********250819 new part**********
count=size(behavior_Infonew,1)+1;
for triali=1:length(UnResponseTrials)
    cuetime=behavior_Info(UnResponseTrials(triali),4);time=cuetime;temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;y=x*0+count;count=count+1;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); B=[B;a];
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
for triali=1:length(PFL_presstime)
    count=count+1;
    %scatter(x,y,5,"blue","filled")
end
hold off
xlim([-1.2,1.8])
ylim([0,count])
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
%**********250819 new part**********

subplot(3,4,[3,7])
hold on
C=[];
for triali=1:size(behavior_Infonew,1)
    responsetime=behavior_Infonew(triali,7);
    time=responsetime;
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); C=[C;a];
    y=x*0+triali;
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
%plot([-1.2,1.8],[RewardedTrials,RewardedTrials]+0.5,'Color',[0,0.4,0.7],'LineWidth',2)
%**********250819 new part**********
count=size(behavior_Infonew,1)+1;
for triali=1:length(UnResponseTrials)
    %presstime=behavior_Info(UnResponseTrials(triali),2);time=presstime;temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    %x=unites{celli,2}(temp)-time;y=x*0+count;
    count=count+1;
    %scatter(x,y,5,"red","filled")
end
for triali=1:length(PFL_licktime)
    time=PFL_licktime(triali);temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;y=x*0+count;count=count+1;                    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); C=[C;a];
    scatter(x,y,5,"black","filled","MarkerFaceAlpha",0.6)
end
hold off
xlim([-1.2,1.8])
ylim([0,count])
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
%**********250819 new part**********


subplot(3,4,9)
hold on
b=[-1.0:0.2:1.8]-0.1;
shadedErrorBar(b,mean(A)*5,std(A)*5/sqrt(size(A,1)),'lineprops','k');
xlim([-1.2,1.8])
ylim([0,ylimmax])
temp=allcellglm{2,celli}(1,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
if allcellglm{2,celli}(1,2)>1
    text(1.2,ylimmax*0.8,'n.s.');
else
    text(1.2,ylimmax*0.8,[num2str(temp),'±',num2str(round(100*std(allcellglm{2,celli}(1,5:14)/allcellglm{6, celli})/sqrt(10))/100)]); 
end 
tau=(allcellglm{2,celli}(1,3)-14)*0.05*2; text(tau-0.2,ylimmax*0.4,num2str(tau));
sigma=(allcellglm{2,celli}(1,4))*0.05*2;  text(tau+0.5,ylimmax*0.4,num2str(sigma));
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
plot(tau+[-sigma,sigma],[ylimmax*0.5,ylimmax*0.5]);scatter(tau,ylimmax*0.5,10,'black','filled')
if round((tau+1.3)*1000)==0 || round((tau-1.9)*1000)==0 || round((sigma-1.3)*1000)==0, text(1.2,ylimmax*0.8,'n.s.'); end

subplot(3,4,10)
hold on
b=[-1.0:0.2:1.8]-0.1;
shadedErrorBar(b,mean(B)*5,std(B)*5/sqrt(size(B,1)),'lineprops','k');
xlim([-1.2,1.8])
ylim([0,ylimmax])
temp=allcellglm{2,celli}(2,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
if allcellglm{2,celli}(2,2)>1
    text(1.2,ylimmax*0.8,'n.s.');
else
    text(1.2,ylimmax*0.8,[num2str(temp),'±',num2str(round(100*std(allcellglm{2,celli}(2,5:14)/allcellglm{6, celli})/sqrt(10))/100)]); 
end 
tau=(allcellglm{2,celli}(2,3)-14)*0.05*2; text(tau-0.2,ylimmax*0.4,num2str(tau));
sigma=(allcellglm{2,celli}(2,4))*0.05*2;  text(tau+0.5,ylimmax*0.4,num2str(sigma));
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
plot(tau+[-sigma,sigma],[ylimmax*0.5,ylimmax*0.5]);scatter(tau,ylimmax*0.5,10,'black','filled')
if round((tau+1.3)*1000)==0 || round((tau-1.9)*1000)==0 || round((sigma-1.3)*1000)==0, text(1.2,ylimmax*0.8,'n.s.'); end

subplot(3,4,11)
hold on
b=[-1.0:0.2:1.8]-0.1;
shadedErrorBar(b,mean(C)*5,std(C)*5/sqrt(size(C,1)),'lineprops','k');
xlim([-1.2,1.8])
ylim([0,ylimmax])
temp=allcellglm{2,celli}(3,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
if allcellglm{2,celli}(3,2)>1
    text(1.2,ylimmax*0.8,'n.s.');
else
    text(1.2,ylimmax*0.8,[num2str(temp),'±',num2str(round(100*std(allcellglm{2,celli}(3,5:14)/allcellglm{6, celli})/sqrt(10))/100)]); 
end 
tau=(allcellglm{2,celli}(3,3)-14)*0.05*2; text(tau-0.2,ylimmax*0.4,num2str(tau));
sigma=(allcellglm{2,celli}(3,4))*0.05*2;  text(tau+0.5,ylimmax*0.4,num2str(sigma));
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
plot(tau+[-sigma,sigma],[ylimmax*0.5,ylimmax*0.5]);scatter(tau,ylimmax*0.5,10,'black','filled')
if round((tau+1.3)*1000)==0 || round((tau-1.9)*1000)==0 || round((sigma-1.3)*1000)==0, text(1.2,ylimmax*0.8,'n.s.'); end

PokeLine=mean(C)*5 % 250807

subplot(3,4,8)
hold on
X=[];A=[];
for triali=1:RewardedTrials%size(behavior_Infonew,1)
    %presstime=behavior_Infonew(triali,2);
    %cuetime=behavior_Infonew(triali,4);
    responsetime=behavior_Infonew(triali,7);
    time=responsetime;
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;
    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1);
    A=[A;a];
end
%shadedErrorBar(b,mean(A)*5-PokeLine,std(A)*5/sqrt(size(A,1)),'lineprops','k');
shadedErrorBar(b,mean(A)*5,std(A)*5/sqrt(size(A,1)),'lineprops','k');
xlim([-1.2,1.8])
ylim([0,ylimmax])
temp=allcellglm{2,celli}(4,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
tempmeanA=mean(A)*5;
tempstdA=std(A)*5/sqrt(size(A,1));


subplot(3,4,4)
hold on
X=[];A=[];
for triali=(RewardedTrials+1):size(behavior_Infonew,1)
    %presstime=behavior_Infonew(triali,2);
    %cuetime=behavior_Infonew(triali,4);
    responsetime=behavior_Infonew(triali,7);
    time=responsetime;
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;
    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1);
    A=[A;a];
end
for triali=1:length(PFL_licktime)
    time=PFL_licktime(triali);
    temp=intersect(find(unites{celli,2}>time-1.2),find(unites{celli,2}<time+1.8));
    x=unites{celli,2}(temp)-time;
    [a,b]=hist(x,[-1.0:0.2:1.8]-0.1); A=[A;a];
end
shadedErrorBar(b,mean(A)*5,std(A)*5/sqrt(size(A,1)),'lineprops','k');
xlim([-1.2,1.8])
ylim([0,ylimmax])
temp=allcellglm{2,celli}(4,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
tempmeanB=mean(A)*5;
tempstdB=std(A)*5/sqrt(size(A,1));

subplot(3,4,12)
hold on
shadedErrorBar(b,tempmeanA-tempmeanB,sqrt(tempstdA.^2+tempstdB.^2),'lineprops','k');
temp=allcellglm{2,celli}(4,1)/allcellglm{6, celli};temp=round(temp*100) / 100;
if allcellglm{2,celli}(4,2)>1
    text(1.2,ylimmax*0.8,'n.s.');
else
    text(1.2,ylimmax*0.8,[num2str(temp),'±',num2str(round(100*std(allcellglm{2,celli}(3,5:14)/allcellglm{6, celli})/sqrt(10))/100)]); 
end % note that allcellglm{2,celli}(5,2)>=10 represent three or more p-val bigger than 0.01, but hanvent take frange effect into final modulation_index
tau=(allcellglm{2,celli}(4,3)-14)*0.05*2; text(tau-0.2,ylimmax*0.4,num2str(tau));
sigma=(allcellglm{2,celli}(4,4))*0.05*2;  text(tau+0.5,ylimmax*0.4,num2str(sigma));
xticks([-1.2,-0.6,0,0.6,1.2,1.8])
plot(tau+[-sigma,sigma],[ylimmax*0.5,ylimmax*0.5]);scatter(tau,ylimmax*0.5,10,'black','filled')
if round((tau+1.3)*1000)==0 || round((tau-1.9)*1000)==0 || round((sigma-1.3)*1000)==0, text(1.2,ylimmax*0.8,'n.s.'); end
xlim([-1.2,1.8])
ylim([-ylimmax,ylimmax])
xticks([-1.2,-0.6,0,0.6,1.2,1.8])















%% fig2C

buildGLM=allcellglm{1,celli};


figure(Position=[200,200,1100,400],Name=num2str(celli))

subplot(4,5,[1,2,3])
hold on
plot(buildGLM{testset,1}(xrange))
plot(buildGLM{testset,2}(xrange))
hold off
xlim([0,4000])

subplot(4,5,[6,7,8])
hold on
plot(buildGLM{testset+10,1}(xrange))
plot(buildGLM{testset+10,2}(xrange))
hold off
xlim([0,4000])

subplot(4,5,[11,12,13])
hold on
plot(buildGLM{testset+20,1}(xrange))
plot(buildGLM{testset+20,2}(xrange))
hold off
xlim([0,4000])

subplot(4,5,[16,17,18])
hold on
plot(buildGLM{testset+30,1}(xrange))
plot(buildGLM{testset+30,2}(xrange))
hold off
xlim([0,4000])

subplot(4,5,[4,9,14,19])
hold on
x=[ones(1,10)*1,ones(1,10)*2,ones(1,10)*3,ones(1,10)*4];
y=[buildGLM{:,6}];

boxplot(y,x,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
scatter(x+0.2,y,6,'filled','MarkerFaceAlpha',0.3)

xlim([0,5])
%ylim([0,0.24])
xticks([])
box off

temp=y(01:10); temp=[num2str(round(mean(temp)*10000)/100),'±',num2str(round(10000*std(temp)/sqrt(10))/100)]; text(0.5,0.9,temp)
temp=y(11:20); temp=[num2str(round(mean(temp)*10000)/100),'±',num2str(round(10000*std(temp)/sqrt(10))/100)]; text(1.5,0.8,temp)
temp=y(21:30); temp=[num2str(round(mean(temp)*10000)/100),'±',num2str(round(10000*std(temp)/sqrt(10))/100)]; text(2.5,0.7,temp)
temp=y(31:40); temp=[num2str(round(mean(temp)*10000)/100),'±',num2str(round(10000*std(temp)/sqrt(10))/100)]; text(3.5,0.6,temp)

signrank(y(01:10),y(31:40))
signrank(y(11:20),y(31:40))
signrank(y(21:30),y(31:40))

ranksum(y(01:10),y(31:40))
ranksum(y(11:20),y(31:40))
ranksum(y(21:30),y(31:40))


subplot(4,5,[5,10,15,20])
hold on
for i=1:4
    val=abs((allcellglm{2,celli}(i,1)/allcellglm{2,celli}(i,2)))/allcellglm{6,celli};
    sem=std(allcellglm{2,celli}(i,[5:14])/allcellglm{6,celli})/sqrt(10);
    plot([i,i],[0,val],'Color',[0,0,0,0.5],'LineWidth',8)
    plot([i,i],[val-sem,val+sem],'Color',[0,0,0],'LineWidth',1)
    if allcellglm{2,celli}(i,2)>10
        plot([i,i],[val-sem,val+sem],'Color',[1,0,0],'LineWidth',1)
    end
end
xlim([0 5])
xticks([])
ylim([0,ylimmax])
