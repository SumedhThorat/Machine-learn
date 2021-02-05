%K-means clustering
clc;
clear all;
close all;

%Taking random data
R1=randi(50,25,2)
R2=randi(50,20,2);

%plotting TWO classes
figure(1)
plot(R1(:,1),R1(:,2),'rs');
axis([-20 50 -20 50]);
hold on;

plot(R2(:,1),R2(:,2),'m^');
axis([-20 50 -20 50]);
legend('class 1','class 2')
figure(2)

% calculation distance and updation of classes

for i=1:5
    m1=mean(R1);
    m2=mean(R2);
    R=vertcat(R1,R2);
    j=size(R);
    
    %distance calcution
    for k=1:j
        a=R(k,1)-m1(1);
        b=R(k,2)-m1(2);
        a1=a.^2;
        b1=b.^2;
        a2=R(k,1)-m2(1);
        b2=R(k,2)-m2(2);
        a3=a2.^2;
        b3=b2.^2;
        v1(k)=sqrt(a1+b1);
        v2(k)=sqrt(a3+b3);
    end
    temp1=0;
    temp2=0;
    
    
    %cluster updation
    for q=1:j
        if v1(q)<v2(q)
            temp1=temp1+1;
            R11(temp1,1)=R(q,1);
            R11(temp1,2)=R(q,2);
        else
            temp2=temp2+1;
            R21(temp2,1)=R(q,1);
            R21(temp2,2)=R(q,2);
        end
    end
    pause(2)
    
    %plotting the updated cluster
    plot(R1(:,1),R1(:,2),'rs');
    axis([-20 50 -20 50]);
    hold on;
    plot(R2(:,1),R2(:,2),'m^');
    axis([-20 50 -20 50]);
    legend('class 1','class 2')
    hold off;
    R1=R11;
    R2=R21;
    y=mean(R11);
    y1=mean(R21);
    
   if (m1==y)&(m2==y1)
       break;
   end
end
