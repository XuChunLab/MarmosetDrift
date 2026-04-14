

 load('Fig1B.mat')

 figure
 
 subplot(121)
 hold on
 for i=1:size(mzBehav,1)
     scatter([1,2,3],mzBehav(i,1:3)*100,26,[0,0,0],'filled','MarkerFaceAlpha',0.5)
     plot([1,2,3],mzBehav(i,1:3)*100,'Color',[0 0 0 0.5])
 end
 plot([1 1],[0 1]*mean(mzBehav(:,1))*100)
 plot([2 2],[0 1]*mean(mzBehav(:,2))*100)
 plot([3 3],[0 1]*mean(mzBehav(:,3))*100)
 hold off
 xlim([0.5,3.5])
 ylim([0,100])
 xticks([0.3,3.7])

 signrank(mzBehav(:,1),mzBehav(:,2))


 subplot(122)
 hold on
 for i=1:size(xmBehav,1)
     scatter([1,2,3],xmBehav(i,1:3)*100,26,[0,0,0],'filled','MarkerFaceAlpha',0.5)
     plot([1,2,3],xmBehav(i,1:3)*100,'Color',[0 0 0 0.5])
 end
 plot([1 1],[0 1]*mean(xmBehav(:,1))*100)
 plot([2 2],[0 1]*mean(xmBehav(:,2))*100)
 plot([3 3],[0 1]*mean(xmBehav(:,3))*100)
 hold off
 xlim([0.5,3.5])
 ylim([0,100])
 xticks([0.3,3.7])

 signrank(xmBehav(:,1),xmBehav(:,2))
