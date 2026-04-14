



clear
clc
close all

load('CustomColormapRandG.mat')
load('m250916_allcellsmatrics250909d03.mat')
X=allcellsmatrics(:,3:6);

figure('Position',[0 0 1720 610])
for i=1:4
    subplot(2,5,i)
    %labels=log10(X(:,i));labels(labels<=-1.2)=-1.2;
    labels=nthroot(X(:,i), 3);
    labels(find(labels>0))=labels(find(labels>0))/max(labels);
    labels(find(labels<0))=-labels(find(labels<0))/min(labels);
    scatter(mappedX(:,1), mappedX(:,2), 12, labels,'filled');
    colormap(CustomColormapRandG)
    %ylim([-20 30])
    %xlim([-30 30])
end




Mat_tao=allcellsmatrics(:,7:10);
Mat_sigma=allcellsmatrics(:,11:14);
for i=1:4
    subplot(2,5,5+i)
    %labels=log10(X(:,i));labels(labels<=-1.2)=-1.2;
    labels=nthroot(X(:,i), 3);
    temp1=Mat_tao(:,i)';
    temp1=(temp1+rand(1,length(temp1))-14)*2*0.05;
    %temp1=(temp1-14)*2*0.05;
    temp2= Mat_sigma(:,i)';
    temp2=(temp2+rand(1,length(temp1)))*2*0.05;
    %temp2=(temp2)*2*0.05;
    scatter(temp1, temp2, 12, labels,'filled');
    xlim([-1.5 2])  %[-1.2,1.8]
    xticks([-1.5:0.5:2])
    ylim([0 1.5])
    %colormap("default")
end
%clear