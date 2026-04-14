






%% fig 5I
close all
clear
clc

load('m250910CorssDayAndCrossAnimalRotation_ForAll.mat')
load('m250924GetTheOverallInfor.mat', 'TheOverallInfor')
reservedTheOverallInfor=TheOverallInfor;
TheOverallInfor(:,[5,6,7,11:26])=[];

collect=[]
withinsession=[]
chancelevel=[]
for i=1:7
    for j=(i+1):7
        temp=TheOverallInfor{5,i};
        temp=1-(sum(sum(isnan(temp)))/numel(temp));
        tempp=mainexample{i,j};
        sessionaprt=TheOverallInfor{3,j}-TheOverallInfor{3,i};
        temp=[temp,mean(tempp(find(tempp(:,1)==1),2));temp,mean(tempp(find(tempp(:,1)==3),2));temp,mean(tempp(find(tempp(:,1)==5),2));temp,mean(tempp(find(tempp(:,1)==7),2))];
        temp=[sessionaprt*ones(4,1),temp];
        collect=[collect;temp];
        chancelevel=[chancelevel;mean(tempp(find(tempp(:,1)==2),2));mean(tempp(find(tempp(:,1)==4),2));mean(tempp(find(tempp(:,1)==6),2));mean(tempp(find(tempp(:,1)==8),2))]
    end

    tempp=mainexample{i,i};
    withinsession=[withinsession;mean(tempp(find(tempp(:,1)==1),2));mean(tempp(find(tempp(:,1)==3),2));mean(tempp(find(tempp(:,1)==5),2));mean(tempp(find(tempp(:,1)==7),2))];


end

figure
scatter(collect(:,2),collect(:,3))
[rho,p]=corr(collect(:,2),collect(:,3))

figure(Position=[100,100,330,400])

subplot(122),hold on

temp=intersect(find(collect(:,1)>=1),find(collect(:,1)<2));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0 0.4470 0.7410],"MarkerFaceAlpha",0.5)
[rho1,p1]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.4940 0.1840 0.5560]);

temp=mean(collect(temp,3));
plot([0,1],[temp,temp],"Color",[0 0.4470 0.7410])

temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<4));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho2,p2]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.8500 0.3250 0.0980]);

temp=intersect(find(collect(:,1)>=8),find(collect(:,1)<16));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho8,p8]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.4660 0.6740 0.1880]);

temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<16));
[rho248,p248]=corr(collect(temp,2),collect(temp,3))
y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
plot([0.03;0.05], y_fit,"Color",[0.4940 0.1840 0.5560]);
temp=mean(collect(temp,3));
plot([0,1],[temp,temp],"Color",[0.4940 0.1840 0.5560])



xlim([0.032,0.042])
ylim([0.00,0.6])





subplot(121),hold on
temp=mean(withinsession);
plot([0,3],[temp,temp])
temp=std(withinsession)/sqrt(length(withinsession));
plot([1,1],mean(withinsession)+[temp,-temp])
temp=mean(chancelevel);
plot([0,3],[temp,temp])
temp=std(chancelevel)/sqrt(length(chancelevel));
plot([1,1],mean(chancelevel)+[temp,-temp])

temp=intersect(find(collect(:,1)>=1),find(collect(:,1)<2));
Y=collect(temp,3);
scatter(1,mean(Y),9,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([1,1],mean(Y)+[ee,-ee],"Color",[0 0.4470 0.7410])
Y1=Y;
temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<16));
Y=collect(temp,3);
scatter(2,mean(Y),9,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([2,2],mean(Y)+[ee,-ee],"Color",[0.4940 0.1840 0.5560])
Y248=Y;
ranksum(Y1,Y248)
ylim([0.00,0.6])
xlim([0 3])


%% J

close all
clear
clc

load('m250910RegisterCorssDayAndCrossAnimal_forAll.mat')
load('m250924GetTheOverallInfor.mat', 'TheOverallInfor')
reservedTheOverallInfor=TheOverallInfor;
TheOverallInfor(:,[5,6,7,11:26])=[];


collect=[]
withinsession=[];
chancelevel=[];
for i=1:7
    for j=(i+1):7
        temp=TheOverallInfor{5,i};
        temp=1-(sum(sum(isnan(temp)))/numel(temp));
        tempp=mainexample{i,j};
        sessionaprt=TheOverallInfor{3,j}-TheOverallInfor{3,i};
        temp=[temp,mean(tempp(:,1))];
        temp=[sessionaprt,temp];
        collect=[collect;temp];
        chancelevel=[chancelevel;mean(tempp(:,2))];
    end

tempp=mainexample{i,i};
withinsession=[withinsession;mean(tempp(:,1))];

end
figure
scatter(collect(:,2),collect(:,3))
[rho,p]=corr(collect(:,2),collect(:,3))


figure(Position=[100,100,330,400])

subplot(122),hold on

temp=intersect(find(collect(:,1)>=1),find(collect(:,1)<2));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0 0.4470 0.7410],"MarkerFaceAlpha",0.5)
[rho1,p1]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.4940 0.1840 0.5560]);

temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<4));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho2,p2]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.8500 0.3250 0.0980]);

% temp=intersect(find(collect(:,1)>=4),find(collect(:,1)<8));
% scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0 0.4470 0.7410],"MarkerFaceAlpha",0.5)
% [rho4,p4]=corr(collect(temp,2),collect(temp,3))
% y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
% plot([0.03;0.05], y_fit,"Color",[0 0.4470 0.7410]);

temp=intersect(find(collect(:,1)>=8),find(collect(:,1)<16));
scatter(collect(temp,2),collect(temp,3),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho8,p8]=corr(collect(temp,2),collect(temp,3))
%y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
%plot([0.03;0.05], y_fit,"Color",[0.4660 0.6740 0.1880]);

temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<16));
[rho248,p248]=corr(collect(temp,2),collect(temp,3))
y_fit=polyval(polyfit(collect(temp,2),collect(temp,3), 1), [0.03;0.05]);
plot([0.03;0.05], y_fit,"Color",[0 0 0]);

xlim([0.032,0.042])
ylim([0.00,1.5])



subplot(121),hold on
temp=mean(withinsession);
plot([0,3],[temp,temp])
temp=std(withinsession)/sqrt(length(withinsession));
plot([1,1],mean(withinsession)+[temp,-temp])
temp=mean(chancelevel);
plot([0,3],[temp,temp])
temp=std(chancelevel)/sqrt(length(chancelevel));
plot([1,1],mean(chancelevel)+[temp,-temp])


temp=intersect(find(collect(:,1)>=1),find(collect(:,1)<2));
Y=collect(temp,3);
scatter(1,mean(Y),9,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([1,1],mean(Y)+[ee,-ee],"Color",[0 0.4470 0.7410])
Y1=Y;
temp=intersect(find(collect(:,1)>=2),find(collect(:,1)<16));
Y=collect(temp,3);
scatter(2,mean(Y),9,"black","filled")
ee=std(Y)/sqrt(size(Y,1));
plot([2,2],mean(Y)+[ee,-ee],"Color",[0.4940 0.1840 0.5560])
Y248=Y;
ranksum(Y1,Y248)
ylim([0.00,1.5])
xlim([0 3])