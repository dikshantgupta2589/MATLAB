clc
clear all
f = @(x)x*(x-2)
L = 0;
R = 1.5;
n = 4;
Fib = ones(1,n);
for i =3:n+1
    Fib(i) = Fib(i-1)+Fib(i-2);
end
for k=1:n
    ratio = (Fib(n+1-k)./Fib(n+2-k));
    x2 = L+ ratio.*(R-L);
    x1 = (L+R)-x2;
    fx1 = f(x1);
    fx2 = f(x2);
    rsl(k,:) = [L R x1 x2 fx1 fx2];
    if fx1<fx2
        R = x2;
    elseif fx1>fx2
        L=x1;
    elseif fx1==fx2
        if min(abs(x1),abs(L)) == abs(L)
            R=x2;
        else
            L=x1;
        end
    end
end
Var = {'L','R','x1','x2','fx1','fx2'};
Resl = array2table(rsl,'VariableName',Var)
xopt = (L+R)/2;
fopt = f(xopt);
fprintf('Optimal value at x=%f is %f \n',xopt,fopt)
