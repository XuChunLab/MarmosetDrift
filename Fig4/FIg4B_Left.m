



figure('Position',[100 100 400 400])
load('m250916_allcellsmatrics250909d03.mat')
scatter(mappedX(:,1), mappedX(:,2), 12, labels,'filled');
hold on
for i=1:max(labels)
    temp=find(labels==i);
    temp=mean(mappedX(temp,:));
    %text(temp(1),temp(2),num2str(i))
end