clc,clear
mt1=readmatrix('sol1data.xlsx');
%7,7    30,2    30,11
mt1(7,7)=0;
mt1(30,2)=0;
mt1(30,11)=0;
for i=1:size(mt1,1)
    for j=1:size(mt1,2)
        if mt1(i,j)==0
            % v1=[1:i-1,i+1:size(mt1,1)]';
            % v2=mt1(v1,j);
            % v1=v1-i;
            % mt1(i,j)=sum(v2./(v1.^2),'all')/sum(1./(v1.^2),'all');
            z=[];
            d=[];
            cnt=1;
            for k=1:size(mt1,1)
                if mod(k,12)>=5 && mod(k,12)<=7
                    if k==i
                        pos=cnt;
                    else
                        z=[z,mt1(k,j)];
                    end
                    d=[d,cnt];
                    cnt=cnt+1;
                end
            end
            d=d-pos;
            d(pos)=[];
            mt1(i,j)=sum(z./(d.^2),'all')/sum(1./(d.^2),'all');
        end
    end
end
writematrix(mt1,'sol1data1.xlsx')