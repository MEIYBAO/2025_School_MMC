clc,clear
city_name={'南京市','无锡市','徐州市','常州市','苏州市','南通市',...
    '连云港市','淮安市','盐城市','扬州市','镇江市','泰州市','宿迁市'};
colors = [ 
    0.00  0.45  0.74
    0.85  0.33  0.10
    0.93  0.69  0.13
    0.49  0.18  0.56
    0.47  0.67  0.19
    0.89  0.10  0.11
    0.30  0.75  0.93
    0.62  0.40  0.72
    0.90  0.60  0.50
    0.20  0.60  0.50
    0.98  0.50  0.45
    0.40  0.40  0.70
    0.80  0.80  0.20
];
mt1=readmatrix('sol2data.xlsx');
st=19;
mt2=mt1(st:st+11,:);
mt2=abs(mt2-mean(mt2,1));
h=boxplot(mt2,city_name,'Symbol','o');
boxes=findobj(h,'Tag','Box');
xlabel('城市')
ylabel('空气质量综合指数偏移量')
title('2020年1月-2020年12月')
for n=1:length(boxes)
    patch(get(boxes(n),'XData'),get(boxes(n),'YData'),...
         colors(n,:),'FaceAlpha',0.6,...
         'EdgeColor',colors(n,:)*0.5,'LineWidth',1.5);
end
%7,7    30,2    30,11