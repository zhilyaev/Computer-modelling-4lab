function [y]=FRiS(U1,U2,d1,d2, y)
min1=sqrt((U1(1,1)-y(1,1))^2+(U1(1,2)-y(1,1))^2);
min2=sqrt((U2(1,1)-y(1,1))^2+(U2(1,2)-y(1,1))^2);
for i=2:length(U1)
    m=sqrt((U1(i,1)-y(1,1))^2+(U1(i,2)-y(1,1))^2);
    if m<min1
        min1=m;
    end
end
for i=2:length(U2)
    m=sqrt((U2(i,1)-y(1,1))^2+(U2(i,2)-y(1,1))^2);
    if m<min2
        min2=m;
    end
end
g1=(min2*d1-min1*d2)/(min2*d1+min1*d2);
g2=(min1*d2-min2*d1)/(min1*d2+min2*d1);
[x y]=max([g1 g2]);
disp('Объект принадлежит к классу: ');
disp(y);
end