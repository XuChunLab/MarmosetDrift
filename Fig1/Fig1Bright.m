
%% monkey F
temp1=[0.950530035335689
0.949152542372881
0.958041958041958
0.951515151515152
0.900000000000000
0.863192182410424]
temp2=[
0.924000000000000
0.912442396313364
0.904564315352697
0.927659574468085]
[p,h]=ranksum(temp1,temp2)

figure,hold on
scatter(temp1*0+1,temp1,9,"black","filled")
scatter(temp2*0+2,temp2,9,"black","filled")
plot([1,1],[0,mean(temp1)])
plot([2,2],[0,mean(temp2)])
xlim([0,3])
ylim([0.8,1.0])

%% monkey M
temp1=[0.676165803108808
0.550761421319797
0.871794871794872
0.825641025641026
0.788732394366197
0.894495412844037
0.926470588235294]
temp2=[
0.969040247678019
0.895027624309392
0.968992248062015
0.984555984555985
0.837579617834395
0.764705882352941
]
[p,h]=ranksum(temp1,temp2)
figure,hold on
scatter(temp1*0+1,temp1,9,"black","filled")
scatter(temp2*0+2,temp2,9,"black","filled")
plot([1,1],[0,mean(temp1)])
plot([2,2],[0,mean(temp2)])
xlim([0,3])
ylim([0.5,1.0])