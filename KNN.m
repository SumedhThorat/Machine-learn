clc;
clear all;
close all;
%defining classes
g1=[1 2;2 2;3 4;4 5;6 4];
g2=[2 4;3 5;4 4;5 6];
plot(g1(:,1),g1(:,2),'rs');
hold on
plot(g2(:,1),g2(:,2),'m^');
hold on
%defining test sample
test=[3 2];
plot(test(:,1),test(:,2),'kx');
hold on
%defining lengths of classes
l1=length(g1);
l2=length(g2);

Ts=l1+l2;
Tc=vertcat(ones(l1,1),ones(l2,1)+1);
testmatrix=repmat(test,Ts,1);

Allsamples=vertcat(g1,g2);
a=abs(testmatrix-Allsamples);
a=a.^2;
dist=sqrt(sum(a,2));
[y I]=sort(dist);
%defining k value
k=5;

Index=I(1:k);
neighbors=Tc(Index);

theta=0:0.1:2*pi;
x1=y(k)*cos(theta)+3;
y1=y(k)*sin(theta)+2;
plot(x1,y1);
hold on

c1=0;
c2=0;
for i=1:k
    if neighbors(i)==1
        c1=c1+1;
    else
        c2=c2+1;
    end
end
if c1>c2
    plot(test(:,1),test(:,2),'rs'),title('unknown sample belongs to class 1');
else
    plot(test(:,1),test(:,2),'y^'),title('unknown sample belongs to class 2');
end






