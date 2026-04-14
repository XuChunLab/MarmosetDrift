

clear
load('Fig3H.mat')

fold=3;
sessionAparti=1;
TrainATeOnB=[];
networkDensity=[];
for day1i=1:10
    for day2i=day1i:10
        sessionApart=TheOverallInfor{3,day2i}-TheOverallInfor{3,day1i};
        if sessionApart>sessionAparti && size(PopuDecodeEventsTypeMZ{day2i,day1i},1)==1
            TrainATeOnB=[TrainATeOnB;PopuDecodeEventsTypeMZ{day2i,day1i}{1,3}(:)];
            networkDensity=[networkDensity;ones(fold*fold,1)*PopuDecodeEventsTypeMZ{day2i,day1i}{1,5}];
        end
    end
end
for day1i=1:13
    for day2i=day1i:13
        sessionApart=TheOverallInfor{3,day2i+10}-TheOverallInfor{3,day1i+10};
        if sessionApart>sessionAparti && size(PopuDecodeEventsTypeXM{day2i,day1i},1)==1
            TrainATeOnB=[TrainATeOnB;PopuDecodeEventsTypeXM{day2i,day1i}{1,3}(:)];
            networkDensity=[networkDensity;ones(fold*fold,1)*PopuDecodeEventsTypeXM{day2i,day1i}{1,5}];
        end
    end
end

figure(Position=[100,100,900,400])
subplot(141),hold on
scatter(networkDensity,TrainATeOnB,30,"black","filled","MarkerFaceAlpha",0.3)
HOLDONPlotLinearFittingWithShading(networkDensity,TrainATeOnB) 
[rho,p]=corr(networkDensity,TrainATeOnB)
%subplot(142)
