

clear
clc
close all
load('allcellsmatrics250829d04.mat')
BrainArea([find(BrainArea==1);find(BrainArea==2);find(BrainArea==10)])=1; % acc
BrainArea([find(BrainArea==3);find(BrainArea==4);find(BrainArea==9);find(BrainArea==13)])=2; %pfc
BrainArea([find(BrainArea==5);find(BrainArea==7);find(BrainArea==8);find(BrainArea==11)])=3;  %hpc
BrainArea([find(BrainArea==6);find(BrainArea==12)])=4; %a1

%% 
 UnionMap=zeros(4,15);
 for i=1:4
     temp1=find(BrainArea==i);
     for j=1:15
         temp2=find(labels==j);
         UnionMap(i,j)=length(intersect(temp1,temp2));
     end
 end
 figure
 subplot(211)
 h=heatmap(UnionMap)
 %sum(UnionMap,2)
 subplot(212)
 temp=UnionMap./repmat(sum(UnionMap,2),1,15);
 g=heatmap(temp)
 %colormap('jet')