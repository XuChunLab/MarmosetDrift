





clc
clear
close all
load('m250924GetTheOverallInfor.mat')
load('m250916_allcellsmatrics250909d03.mat')

%BrainAreaA-BrainAreaB
BrainArea([find(BrainArea==1);find(BrainArea==2);find(BrainArea==10)])=1; % acc
BrainArea([find(BrainArea==3);find(BrainArea==4);find(BrainArea==9);find(BrainArea==13)])=2; %pfc
BrainArea([find(BrainArea==5);find(BrainArea==7);find(BrainArea==8);find(BrainArea==11)])=3;  %hpc
BrainArea([find(BrainArea==6);find(BrainArea==12)])=4; %a1

% step 1, calculate the CPs and put them on to the allcellsmatrics
tempSessionId=allcellsmatrics(:,1)+allcellsmatrics(:,2)*10;
for i=1:size(TheOverallInfor,2)
if size(TheOverallInfor{5,i},1)<10 || size(TheOverallInfor{5,i},1)~=length(find(tempSessionId==TheOverallInfor{1,i}))
    'bad'
    TheOverallInfor{1,i}
end
end

allcellsmatrics=[allcellsmatrics,zeros(2687,4)*nan];
for i=1:23 % the upper part is the hint
    tempConnectionMatricx=TheOverallInfor{5,i};
    % outR inR connecR sS
    tempConnectionMatricx=abs(tempConnectionMatricx);
    tempConnectionMatricx(isnan(tempConnectionMatricx))=0;
    tempConnectionMatricx(tempConnectionMatricx>0)=1;
    tempoutR = sum(tempConnectionMatricx,2)/size(TheOverallInfor{5,i},1);
    tempinR  = sum(tempConnectionMatricx)'/size(TheOverallInfor{5,i},1);
    tempconnecR=tempoutR+tempinR;
    tempsS=(tempoutR-tempinR)./tempconnecR;
    temp=[tempoutR,tempinR,tempconnecR,tempsS];
    allcellsmatrics(find(tempSessionId==TheOverallInfor{1,i}),15:18)=temp;
end

%%  
CrossDay=1
tempA=[]
tempB=[]
BrainAreaA=[];
BrainAreaB=[];



for i=1:10
    for j=1:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=CrossDay
            temppaires=RegesterMZ{i,j};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
                end
            end
        end
    end
end
for i=11:23
    for j=11:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=CrossDay
            temppaires=RegesterXM{i-10,j-10};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
                end
            end
        end
    end
end
delta=tempB-tempA;



temp=find(BrainAreaA==1);
temp=setdiff(1:length(BrainAreaA),temp); 
tempA(temp,:)=[];
tempB(temp,:)=[];
delta(temp,:)=[];





%% 
close all
clc
tempp=delta(:,3:6);tempp=sqrt(sum(tempp.*tempp,2));

figure
scatter(tempA(:,17),tempp)
[k,r]=corr(tempA(:,17),tempp,"rows","complete")

figure(Position=[100,100,900,400])

subplot(141),hold on
scatter(tempA(:,15),tempp,16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(tempA(:,15),tempp)
[rho,p]=corr(tempA(:,15),tempp,"rows","complete");
text(0.01,10,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([0 15])

subplot(142),hold on
scatter(tempA(:,16),tempp,16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(tempA(:,16),tempp)
[rho,p]=corr(tempA(:,16),tempp,"rows","complete");
text(0.01,10,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([0 0.2])
ylim([0 15])

subplot(143),hold on
scatter(tempA(:,17),tempp,11,"black","filled","MarkerFaceAlpha",0.055)
HOLDONPlotLinearFittingWithShading(tempA(:,17),tempp)
[rho,p3]=corr(tempA(:,17),tempp,"rows","complete");
text(0.01,10,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])

hold on
temp=tempA(:,17);
for i=0.01:0.02:0.19
    k=tempp(intersect(find(temp<=i+0.01),find(temp>i-0.01)));
    scatter(i,mean(k),18,"black","filled")
    ee=std(k)/sqrt(length(k));
    plot([i,i],[ee,-ee]+mean(k),"Color",[0 0 0])
end

xlim([0 0.2])
ylim([0 15])

subplot(144),hold on
scatter(tempA(:,18),tempp,16,"black","filled","MarkerFaceAlpha",0.1)
HOLDONPlotLinearFittingWithShading(tempA(:,18),tempp)
[rho,p]=corr(tempA(:,18),tempp,"rows","complete");
text(-0.4,10,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
xlim([-0.5 0.5])
ylim([0 15])