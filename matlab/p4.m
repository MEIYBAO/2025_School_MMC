clc,clear
m=readmatrix('斯皮尔曼相关性分析_新版.xlsx');
m=m(2:end,2:end);
w=readmatrix('距离.xls');
w=w(:,2:end);
w=5-w;
e=readmatrix('经济皮尔逊相关系数.xlsx');

n=13;
index=find(triu(ones(n),1));
for i=1:13
    m(:,i)=(m(:,i)-min(m(:,i)))./(max(m(:,i)-min(m(:,i)+1e-10)));
    w(:,i)=(w(:,i)-min(w(:,i)))./(max(w(:,i)-min(w(:,i)+1e-10)));
    e(:,i)=(e(:,i)-min(e(:,i)))./(max(e(:,i)-min(e(:,i)+1e-10)));
end
X=[m(index),w(index),e(index)];
mm=78;
dd=3;
k=1/log(mm);
E_j=-k*sum(X.*log(X+1e-10),1);
d_j=1-E_j;
w_i=d_j/sum(d_j,'all');
C=w_i(1)*m+w_i(2)*w+w_i(3)*e;
% writematrix(C,'综合矩阵.xlsx')
city_name={'南京市','无锡市','徐州市','常州市','苏州市','南通市',...
    '连云港市','淮安市','盐城市','扬州市','镇江市','泰州市','宿迁市'};
h=heatmap(C);
h.XDisplayLabels=city_name;
h.YDisplayLabels=city_name;