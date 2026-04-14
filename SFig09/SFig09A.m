
%% FigS09A
clear
clc
close all

load('SFig09A.mat')

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

%  get the MIs-CPs of the A session and B session
CrossDay=1
tempA=[]
tempB=[]
BrainAreaA=[];
BrainAreaB=[];
% this is the special code added 251014


for i=1:10
    for j=1:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})==CrossDay %&& (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=16
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
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})==CrossDay %&& (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=16
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

temp=tempA(:,3:6);
temp=sqrt(sum(temp.*temp,2));
figure(Position=[100,100,900,400])
for i=1:4
    tempp=delta(:,14+i);
    subplot(1,4,i),hold on
    scatter(temp,tempp,"black","filled","MarkerFaceAlpha",0.1)
    HOLDONPlotLinearFittingWithShading(temp,tempp)
    [rho,p]=corr(temp,tempp,"rows","complete");
    xlim([0 20])
    ylim([-0.1 0.1])
    text(1,0.05,['rho=',num2str(round(rho,3)),' p=',num2str(round(p,3))])
end
ylim([-1 1])