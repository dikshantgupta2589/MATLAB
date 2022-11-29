clc
clear all
c=[3 11 4 14 15;6 16 18 2 28;10 13 15 19 17;7 12 5 8 9]
m=size(c,1);
n=size(c,2);
a=[15 25 10 15];
b=[20 10 15 15 5];
z=0;
if sum(a)==sum(b)
    fprintf('Given transportation problem is balanced\n');
else
    fprintf('Given transportation problem is unbalanced\n');
    if sum(a)<sum(b)
        c(end+1,:)=zeros(1,n);
        a(end+1)=sum(b)-sum(a);
    else
        c(:,end+1)=zeros(1,m);
        b(end+1)=sum(a)-sum(b);
    end
end
X=zeros(m,n);
InitialC=c;
for i=1:size(c,1)
    for j=1:size(c,2)
        cpq=min(c(:));
        if cpq==Inf
            break
        end
        [p1,q1]=find(cpq==c);
        Xpq =min(a(p1),b(q1));
        [X(p1,q1),ind]=max(Xpq);
        p=p1(ind);
        q=q1(ind);
        x(p,q)=min(a(p),b(q));
        if min(a(p),b(q))==a(p)
            b(q)=b(q)-a(p);
            a(p)=a(p)-X(p,q);
            c(p,:)=Inf;
        else
            a(p)=a(p)-b(q);
            b(q)=b(q)-X(p,q);
            c(:,q)=Inf;
        end
    end
end
for i=1:size(c,1)
    for j=1:size(c,2)
        z=z+InitialC(i,j)*X(i,j);
    end
end
array2table(X)
fprintf('Transportation cost is %f\n',z);

