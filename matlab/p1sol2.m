clc,clear

function pp = natural_cubic_spline(x, y)
n = length(x);
h = diff(x);
d = 6 * ( (y(3:n) - y(2:n-1)) ./ h(2:n-1) - (y(2:n-1) - y(1:n-2)) ./ h(1:n-2) );
main_diag = 2 * (h(1:n-2) + h(2:n-1));
sub_diag = h(2:n-2);
super_diag = h(2:n-2);
A = diag(main_diag);
if ~isempty(sub_diag)
    A = A + diag(sub_diag, -1);
end
if ~isempty(super_diag)
    A = A + diag(super_diag, 1);
end
m = A \ d(:);
M = [0; m; 0];
coeffs = zeros(n-1, 4);
for i = 1:n-1
    hi = h(i);
    a = y(i);
    b = (y(i+1) - y(i))/hi - hi*(2*M(i) + M(i+1))/6;
    c = M(i)/2;
    d_coeff = (M(i+1) - M(i))/(6*hi);
    coeffs(i, :) = [d_coeff, c, b, a];
end
pp = mkpp(x, coeffs);
end

% 15	4
% 25	10
% 31	8
mt1=readmatrix('附件1：江苏省各市2018年7月-2022年12月空气质量综合指数.xlsx');
mt1=mt1(:,2:end);
xy=[15,4;25,10;31,8];
for cur=1:3
    tx=xy(cur,1);
    ty=xy(cur,2);
    x=1:54;
    x(tx)=[];
    y=mt1(:,ty)';
    y(tx)=[];
    pp=natural_cubic_spline(x,y);
    xq=linspace(min(x),max(x),10000);
    yq=ppval(pp,xq);

    for i=1:length(xq)
        if xq(i)>=tx
            ind=i;
            if i-1>0&&abs(xq(i-1)-tx)<abs(xq(i)-tx)
                ind=i-1;
            end
            break;
        end
    end
    mt1(tx,ty)=yq(ind);
end
writematrix(mt1,'sol2data.xlsx')