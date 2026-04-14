

load("SFig10D.mat")

%% 1
[p,t,s]=anova1(tempA(:,15),TypeA)
% tempp=delta(:,3:6);
% tempp=sqrt(sum(tempp.*tempp,2));
% [p,t,s]=anova1(tempp,TypeA)


s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,140,140])
multcompare(s)
%% 2
[p,t,s]=anova1(tempA(:,16),TypeA)
% tempp=delta(:,3:6);
% tempp=sqrt(sum(tempp.*tempp,2));
% [p,t,s]=anova1(tempp,TypeA)


s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,140,140])
multcompare(s)
%% 3
[p,t,s]=anova1(tempA(:,17),TypeA)
% tempp=delta(:,3:6);
% tempp=sqrt(sum(tempp.*tempp,2));
% [p,t,s]=anova1(tempp,TypeA)


s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,140,140])
multcompare(s)
%% 4
[p,t,s]=anova1(tempA(:,18),TypeA)
% tempp=delta(:,3:6);
% tempp=sqrt(sum(tempp.*tempp,2));
% [p,t,s]=anova1(tempp,TypeA)


s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,140,140])
multcompare(s)

%% 5
%[p,t,s]=anova1(tempA(:,18),TypeA)
tempp=delta(:,3:6);
tempp=sqrt(sum(tempp.*tempp,2));
[p,t,s]=anova1(tempp,TypeA)


s.gnames={'P';'T';'L';'R';'N'}
[~,b]=sort(s.means,'descend');
s.means=s.means(b);
s.gnames=s.gnames(b);
s.n=s.n(b);
figure(Position=[100,100,140,140])
multcompare(s)
