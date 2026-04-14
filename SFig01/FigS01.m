
%% X:\weichuanyao\Analyse\SoundLocation250807\Mfig_FunctionalAltlas250909\m250911PoolAllToDefineTypes.m

load('m250916_allcellsmatrics250909d03.mat')
% mz-Uf-lACC  01
% mz-Uf-rACC  02
% mz-Uf-lPFC  03
% mz-Uf-rPFC  04
% mz-Uf-HPC   05
% mz-Uf-A1    06
% mz-Tr-HPC   07
% xm-Tr-HPC   08
% xm-Tr-PFC   09
% xm-Uf-ACC   10
% xm-Uf-HPC   11
% xm-Uf-A1    12
% xm-Uf-PFC   13


temp=find(BrainArea==12);
length(temp)
length(setdiff(allcellsmatrics(temp,2),0))

