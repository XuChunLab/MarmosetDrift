


clc
clear
close all
 load('FigS11.mat')




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
TypeA=[];
% this is the special code added 251014


for i=1:10
    for j=1:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=1 && (TheOverallInfor{3,i}-TheOverallInfor{3,j})>=1
            temppaires=RegesterMZ{i,j};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
TypeA=[TypeA;labels(temp2)];

                end
            end
        end
    end
end
for i=11:23
    for j=11:i
        if (TheOverallInfor{3,i}-TheOverallInfor{3,j})<=1 && (TheOverallInfor{3,i}-TheOverallInfor{3,j})>=1
            temppaires=RegesterXM{i-10,j-10};
            for k=1:size(temppaires,1)
                temp1=intersect(find(temppaires(k,2)==ids),find(tempSessionId==TheOverallInfor{1,i}));
                temp2=intersect(find(temppaires(k,1)==ids),find(tempSessionId==TheOverallInfor{1,j}));
                if length(temp1)==1 && length(temp2)==1
                tempB=[tempB;allcellsmatrics(temp1,:)];
                BrainAreaB=[BrainAreaB;BrainArea(temp1)];
                
                tempA=[tempA;allcellsmatrics(temp2,:)];
                BrainAreaA=[BrainAreaA;BrainArea(temp2)];
TypeA=[TypeA;labels(temp2)];
                end
            end
        end
    end
end
delta=tempB-tempA;

% temp=find(BrainAreaA==1);
% temp=setdiff(1:length(BrainAreaA),temp); % exclude other brain areas
% tempA(temp,:)=[];
% tempB(temp,:)=[];
% delta(temp,:)=[];

temp=find(TypeA==-1);
tempA(temp,:)=[];
tempB(temp,:)=[];
delta(temp,:)=[];
TypeA(temp,:)=[];


%% 1

[p,t,s]=anova1(tempA(:,15),TypeA)
% spectial
s.gnames=s.gnames([2 6 10 4 11 5 9 7 1 3 8])
%s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,200,400])
%figure(Position=[100,100,140,140])
multcompare(s)


tempp=tempA(:,15);
close all
tempcolor=labels;
for i=1:11
    %tempcolor(find(labels==i),1)=nanmean(tempA(find(TypeA==i),18));
    tempcolor(find(labels==i),1)=nanmean(tempp(find(TypeA==i)));
end



a=setdiff(1:2687,find(labels==-1));

figure('Position',[100 100 400 400])
scatter(mappedX(a,1), mappedX(a,2), 12, tempcolor(a),'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    text(temp(1),temp(2),num2str(i))
end

%% 2

[p,t,s]=anova1(tempA(:,16),TypeA)
% spectial
s.gnames=s.gnames([2 6 10 4 11 5 9 7 1 3 8])
%s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,200,400])
%figure(Position=[100,100,140,140])
multcompare(s)


tempp=tempA(:,16);
close all
tempcolor=labels;
for i=1:11
    %tempcolor(find(labels==i),1)=nanmean(tempA(find(TypeA==i),18));
    tempcolor(find(labels==i),1)=nanmean(tempp(find(TypeA==i)));
end



a=setdiff(1:2687,find(labels==-1));

figure('Position',[100 100 400 400])
scatter(mappedX(a,1), mappedX(a,2), 12, tempcolor(a),'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    text(temp(1),temp(2),num2str(i))
end
%% 3

[p,t,s]=anova1(tempA(:,17),TypeA)
% spectial
s.gnames=s.gnames([2 6 10 4 11 5 9 7 1 3 8])
%s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,200,400])
%figure(Position=[100,100,140,140])
multcompare(s)


tempp=tempA(:,17);
close all
tempcolor=labels;
for i=1:11
    %tempcolor(find(labels==i),1)=nanmean(tempA(find(TypeA==i),18));
    tempcolor(find(labels==i),1)=nanmean(tempp(find(TypeA==i)));
end



a=setdiff(1:2687,find(labels==-1));

figure('Position',[100 100 400 400])
scatter(mappedX(a,1), mappedX(a,2), 12, tempcolor(a),'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    text(temp(1),temp(2),num2str(i))
end


%% 4

[p,t,s]=anova1(tempA(:,18),TypeA)
% spectial
s.gnames=s.gnames([2 6 10 4 11 5 9 7 1 3 8])
%s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,200,400])
%figure(Position=[100,100,140,140])
multcompare(s)


tempp=tempA(:,18);

tempcolor=labels;
for i=1:11
    %tempcolor(find(labels==i),1)=nanmean(tempA(find(TypeA==i),18));
    tempcolor(find(labels==i),1)=nanmean(tempp(find(TypeA==i)));
end



a=setdiff(1:2687,find(labels==-1));

figure('Position',[100 100 400 400])
scatter(mappedX(a,1), mappedX(a,2), 12, tempcolor(a),'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    text(temp(1),temp(2),num2str(i))
end

%% 5
close all
%[p,t,s]=anova1(tempA(:,18),TypeA)
tempp=delta(:,3:6);
tempp=sqrt(sum(tempp.*tempp,2));
[p,t,s]=anova1(tempp,TypeA)


% spectial
s.gnames=s.gnames([2 6 10 4 11 5 9 7 1 3 8])
%s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,200,400])
%figure(Position=[100,100,140,140])
multcompare(s)





tempp=delta(:,3:6);
tempp=sqrt(sum(tempp.*tempp,2));

tempcolor=labels;
for i=1:11
    %tempcolor(find(labels==i),1)=nanmean(tempA(find(TypeA==i),18));
    tempcolor(find(labels==i),1)=nanmean(tempp(find(TypeA==i)));
end



a=setdiff(1:2687,find(labels==-1));

figure('Position',[100 100 400 400])
scatter(mappedX(a,1), mappedX(a,2), 12, tempcolor(a),'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    text(temp(1),temp(2),num2str(i))
end

