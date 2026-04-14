

%% Fig2F_PSTHCorr

clear
clc
close all
load('m251018TryTheDirectRepresentationDrift.mat')
MZ=load('m251030RepresenDriftInTraditionMethod_sourcedata_mz_ACC.mat')
XM=load('m251030RepresenDriftInTraditionMethod_sourcedata_xm_ACC.mat')
load('m251030RepresenDriftInTraditionMethod_sourcedataControl.mat')
k=4  % dis2nor dis1nor theta corr cos_similarity


%% press


collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_press_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_press_TC{day2i,day1i}(:,k),MZ.MZ_press_TC{day2i,day1i}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_press_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_press_TC{day2i-10,day1i-10}(:,k),XM.MZ_press_TC{day2i-10,day1i-10}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end

figure(Position=[100,100,150,400]), hold on
temp=WithinDayControl{1}{1,k};
%temp=randsample(temp,100,'false');
%temp=temp(1:10:1000);
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)
X=[];Y=[];
    scatter(1,mean(collect1(:,1)),14,"black","filled")
    ee=std(collect1(:,1))/sqrt(size(collect1(:,1),1));
    plot([1,1],mean(collect1(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect1(:,1)'*0+1];
    Y=[Y,collect1(:,1)'];
    scatter(2,mean(collect2(:,1)),14,"black","filled")
    ee=std(collect2(:,1))/sqrt(size(collect2(:,1),1));
    plot([2,2],mean(collect2(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect2(:,1)'*0+2];
    Y=[Y,collect2(:,1)'];
    scatter(3,mean(collect4(:,1)),14,"black","filled")
    ee=std(collect4(:,1))/sqrt(size(collect4(:,1),1));
    plot([3,3],mean(collect4(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect4(:,1)'*0+3];
    Y=[Y,collect4(:,1)'];
    scatter(4,mean(collect8(:,1)),14,"black","filled")
    ee=std(collect8(:,1))/sqrt(size(collect8(:,1),1));
    plot([4,4],mean(collect8(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect8(:,1)'*0+4];
    Y=[Y,collect8(:,1)'];
Xpress=X;Ypress=Y;
temp=randsample([collect1(:,2);collect2(:,2);collect4(:,2);collect8(:,2)],100,'false');
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')
xlim([0.4,4.6])
xticks([1:4])
ylim([-0.2 1])

hold on
plot([1 2 3 4],[mean(collect1(:,1)),mean(collect2(:,1)),mean(collect4(:,1)),mean(collect8(:,1))])
minuswithinday_ACC_press=collect1(:,1)-nanmean(WithinDayControl{1}{1,k});


[p12,h]=ranksum(collect1(:,1),collect2(:,1))
[p14,h]=ranksum(collect1(:,1),collect4(:,1))
[p18,h]=ranksum(collect1(:,1),collect8(:,1))



%% tone

collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_press_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_tone_TC{day2i,day1i}(:,k),MZ.MZ_tone_TC{day2i,day1i}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_press_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_tone_TC{day2i-10,day1i-10}(:,k),XM.MZ_tone_TC{day2i-10,day1i-10}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end
figure(Position=[100,100,150,400]), hold on
temp=WithinDayControl{2}{1,k};
%temp=randsample(temp,100,'false');
%temp=temp(1:11:1100);
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)
X=[];Y=[];
    scatter(1,mean(collect1(:,1)),14,"black","filled")
    ee=std(collect1(:,1))/sqrt(size(collect1(:,1),1));
    plot([1,1],mean(collect1(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect1(:,1)'*0+1];
    Y=[Y,collect1(:,1)'];
    scatter(2,mean(collect2(:,1)),14,"black","filled")
    ee=std(collect2(:,1))/sqrt(size(collect2(:,1),1));
    plot([2,2],mean(collect2(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect2(:,1)'*0+2];
    Y=[Y,collect2(:,1)'];
    scatter(3,mean(collect4(:,1)),14,"black","filled")
    ee=std(collect4(:,1))/sqrt(size(collect4(:,1),1));
    plot([3,3],mean(collect4(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect4(:,1)'*0+3];
    Y=[Y,collect4(:,1)'];
    scatter(4,mean(collect8(:,1)),14,"black","filled")
    ee=std(collect8(:,1))/sqrt(size(collect8(:,1),1));
    plot([4,4],mean(collect8(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect8(:,1)'*0+4];
    Y=[Y,collect8(:,1)'];
Xtone=X;Ytone=Y;
temp=randsample([collect1(:,2);collect2(:,2);collect4(:,2);collect8(:,2)],100,'false');
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')
xlim([0.4,4.6])
xticks([1:4])
ylim([-0.2 1])

hold on
plot([1 2 3 4],[mean(collect1(:,1)),mean(collect2(:,1)),mean(collect4(:,1)),mean(collect8(:,1))])
minuswithinday_ACC_tone=collect1(:,1)-nanmean(WithinDayControl{1}{1,k});

[p12,h]=ranksum(collect1(:,1),collect2(:,1))
[p14,h]=ranksum(collect1(:,1),collect4(:,1))
[p18,h]=ranksum(collect1(:,1),collect8(:,1))


%% lick
collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_lick_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_lick_TC{day2i,day1i}(:,k),MZ.MZ_lick_TC{day2i,day1i}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_lick_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_lick_TC{day2i-10,day1i-10}(:,k),XM.MZ_lick_TC{day2i-10,day1i-10}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end
figure(Position=[100,100,150,400]), hold on
temp=WithinDayControl{3}{1,k};
%temp=randsample(temp,100,'false');
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)
X=[];Y=[];
    scatter(1,mean(collect1(:,1)),14,"black","filled")
    ee=std(collect1(:,1))/sqrt(size(collect1(:,1),1));
    plot([1,1],mean(collect1(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect1(:,1)'*0+1];
    Y=[Y,collect1(:,1)'];
    scatter(2,mean(collect2(:,1)),14,"black","filled")
    ee=std(collect2(:,1))/sqrt(size(collect2(:,1),1));
    plot([2,2],mean(collect2(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect2(:,1)'*0+2];
    Y=[Y,collect2(:,1)'];
    scatter(3,mean(collect4(:,1)),14,"black","filled")
    ee=std(collect4(:,1))/sqrt(size(collect4(:,1),1));
    plot([3,3],mean(collect4(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect4(:,1)'*0+3];
    Y=[Y,collect4(:,1)'];
    scatter(4,mean(collect8(:,1)),14,"black","filled")
    ee=std(collect8(:,1))/sqrt(size(collect8(:,1),1));
    plot([4,4],mean(collect8(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect8(:,1)'*0+4];
    Y=[Y,collect8(:,1)'];
Xlick=X;Ylick=Y;
temp=randsample([collect1(:,2);collect2(:,2);collect4(:,2);collect8(:,2)],100,'false');
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')
xlim([0.4,4.6])
xticks([1:4])
ylim([-0.2 1])

hold on
plot([1 2 3 4],[mean(collect1(:,1)),mean(collect2(:,1)),mean(collect4(:,1)),mean(collect8(:,1))])
minuswithinday_ACC_lick=collect1(:,1)-nanmean(WithinDayControl{1}{1,k});

[p12,h]=ranksum(collect1(:,1),collect2(:,1))
[p14,h]=ranksum(collect1(:,1),collect4(:,1))
[p18,h]=ranksum(collect1(:,1),collect8(:,1))


%% reward

collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_reward_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_reward_TC{day2i,day1i}(:,k),MZ.MZ_reward_TC{day2i,day1i}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_reward_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_reward_TC{day2i-10,day1i-10}(:,k),XM.MZ_reward_TC{day2i-10,day1i-10}(:,k+5)];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end
figure(Position=[100,100,150,400]), hold on
temp=WithinDayControl{4}{1,k};
%temp=randsample(temp,100,'false');
xx=[1,4]
yy=nanmean(temp); yy=[yy,yy];
ee=nanstd(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee)
X=[];Y=[];
    scatter(1,mean(collect1(:,1)),14,"black","filled")
    ee=std(collect1(:,1))/sqrt(size(collect1(:,1),1));
    plot([1,1],mean(collect1(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect1(:,1)'*0+1];
    Y=[Y,collect1(:,1)'];
    scatter(2,mean(collect2(:,1)),14,"black","filled")
    ee=std(collect2(:,1))/sqrt(size(collect2(:,1),1));
    plot([2,2],mean(collect2(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect2(:,1)'*0+2];
    Y=[Y,collect2(:,1)'];
    scatter(3,mean(collect4(:,1)),14,"black","filled")
    ee=std(collect4(:,1))/sqrt(size(collect4(:,1),1));
    plot([3,3],mean(collect4(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect4(:,1)'*0+3];
    Y=[Y,collect4(:,1)'];
    scatter(4,mean(collect8(:,1)),14,"black","filled")
    ee=std(collect8(:,1))/sqrt(size(collect8(:,1),1));
    plot([4,4],mean(collect8(:,1))+[ee,-ee],"Color",[0 0 0])
    X=[X,collect8(:,1)'*0+4];
    Y=[Y,collect8(:,1)'];
Xreward=X;Yreward=Y;
temp=randsample([collect1(:,2);collect2(:,2);collect4(:,2);collect8(:,2)],100,'false');
xx=[1,4]
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(length(temp)); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','r')
xlim([0.4,4.6])
xticks([1:4])
ylim([-0.2 1])


hold on
plot([1 2 3 4],[mean(collect1(:,1)),mean(collect2(:,1)),mean(collect4(:,1)),mean(collect8(:,1))])
minuswithinday_ACC_reward=collect1(:,1)-nanmean(WithinDayControl{1}{1,k});

[p12,h]=ranksum(collect1(:,1),collect2(:,1))
[p14,h]=ranksum(collect1(:,1),collect4(:,1))
[p18,h]=ranksum(collect1(:,1),collect8(:,1))
