




clear
clc
close all
 load('Fig3CD.mat')
 temp=TheOverallInfor{5, 1} 

%%
h=imagesc(temp)
set(h,'alphadata',~isnan(temp))


%%
figure
temp=abs(TheOverallInfor{5, 1});
tempp=temp./temp;
%temp(isnan(temp))=0;
[a,b]=sort(nansum(tempp,2),'descend');
h=imagesc(temp(b,b))
set(h,'alphadata',~isnan(temp(b,b)))

