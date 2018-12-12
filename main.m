clearvars, clc
N = 100; % ????? ???????
wmin = 4;
m1 = [3, 4];
m2 = [8, 8];
sigma1 = 3;
sigma2 = 4;
D1 = genV(m1, sigma1, 2, N);
D2 = genV(m2, sigma2, 2, N);
E_D1 = genEtaloni(D1, D2, wmin);
E_D2 = genEtaloni(D2, D1, wmin);
err1 = 0;
err2 = 0;
err0 = 0;
for i = 1:50
 res1 = classify(genV(m1, sigma1, 2, 1), E_D1, E_D2, sigma1, sigma2);
 res2 = classify(genV(m2, sigma2, 2, 1), E_D1, E_D2, sigma1, sigma2);
 if res1 == 2
 err1 = err1 + 1;
 else
 if res1 == 0
 err0 = err0 + 1;
 end
 end
 if res2 == 1
 err2 = err2 + 1;
 else
 if res2 == 0
 err0 = err0 + 1;
 end
 end
end
fprintf('Error 1 kind: %3d\n', err1);
fprintf('Error 2 kind: %3d\n', err2);
fprintf('Rejection: %3d\n', err0);
figure, scatter(D1(:, 1), D1(:, 2)), hold on, scatter(D2(:, 1), D2(:, 2)),
hold off
figure, scatter(E_D1(:, 1), E_D1(:, 2)), hold on, scatter(E_D2(:, 1), E_D2(:,2)), hold off