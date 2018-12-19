function c = classify(el, E1, E2, s1, s2)
d_el_E1 = min(distance(el, E1(:, [1 2])));
d_el_E2 = min(distance(el, E2(:, [1 2])));
% w = (d_el_E2 - d_el_E1)/(d_el_E1 + d_el_E2);
w = (s1*d_el_E2 - s2*d_el_E1)/(s2*d_el_E1 + s1*d_el_E2);
if w < 0
 c = 2;
else
 if w > 0
 c = 1;
 else
 c = 0;
 end
end
end