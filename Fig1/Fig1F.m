clear
close all
load('Fig1F.mat')

tempp=[]
for i=1
    tempp=[tempp;collection{1,i}]
end
mean(tempp) %0.5624 +-  0.0201
std(tempp)/sqrt(length(tempp))


tempp=[]
for i=2:3
    tempp=[tempp;collection{1,i}]
end
mean(tempp) % 0.4516 +-  0.0267
std(tempp)/sqrt(length(tempp))


tempp=[]
for i=4:7
    tempp=[tempp;collection{1,i}]
end
mean(tempp) %  0.4497 +-  0.0212
std(tempp)/sqrt(length(tempp))

tempp=[]
for i=8:15
    tempp=[tempp;collection{1,i}]
end
mean(tempp) %   0.3951 +-  0.0180
std(tempp)/sqrt(length(tempp))

figure(Position=[100,100,300,300])
hold on
plot([1,1],[0,0.5624],LineWidth=5)
plot([1,1],0.5624+[-0.0201,0.0201])

plot([2,2],[0,0.4516],LineWidth=5)
plot([2,2],0.4516+[-0.0267,0.0267])

plot([3,3],[0,0.4497],LineWidth=5)
plot([3,3],0.4497+[-0.0212,0.0212])

plot([4,4],[0,0.3951],LineWidth=5)
plot([4,4],0.3951+[-0.0180,0.0180])

xlim([0 5])
ylim([0 0.8])
yticks([0:0.2:0.8])
