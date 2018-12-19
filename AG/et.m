function [U]=et(r1,r2)
U=[];
l=size(r1);
l=l(1);
while l~=1 && l~=0
    %disp(length(r1));
    mr1=[mean(r1(:,1)) mean(r1(:,2))];
    mr2=[mean(r2(:,1)) mean(r2(:,2))];
    %disp(mr1);
    %disp(mr2);
    %plot(r1(:,1),r1(:,2),'+g',r2(:,1),r2(:,2),'ob',mr1(:,1),mr1(:,2),'*r',mr2(:,1),mr2(:,2),'*k');
    nr1=length(r1);
    nr2=length(r2);
    %%%%%%pc
    pc=sqrt((mr1(:,1)-mr2(:,1))^2+(mr1(:,2)-mr2(:,2))^2);
    j=1;
    for i=1:nr2
        pct=sqrt((mr1(:,1)-r2(i,1))^2+(mr1(:,2)-r2(i,2))^2);
        if pct<pc
            pc=pct;
            j=i;
        end
    end
    Pc=r2(j,:);
    %%%%%%p
    p=sqrt((mr1(:,1)-r2(j,1))^2+(mr1(:,2)-r2(j,2))^2);
    k=1;
    %plot(r1(:,1),r1(:,2),'+r');%%%%%%%%%%%
    for i=1:nr1
        %disp('%%%%%%%%%%');
        %disp(nr1);
        %disp(r1);
        %disp(r1(i,:));
        pct=sqrt((r1(i,1)-r2(j,1))^2+(r1(i,2)-r2(j,2))^2);
        if pct>p
            p=pct;
            k=i;
        end
    end
    P=r1(k,:);
    %%%%%%
    ppc=sqrt((r1(k,1)-r2(j,1))^2+(r1(k,2)-r2(j,2))^2);
    i=1;
    pk=0;
    T=[];
    for i=1:nr1
        pj=sqrt((r1(i,1)-P(:,1))^2+(r1(i,2)-P(:,2))^2);
        pcj=sqrt((r1(i,1)-r2(j,1))^2+(r1(i,2)-r2(j,2))^2);
        if pj<=pcj && pj<=ppc
            pk=pk+1;
        else
            T(end +1,:)=r1(i,:);
        end
    end
    r1=T;
    l=size(r1);
    l=l(1);
    %plot(r1(:,1),r1(:,2),'og',r2(:,1),r2(:,2),'ob',r1(k,1),r1(k,2),'*r',r2(j,1),r2(j,2),'*k');
    %plot(r1(:,1),r1(:,2),'+g',r2(:,1),r2(:,2),'ob',P(:,1),P(:,2),'*r',Pc(:,1),Pc(:,2),'*k');
    t=[P(:,1) P(:,2) pk];
    U=[U; t];
    %disp('%%%%%');
    %disp(U);
end
nu=length(U);
T=[];
    for i=1:nu
        if U(i,3)==1
        else
            T(end +1,:)=U(i,1:2);
        end
    end
U=T;
end