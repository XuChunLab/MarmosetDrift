

clear
clc
close all
load('m251018TryTheDirectRepresentationDrift.mat')
MZ=load('m251030RepresenDriftInTraditionMethod_sourcedata_mz_ACC.mat') 
XM=load('m251030RepresenDriftInTraditionMethod_sourcedata_xm_ACC.mat')
load('m251018TryThePairewiseSimilaryDistanceMat_mz_ACC.mat', 'MZ_cp')
MZ.MZ_cp=MZ_cp
clear MZ_cp
load('m251018TryThePairewiseSimilaryDistanceMat_xm_ACC.mat', 'MZ_cp')
XM.MZ_cp=MZ_cp
clear MZ_cp
load('m251027RepresenDriftInTraditionMethod_sourcedataControl.mat')
%% press_TC

close all
k=4% dis2nor dis1nor theta corr cos_similarity
collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_press_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_press_TC{day2i,day1i}(:,k),MZ.MZ_press_TC{day2i,day1i}(:,k+5),MZ.MZ_cp{day2i,day1i}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_press_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_press_TC{day2i-10,day1i-10}(:,k),XM.MZ_press_TC{day2i-10,day1i-10}(:,k+5),XM.MZ_cp{day2i-10,day1i-10}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end

collect1=[collect2;collect4;collect8]; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

figure(Position=[100,100,900,400],Name='1press')
subplot(141),hold on
scatter(collect1(:,3),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,3),collect1(:,1))
[rho,p]=corr(collect1(:,3),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(142),hold on
scatter(collect1(:,4),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,4),collect1(:,1))
[rho,p]=corr(collect1(:,4),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(143),hold on
%scatter(collect1(:,5),collect1(:,1),11,"black","filled","MarkerFaceAlpha",0.055)
scatter(collect1(:,5),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,5),collect1(:,1))
[rho,p]=corr(collect1(:,5),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])


subplot(144),hold on
scatter(collect1(:,6),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,6),collect1(:,1))
[rho,p]=corr(collect1(:,6),collect1(:,1),"rows","complete")
text(-0.4,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([-0.5 0.5])
ylim([-0.5 1])


%%  tone_TC

%close all
k=4% dis2nor dis1nor theta corr cos_similarity
collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_press_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_tone_TC{day2i,day1i}(:,k),MZ.MZ_tone_TC{day2i,day1i}(:,k+5),MZ.MZ_cp{day2i,day1i}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_press_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_tone_TC{day2i-10,day1i-10}(:,k),XM.MZ_tone_TC{day2i-10,day1i-10}(:,k+5),XM.MZ_cp{day2i-10,day1i-10}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end

collect1=[collect2;collect4;collect8]; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


figure(Position=[100,100,900,400],Name='2tone')
subplot(141),hold on
scatter(collect1(:,3),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,3),collect1(:,1))
[rho,p]=corr(collect1(:,3),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(142),hold on
scatter(collect1(:,4),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,4),collect1(:,1))
[rho,p]=corr(collect1(:,4),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(143),hold on
scatter(collect1(:,5),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,5),collect1(:,1))
[rho,p]=corr(collect1(:,5),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(144),hold on
scatter(collect1(:,6),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,6),collect1(:,1))
[rho,p]=corr(collect1(:,6),collect1(:,1),"rows","complete")
text(-0.4,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([-0.5 0.5])
ylim([-0.5 1])

%%  lick_TC

%close all
k=4 % dis2nor dis1nor theta corr cos_similarity
collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_lick_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_lick_TC{day2i,day1i}(:,k),MZ.MZ_lick_TC{day2i,day1i}(:,k+5),MZ.MZ_cp{day2i,day1i}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_lick_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_lick_TC{day2i-10,day1i-10}(:,k),XM.MZ_lick_TC{day2i-10,day1i-10}(:,k+5),XM.MZ_cp{day2i-10,day1i-10}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end

collect1=[collect2;collect4;collect8]; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


figure(Position=[100,100,900,400],Name='3lick')
subplot(141),hold on
scatter(collect1(:,3),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,3),collect1(:,1))
[rho,p]=corr(collect1(:,3),collect1(:,1));
text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(142),hold on
scatter(collect1(:,4),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,4),collect1(:,1))
[rho,p]=corr(collect1(:,4),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(143),hold on
scatter(collect1(:,5),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,5),collect1(:,1))
[rho,p]=corr(collect1(:,5),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])


subplot(144),hold on
scatter(collect1(:,6),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,6),collect1(:,1))
[rho,p]=corr(collect1(:,6),collect1(:,1),"rows","complete")
text(-0.4,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([-0.5 0.5])
ylim([-0.5 1])

%% reward_TC

%close all
k=4 % dis2nor dis1nor theta corr cos_similarity
collect1=[]; collect2=[]; collect4=[]; collect8=[];
for day2i=1:10
    for day1i=1:(day2i-1)
        if size(MZ.MZ_reward_TC{day2i,day1i},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[MZ.MZ_reward_TC{day2i,day1i}(:,k),MZ.MZ_reward_TC{day2i,day1i}(:,k+5),MZ.MZ_cp{day2i,day1i}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
    end
end
for day2i=11:23
    for day1i=11:(day2i-1)
        if size(XM.MZ_reward_TC{day2i-10,day1i-10},1)>0
        sessionsaprt=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        temp=[XM.MZ_reward_TC{day2i-10,day1i-10}(:,k),XM.MZ_reward_TC{day2i-10,day1i-10}(:,k+5),XM.MZ_cp{day2i-10,day1i-10}];
        if sessionsaprt==1, collect1=[collect1;temp]; elseif sessionsaprt>=2 && sessionsaprt<4, collect2=[collect2;temp]; elseif sessionsaprt>=4 && sessionsaprt<8, collect4=[collect4;temp]; elseif sessionsaprt>=8 && sessionsaprt<16, collect8=[collect8;temp]; end
        end
   end
end

collect1=[collect2;collect4;collect8]; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

figure(Position=[100,100,900,400],Name='4reward')
subplot(141),hold on
scatter(collect1(:,3),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,3),collect1(:,1))
[rho,p]=corr(collect1(:,3),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(142),hold on
scatter(collect1(:,4),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,4),collect1(:,1))
[rho,p]=corr(collect1(:,4),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])

subplot(143),hold on
scatter(collect1(:,5),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,5),collect1(:,1))
[rho,p]=corr(collect1(:,5),collect1(:,1));text(0.01,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([-0.5 1])


subplot(144),hold on
scatter(collect1(:,6),collect1(:,1),16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(collect1(:,6),collect1(:,1))
[rho,p]=corr(collect1(:,6),collect1(:,1),"rows","complete")
text(-0.4,0.2,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([-0.5 0.5])
ylim([-0.5 1])