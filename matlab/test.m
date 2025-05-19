clc,clear
mt=readmatrix('2018-2022江苏13市gdp.xlsx');
di=diff(mt,1);
di=di./mt(1:4,:);
correlation_matrix=corrcoef(di);
writematrix(correlation_matrix,'经济皮尔逊相关系数.xlsx')
