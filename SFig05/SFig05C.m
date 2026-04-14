



%% SFig05C

clear
clc
close all
load("SFig05C.mat")

 %% 
 [p,t,s]=anova1([minuswhitinday_Aud1;minuswhitinday_ACC;minuswhitinday_HPC], ...
     [minuswhitinday_Aud1*0+1;minuswhitinday_ACC*0+2;minuswhitinday_HPC*0+3])
multcompare(s)


%%
 [rho,p]=corr( [minuswhitinday_Aud1*0+1;minuswhitinday_ACC*0+2;minuswhitinday_HPC*0+3]...
     ,[minuswhitinday_Aud1;minuswhitinday_ACC;minuswhitinday_HPC],'type','Spearman')
  
