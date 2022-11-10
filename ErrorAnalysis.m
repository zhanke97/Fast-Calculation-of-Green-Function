function [] = ErrorAnalysis(E)

[m, n] = size(E);
N = m * n; % Total number of data points

case1 = find(E >= 1e-2);
r1 = length(case1) / N;

case2 = find(E >= 1e-3 &  E < 1e-2);
r2 = length(case2) / N;

case3 = find(E >= 1e-4 &  E < 1e-3);
r3 = length(case3) / N;

case4 = find(E < 1e-4);
r4 = length(case4) / N;

R = [r1 r2 r3 r4];

figure
X = categorical({'>1e-2', '1e-2~1e-3', '1e-3~1e-4', '<1e-4'});
X = reordercats(X,{'>1e-2', '1e-2~1e-3', '1e-3~1e-4', '<1e-4'});
bar(X, R);  
legend('Improved Method','FontName','Times New Roman','location','northwest')
xlabel('Error','FontName','Times New Roman')
ylabel('Proportion','FontName','Times New Roman')
set(gca,'FontName','Times New Roman','FontSize',14);

end