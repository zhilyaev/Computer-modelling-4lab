function E = genEtaloni(D1, D2, wmin)
% ???????? ???????? ??????? D1 ??? ????????????? ??????? D2
% ??????? ? ?????, ??????? wmin, ??????????
E = [];
while size(D1, 1) > 0
 ro = genRo(D1, D2);
 roc = genRoc(D2, ro);
 [U, D1] = findU(D1, ro, roc);
 if size(U, 1) >= wmin
 E = [E; [mean(U(:, 1)), mean(U(:, 2)), size(U, 1)]];
 end
end
end