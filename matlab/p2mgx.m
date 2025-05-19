clc,clear
change=3;
a=[0.0531,-0.3836,-0.0132];
fd=zeros(11,1);
for cnt=1:11
    a(change)=a(change)*(0.94+0.01*cnt);
    p=0;
    test_t=(60:71)';
    tw=readmatrix('风力18-22.xlsx');
    test_w=readmatrix('风力23.xlsx');
    test_w=[tw(end,1);test_w(1:end-1,1)];
    real_y=readmatrix('附件2：江苏省各市2023年1月-2023年12月空气质量综合指数.xlsx');
    real_y=real_y(:,2:end);
    real_y=real_y(:,1);
    ty=readmatrix('sol1data1.xlsx');
    pre_y=[ty(end,1);real_y(1:end-1)];
    test_y=[];
    for i=1:12
        test_y=[test_y;a(1)+a(2)*sin(test_t(i)*pi/6+p)+a(3)*test_w(i)*pre_y(i)+pre_y(i)];
    end
    fd(cnt)=sum(abs(test_y-real_y));
end
fd=(fd-fd(6))/fd(6)*100;
plot(-5:5,fd,'Color','b','LineWidth',2)
xlim([-5,5])
ylim([-0.005,0.035])
xticks(-5:5)
ax=gca;
ax.LineWidth=1.5;
ax.YAxis.MinorTick='on';
ax.YAxis.MinorTickValues=-0.005:0.001:0.035;
xlabel('参数浮动/(%)')
ylabel('波动百分比/(%)')
grid on