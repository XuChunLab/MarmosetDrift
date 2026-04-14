


clear
clc
close all
load('m250916_allcellsmatrics250909d03.mat')
setdiff(labels,0)

WCoding=allcellsmatrics(:,3:6);
WCoding=nthroot(WCoding,3);
MaxVector=max(WCoding);
MinVector=min(WCoding);
figure(Position=[100,100,1800,300])
hold on
for i=1:11
    for j=1:4
        temp=mean(WCoding(find(labels==i),j));
        if temp>0
            temp=temp/MaxVector(j);
            scatter(i,j,600*temp,"red","filled",'MarkerFaceAlpha',temp)
        else
            temp=temp/MinVector(j);
            scatter(i,j,600*temp,"green","filled",'MarkerFaceAlpha',temp)
        end
    end
end
hold off
xticks([1:11])
xlim([0,12])
ylim([0,5])