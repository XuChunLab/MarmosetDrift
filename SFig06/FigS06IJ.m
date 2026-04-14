



%% FigS06IJ

load('FigS06IJ.mat')
%% I (please try more times!)
temp=[]
tempsessionID=allcellsmatrics(:,1)+allcellsmatrics(:,2)*10;
matridistanc=zeros(2,23);
for i=1:23
    tempConnectionMatrix=TheOverallInfor{5,i};
    tempsession=allcellsmatrics(find(tempsessionID==TheOverallInfor{1,i}),:);
    tempConnectionMatrix(isnan(tempConnectionMatrix))=0;
    temp=[temp;[tempsession(:,3:6),tempConnectionMatrix'*tempsession(:,3:6)]];
    matridistanc(1,i)=mean(mean(abs(tempsession(:,3:6)-tempConnectionMatrix'*tempsession(:,3:6)),2));
    matridistanc(2,i)=mean(mean(abs(tempsession(randperm(size(tempsession,1)),3:6)-tempConnectionMatrix'*tempsession(:,3:6)),2));
end


figure
scatter([temp(:,1);temp(:,2);temp(:,3);temp(:,4)],[temp(:,5);temp(:,6);temp(:,7);temp(:,8)])
[rho,p1]=corr([temp(:,1);temp(:,2);temp(:,3);temp(:,4)],[temp(:,5);temp(:,6);temp(:,7);temp(:,8)],"rows","complete")
reserved1=temp;

temp=matridistanc(1,:)-matridistanc(2,:);
reserved2=temp;
[p2,h]=signrank(temp)
figure(Position=[100,100,400,300])
subplot(121)
hold on
boxplot(temp,temp*0+1,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
plot([0,2],[0,0])
scatter(temp*0+0.5+rand(1,23)/10,temp,32,"black","filled","MarkerFaceAlpha",0.6)
ylim([-2,2])

%% J (please try more times!)

temp=[]
tempsessionID=allcellsmatrics(:,1)+allcellsmatrics(:,2)*10;
matridistanc=zeros(2,23);
for i=1:23
    tempConnectionMatrix=TheOverallInfor{5,i};
    tempsession=allcellsmatrics(find(tempsessionID==TheOverallInfor{1,i}),:);
    tempConnectionMatrix(isnan(tempConnectionMatrix))=0;
    temp=[temp;[tempsession(:,3:6),tempConnectionMatrix*tempsession(:,3:6)]];
    matridistanc(1,i)=mean(mean(abs(tempsession(:,3:6)-tempConnectionMatrix*tempsession(:,3:6)),2));
    matridistanc(2,i)=mean(mean(abs(tempsession(randperm(size(tempsession,1)),3:6)-tempConnectionMatrix*tempsession(:,3:6)),2));
end

% figure
% scatter([temp(:,1);temp(:,2);temp(:,3);temp(:,4)],[temp(:,5);temp(:,6);temp(:,7);temp(:,8)])
[rho,p3]=corr([temp(:,1);temp(:,2);temp(:,3);temp(:,4)],[temp(:,5);temp(:,6);temp(:,7);temp(:,8)],"rows","complete")
reserved3=temp;

temp=matridistanc(1,:)-matridistanc(2,:);
reserved4=temp;
[p4,h]=signrank(temp)
subplot(122)
hold on
boxplot(temp,temp*0+1,'Colors','k','PlotStyle','compact','MedianStyle','line','Widths',0.20,'Symbol','k')
plot([0,2],[0,0])
scatter(temp*0+0.5+rand(1,23)/10,temp,32,"black","filled","MarkerFaceAlpha",0.6)
ylim([-2,2])
