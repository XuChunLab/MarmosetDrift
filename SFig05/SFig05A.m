



%% SFig05A

clear
clc
close all
load("SFig05A.mat")

 %% 1
 [p,t,s]=anova1([minuswithinday_A1_press;minuswithinday_ACC_press;minuswithinday_HPC_press],[minuswithinday_A1_press*0+1;minuswithinday_ACC_press*0+2;minuswithinday_HPC_press*0+3])
multcompare(s)



 [rho,p]=corr( [minuswithinday_A1_press*0+1;minuswithinday_ACC_press*0+2;minuswithinday_HPC_press*0+3]...
     ,[minuswithinday_A1_press;minuswithinday_ACC_press;minuswithinday_HPC_press],'type','Spearman')
  
%% 2

 [rho,p]=corr( [minuswithinday_A1_tone*0+1;minuswithinday_ACC_tone*0+2;minuswithinday_HPC_tone*0+3]...
     ,[minuswithinday_A1_tone;minuswithinday_ACC_tone;minuswithinday_HPC_tone],'type','Spearman')


 %% 3

 [rho,p]=corr( [minuswithinday_A1_lick*0+1;minuswithinday_ACC_lick*0+2;minuswithinday_HPC_lick*0+3]...
     ,[minuswithinday_A1_lick;minuswithinday_ACC_lick;minuswithinday_HPC_lick],'type','Spearman')

  %% 4

 [rho,p]=corr( [minuswithinday_A1_reward*0+1;minuswithinday_ACC_reward*0+2;minuswithinday_HPC_reward*0+3]...
     ,[minuswithinday_A1_reward;minuswithinday_ACC_reward;minuswithinday_HPC_reward],'type','Spearman')
