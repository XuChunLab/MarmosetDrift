




clear
clc
load('m250924GetTheOverallInfor.mat')
load('m250916_allcellsmatrics250909d03.mat')
sessionid=allcellsmatrics(:,1)+allcellsmatrics(:,2)*10;

% temp=zeros(2687,1);
% for i=1:2687
%     if sum(isnan(allcellsmatrics(i,7:10)))<4
%         [a,b]=max(abs(allcellsmatrics(i,3:6)));
%         temp(i)=b;
%     end
% end
% labels=temp; % 251211   %% !! change here to shift classicalType or NewType 
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

TypeDriftAndTheNetworkDensityFrame=[];

for dayearlyi=1:10
    for daylatei=dayearlyi:10
        if length(RegesterMZ{daylatei,dayearlyi})>=13 % a preamter can change
            registerframe=RegesterMZ{daylatei,dayearlyi};
            tempday1ids=ids(find(sessionid==TheOverallInfor{1,dayearlyi}));
            tempday2ids=ids(find(sessionid==TheOverallInfor{1,daylatei}));
            tempday1labels=labels(find(sessionid==TheOverallInfor{1,dayearlyi}));
            tempday2labels=labels(find(sessionid==TheOverallInfor{1,daylatei}));
            newframe=[];
            for i=1:length(registerframe)
                if length(find(tempday1ids==registerframe(i,1)))==1 && length(find(tempday2ids==registerframe(i,2)))==1% && registerframe(i,1)>=30000% aud1         %251105 change here!
                    newframe=[newframe;[find(tempday1ids==registerframe(i,1)),find(tempday2ids==registerframe(i,2))]];
                end
            end
            if length(newframe)>=5
                temp=[TheOverallInfor{1,dayearlyi},TheOverallInfor{1,daylatei},TheOverallInfor{3,daylatei}-TheOverallInfor{3,dayearlyi}];
                tempconnectionmatri=TheOverallInfor{5,dayearlyi}(newframe(:,1),newframe(:,1));
                temp=[temp,1-sum(sum(isnan(tempconnectionmatri)))/numel(tempconnectionmatri)];
                templabelsearly=tempday1labels(newframe(:,1));
                templabelslate=tempday2labels(newframe(:,2));
                temp=[temp,sum((templabelsearly-templabelslate)==0)/length(newframe)];
                TypeDriftAndTheNetworkDensityFrame=[TypeDriftAndTheNetworkDensityFrame;temp];
            end
        end
    end
end

for dayearlyi=11:23
    for daylatei=dayearlyi:23
        if length(RegesterXM{daylatei-10,dayearlyi-10})>=13 % a preamter can change
            registerframe=RegesterXM{daylatei-10,dayearlyi-10};
            tempday1ids=ids(find(sessionid==TheOverallInfor{1,dayearlyi}));
            tempday2ids=ids(find(sessionid==TheOverallInfor{1,daylatei}));
            tempday1labels=labels(find(sessionid==TheOverallInfor{1,dayearlyi}));
            tempday2labels=labels(find(sessionid==TheOverallInfor{1,daylatei}));
            newframe=[];
            for i=1:length(registerframe)
                if length(find(tempday1ids==registerframe(i,1)))==1 && length(find(tempday2ids==registerframe(i,2)))==1% && registerframe(i,1)>=30000% aud1         %251105 change here!
                    newframe=[newframe;[find(tempday1ids==registerframe(i,1)),find(tempday2ids==registerframe(i,2))]];
                end
            end
            if length(newframe)>=5
                temp=[TheOverallInfor{1,dayearlyi},TheOverallInfor{1,daylatei},TheOverallInfor{3,daylatei}-TheOverallInfor{3,dayearlyi}];
                tempconnectionmatri=TheOverallInfor{5,dayearlyi}(newframe(:,1),newframe(:,1));
                temp=[temp,1-sum(sum(isnan(tempconnectionmatri)))/numel(tempconnectionmatri)];
                templabelsearly=tempday1labels(newframe(:,1));
                templabelslate=tempday2labels(newframe(:,2));
                temp=[temp,sum((templabelsearly-templabelslate)==0)/length(newframe)];
                TypeDriftAndTheNetworkDensityFrame=[TypeDriftAndTheNetworkDensityFrame;temp];
            end
        end
    end
end

%% right
figure(Position=[100,100,550,400])
subplot(122), hold on
onesessionaprt=TypeDriftAndTheNetworkDensityFrame(find(TypeDriftAndTheNetworkDensityFrame(:,3)<=1),:)
scatter(onesessionaprt(:,4),onesessionaprt(:,5),28,"filled","MarkerFaceColor",[0 0.4470 0.7410],"MarkerFaceAlpha",0.5)
[rho1,p1]=corr(onesessionaprt(:,4),onesessionaprt(:,5))
y_fit=polyval(polyfit(onesessionaprt(:,4),onesessionaprt(:,5), 1), [0;0.1]);
%plot([0;0.1], y_fit,"Color",[0 0.4470 0.7410]);
temp1=onesessionaprt(:,5);

temp=intersect(find(TypeDriftAndTheNetworkDensityFrame(:,3)<=3),find(TypeDriftAndTheNetworkDensityFrame(:,3)>=2))
onesessionaprt=TypeDriftAndTheNetworkDensityFrame(temp,:)
%figure
scatter(onesessionaprt(:,4),onesessionaprt(:,5),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho2,p2]=corr(onesessionaprt(:,4),onesessionaprt(:,5))
y_fit=polyval(polyfit(onesessionaprt(:,4),onesessionaprt(:,5), 1), [0;0.1]);
%plot([0;0.1], y_fit,"Color",[0.8500 0.3250 0.0980]);
length(temp)
temp2=onesessionaprt(:,5);


temp=intersect(find(TypeDriftAndTheNetworkDensityFrame(:,3)<=7),find(TypeDriftAndTheNetworkDensityFrame(:,3)>=4))
onesessionaprt=TypeDriftAndTheNetworkDensityFrame(temp,:)
%figure
scatter(onesessionaprt(:,4),onesessionaprt(:,5),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho3,p3]=corr(onesessionaprt(:,4),onesessionaprt(:,5))
y_fit=polyval(polyfit(onesessionaprt(:,4),onesessionaprt(:,5), 1), [0;0.1]);
%plot([0;0.1], y_fit,"Color",[0 0.4470 0.7410]);
length(temp)
temp3=onesessionaprt(:,5);

temp=intersect(find(TypeDriftAndTheNetworkDensityFrame(:,3)<=15),find(TypeDriftAndTheNetworkDensityFrame(:,3)>=8))
onesessionaprt=TypeDriftAndTheNetworkDensityFrame(temp,:)
%figure
scatter(onesessionaprt(:,4),onesessionaprt(:,5),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560],"MarkerFaceAlpha",0.5)
[rho4,p4]=corr(onesessionaprt(:,4),onesessionaprt(:,5))
y_fit=polyval(polyfit(onesessionaprt(:,4),onesessionaprt(:,5), 1), [0;0.1]);
%plot([0;0.1], y_fit,"Color",[0.4660 0.6740 0.1880]);
temp4=onesessionaprt(:,5);

temp=intersect(find(TypeDriftAndTheNetworkDensityFrame(:,3)<=15),find(TypeDriftAndTheNetworkDensityFrame(:,3)>=2))
onesessionaprt=TypeDriftAndTheNetworkDensityFrame(temp,:)
[rho248,p248]=corr(onesessionaprt(:,4),onesessionaprt(:,5))
y_fit=polyval(polyfit(onesessionaprt(:,4),onesessionaprt(:,5), 1), [0;0.1]);
plot([0;0.1], y_fit,"Color",[0.4940 0.1840 0.5560]);

xlim([0 0.1])
ylim([0.0 0.8])
yticks([0:0.2:0.8])

%% left

subplot(121), hold on
    scatter(1,mean(temp1),28,"filled","MarkerFaceColor",[0 0.4470 0.7410]) %
    ee=std(temp1)/sqrt(size(temp1,1));
    plot([1,1],mean(temp1)+[ee,-ee],"Color",[0 0.4470 0.7410])

temp=[temp2;temp3;temp4];
    scatter(2,mean(temp),28,"filled","MarkerFaceColor",[0.4940 0.1840 0.5560])
    ee=std(temp)/sqrt(size(temp,1));
    plot([2,2],mean(temp)+[ee,-ee],"Color",[0.4940 0.1840 0.5560])
    
    [P,H]=ranksum(temp,temp1)

ylim([0 0.8])
xlim([0 5])
yticks([0:0.2:0.8])

temp=ones(1,10);
for i=1:10
    templable=randsample(labels,100,false);
    temp(i)=sum(templable(randperm(100))==templable)/100;
end
xx=[1,4];
yy=mean(temp); yy=[yy,yy];
ee=std(temp)/sqrt(10); ee=[ee,ee];
shadedErrorBar(xx,yy,ee,'lineprops','k')

ranksum(temp1,temp2)

% ylim([0.1 0.9])
% yticks([0.1:0.2:0.9])