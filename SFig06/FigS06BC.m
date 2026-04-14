

%% FigS06B

load("FigS06BC.mat")
figure
h = imagesc(sourcetarget)
set(h,'alphadata',~isnan(sourcetarget))

[a,b]=sort(sum(sourcetarget,2),'descend')
figure
h = imagesc(sourcetarget(b,b))
set(h,'alphadata',~isnan(sourcetarget(b,b)))

%% FigS06C

A=sourcetarget;
n=size(A,1)
differences = [];
for i = 1:n-1
    for j = (i+1):n
        differences = [differences; A(i,j)];
    end
end
numEqs = length(differences); 

B = zeros(numEqs, n);
row = 1;
for i = 1:n-1
    for j = (i+1):n
        B(row, i) = 1;
        B(row, j) = -1;
        row = row + 1;
    end
end

B = [B; ones(1, n)];    
d = [differences; 0];    


x = B \ d;



residual = zeros(n);
for i = 1:n
    for j = 1:n
        if i < j
            residual(i,j) = (x(i) - x(j)) - A(i,j);
        end
    end
end
disp('Max residual error:');
disp(max(abs(residual(:))));


A=sourcetarget;

[x, stats] = solveRelativeValues(A);

figure
hold on
for i=1:4
    scatter(0,x(i),8,'filled')
    text(0,x(i),['ty',num2str(i)])
end
xlim([-0.1 0.1])
%ylim([-0.1,0.1])
x'