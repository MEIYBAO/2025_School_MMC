clc,clear
mt1=readmatrix('附件1：江苏省各市2018年7月-2022年12月空气质量综合指数.xlsx');
mt1=mt1(:,2:end);
mt1(isnan(mt1))=0;
for i=1:size(mt1,1)
    for j=1:size(mt1,2)
        if mt1(i,j)==0
            v1=[1:i-1,i+1:size(mt1,1)]';
            v2=mt1(v1,j);
            v1=v1-i;
            mt1(i,j)=sum(v2./(v1.^2),'all')/sum(1./(v1.^2),'all');
        end
    end
end
writematrix(mt1,'sol1data.xlsx')