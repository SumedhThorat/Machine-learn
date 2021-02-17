clc;
clear all;
close all;

data=randi(10,100,2);
mu=mean(data);

c=0;
for i=1:length(data)
    R=(data(i,:)-mu)'*(data(i,:)-mu);
    c=c+R;
end
c=c/(length(data));
%c=cov(data);
e=eig(c);
[V,D]=eig(c)
e1=V(:,1)
e2=V(:,2)
figure()
plot([0,e1(1)],[0,e1(2)]);
%ylim([0 12]);xlim([-4 12]);
hold on
plot([0,e2(1)],[0,e2(2)]);
%ylim([0 12]);xlim([-4 12]);
hold on
scatter(data(:,1),data(:,2),'b^','filled'),title('Data with Principal Componants')
%ylim([0 12]);xlim([-4 12]);
hold off


%dimentionality reduction
if e1>e2
    V1=V(:,1);
else
    V1=V(:,2);
end
for i=1:length(data)
    y(i,:)=data(i,:)-mu;
end

Y=V1'*y';
figure()
plot([0,e1(1)],[0,e1(2)]);
hold on
plot([0,e2(1)],[0,e2(2)]);
hold on
scatter(Y(1,:),Y(1,:),'b^','filled'),title('Result after Dimentionality Reduction')

