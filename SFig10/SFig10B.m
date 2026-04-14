


clc
clear
close all
load('m250924GetTheOverallInfor.mat')
load('m250916_allcellsmatrics250909d03.mat')


temp=zeros(2687,1);
for i=1:2687
    if sum(isnan(allcellsmatrics(i,7:10)))<4
        [a,b]=max(abs(allcellsmatrics(i,3:6)));
        temp(i)=b;
    end
end
labels=temp; % 251211   %% !! change here to shift classicalType or NewType


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
labelsA=[];
labelsB=[];
% this is the special code added 251014


for i=1:10
    for j=1:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=1  %&&  (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=3% changed !!!!!!!!!!!!!!!
            temppaires=RegesterMZ{i,j};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                labelsB=[labelsB;labels(temp1)];
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
                labelsA=[labelsA;labels(temp2)];
                end
            end
        end
    end
end
for i=11:23
    for j=11:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=1 %&&  (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=3% changed !!!!!!!!!!!!!!!
            temppaires=RegesterXM{i-10,j-10};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                labelsB=[labelsB;labels(temp1)];
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
                labelsA=[labelsA;labels(temp2)];
                end
            end
        end
    end
end
delta=tempB-tempA;

resrvedlabelsA=labelsA;
resrvedlabelsB=labelsB;
%*****************************************************************************
% labelsA(find(labelsA==0))=5;
% labelsB(find(labelsB==0))=5;
% colName={'x1','x2','x3','x4','x0'};
% rowName={'y1','y2','y3','y4','y0'};
% dataMat=zeros(5,5);
% for coli=1:5
%     for rowi=1:5
%         dataMat(rowi,coli)=length(intersect(find(labelsA==coli),find(labelsB==rowi)));
%     end
% end
% dataMat=dataMat([5,4,3,2,1],:)
% rowName={'y0','y4','y3','y2','y1'};
% CC=chordChart(dataMat,'rowName',rowName,'colName',colName);
% CC=CC.draw()
% 
% CList = [0.93,0.60,0.62; 
%     0.55,0.80,0.99; 
%     0.95,0.82,0.18; 
%     1.00,0.81,0.91;
%     0.75,0.73,0.86;
%     0.56,0.83,0.78; 
%     0.00,0.60,0.20; 
%     1.00,0.49,0.02;
%     0.78,0.77,0.95; 
%     0.59,0.24,0.36; 
%     0.98,0.51,0.45; 
%     0.96,0.55,0.75;
%     0.47,0.71,0.84; 
%     0.65,0.35,0.16; 
%     0.40,0.00,0.64];
% 
% for i = 1:size(dataMat, 2)
%     CC.setSquareT_N(i, 'FaceColor',CList(i,:))
% end
% 
% CC.setSquareF_N(1, 'FaceColor',CList(5,:))
% CC.setSquareF_N(2, 'FaceColor',CList(4,:))
% CC.setSquareF_N(3, 'FaceColor',CList(3,:))
% CC.setSquareF_N(4, 'FaceColor',CList(2,:))
% CC.setSquareF_N(5, 'FaceColor',CList(1,:))
% 
% for i = 1:size(dataMat, 1)
%     for j = 1:size(dataMat, 2)
%         CC.setChordMN(i,j, 'FaceColor',CList(j,:), 'FaceAlpha',.4)
%     end
% end


%*****************************************************************************
labelsA(find(labelsA==0))=12;
labelsB(find(labelsB==0))=12;
colName={'x1','x2','x3','x4','x5','x6','x7','x8','x9','x10','x11','x0'};
%rowName={'y1','y2','y3','y4','y0'};
dataMat=zeros(5,5);
for coli=1:12
    for rowi=1:12
        dataMat(rowi,coli)=length(intersect(find(labelsA==coli),find(labelsB==rowi)));
    end
end
dataMat=dataMat([12,11,10,9,8,7,6,5,4,3,2,1],:)
rowName={'y0','y11','y10','y9','y8','y7','y6','y5','y4','y3','y2','y1'};
CC=chordChart(dataMat,'rowName',rowName,'colName',colName);
CC=CC.draw()

CList = [0.93,0.60,0.62; 
    0.55,0.80,0.99; 
    0.95,0.82,0.18; 
    1.00,0.81,0.91;
    0.75,0.73,0.86;
    0.56,0.83,0.78; 
    0.00,0.60,0.20; 
    1.00,0.49,0.02;
    0.78,0.77,0.95; 
    0.59,0.24,0.36; 
    0.98,0.51,0.45; 
    0.96,0.55,0.75;
    0.47,0.71,0.84; 
    0.65,0.35,0.16; 
    0.40,0.00,0.64];

for i = 1:size(dataMat, 2)
    CC.setSquareT_N(i, 'FaceColor',CList(i,:))
end

CC.setSquareF_N(1, 'FaceColor',CList(12,:))
CC.setSquareF_N(2, 'FaceColor',CList(11,:))
CC.setSquareF_N(3, 'FaceColor',CList(10,:))
CC.setSquareF_N(4, 'FaceColor',CList(9,:))
CC.setSquareF_N(5, 'FaceColor',CList(8,:))
CC.setSquareF_N(6, 'FaceColor',CList(7,:))
CC.setSquareF_N(7, 'FaceColor',CList(6,:))
CC.setSquareF_N(8, 'FaceColor',CList(5,:))
CC.setSquareF_N(9, 'FaceColor',CList(4,:))
CC.setSquareF_N(10, 'FaceColor',CList(3,:))
CC.setSquareF_N(11, 'FaceColor',CList(2,:))
CC.setSquareF_N(12, 'FaceColor',CList(1,:))


for i = 1:size(dataMat, 1)
    for j = 1:size(dataMat, 2)
        CC.setChordMN(i,j, 'FaceColor',CList(j,:), 'FaceAlpha',.4)
    end
end



labelsA=resrvedlabelsA;
labelsB=resrvedlabelsB;