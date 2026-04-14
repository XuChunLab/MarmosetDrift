



%% SFig05B

clear
clc
close all
load("SFig05B.mat")

 %% 
 [p,t,s]=anova1([minuswthinday_Aud1;minuswthinday_ACC;minuswthinday_HPC], ...
     [minuswthinday_Aud1*0+1;minuswthinday_ACC*0+2;minuswthinday_HPC*0+3])
multcompare(s)


%%
 [rho,p]=corr( [minuswthinday_Aud1*0+1;minuswthinday_ACC*0+2;minuswthinday_HPC*0+3]...
     ,[minuswthinday_Aud1;minuswthinday_ACC;minuswthinday_HPC],'type','Spearman')
  
