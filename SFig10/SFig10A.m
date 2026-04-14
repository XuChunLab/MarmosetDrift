




%% SFig10A

clear
clc
close all
load('SFig10A.mat')


%% pie chart 
figure(Position=[0 0 800 300])
for brainareai=1:4
[a,b]=max(abs(allcellsmatrics(find(BrainArea==brainareai),3:6))');
temp=allcellsmatrics(find(BrainArea==brainareai),7:10)';
for i=1:size(temp,2)
    b(i)=(temp(b(i),i)>0)*b(i);
end
subplot(1,4,brainareai)
pie([length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))])
end

%% bar plot
figure(Position=[0 0 500 300])
for brainareai=1:4
    subplot(1,4,brainareai)
    hold on
    temp=allcellsmatrics(find(BrainArea==brainareai),7:10);
    temp=sum((temp>0))/size(temp,1);
    for i=1:4
        plot([i,i],[0 temp(i)],"LineWidth",3)
    end
    ylim([0 1])
    xlim([0.4 4.6])
end

%% chi squre test

figure(Position=[0 0 800 300])

[a,b]=max(abs(allcellsmatrics(find(BrainArea<=2),3:6))');
temp=allcellsmatrics(find(BrainArea<=2),7:10)';
for i=1:size(temp,2)
    b(i)=(temp(b(i),i)>0)*b(i);
end
subplot(1,4,2)
pie([length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))])
piechart2=[length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))];

[a,b]=max(abs(allcellsmatrics(find(BrainArea==3),3:6))');
temp=allcellsmatrics(find(BrainArea==3),7:10)';
for i=1:size(temp,2)
    b(i)=(temp(b(i),i)>0)*b(i);
end
subplot(1,4,3)
pie([length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))])
piechart3=[length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))];

[a,b]=max(abs(allcellsmatrics(find(BrainArea==4),3:6))');
temp=allcellsmatrics(find(BrainArea==4),7:10)';
for i=1:size(temp,2)
    b(i)=(temp(b(i),i)>0)*b(i);
end
subplot(1,4,4)
pie([length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))])
piechart4=[length(find(b==1)),length(find(b==2)),length(find(b==3)),length(find(b==4)),length(find(b==0))];

variablei=4 % 1 2 3 or 4 ！
[h, p23, chi2stat] = chi2gof_contingency([piechart2(variablei), sum(piechart2)-piechart2(variablei); piechart3(variablei), sum(piechart3)-piechart3(variablei)])
[h, p34, chi2stat] = chi2gof_contingency([piechart3(variablei), sum(piechart3)-piechart3(variablei); piechart4(variablei), sum(piechart4)-piechart4(variablei)])
[h, p24, chi2stat] = chi2gof_contingency([piechart2(variablei), sum(piechart2)-piechart2(variablei); piechart4(variablei), sum(piechart4)-piechart4(variablei)])
