clc; 
clear all; 
close all;

c1=randi(100,1,100);
c2= randi(100,1,100);

figure
plot(c1,'ro'); 
hold on
plot(c2,'b*');title('Initial classes data');
legend('class 1','class 2');
hold off

m1= mean(c1); m2= mean(c2);
m11 = 0; m22 = 0;


while ((m1~=m11)&&(m2~=m22))
    
    m1= mean(c1); v1= var(c1);
    m2= mean(c2); v2= var(c2);
    data = vertcat(c1,c2);
    l= length(data);
   
   shuff= data(randperm(l));
 
   
   c11=[]; c22=[];
   
   for i=1:l
    %expectation step
    p1 =(1/sqrt(2*pi*v1))*exp(-(shuff(i)-m1)^2/(2*v1));
    p2= (1/sqrt(2*pi*v2))*exp(-(shuff(i)-m2)^2/(2*v2));
     
    
    if (p1>p2)
        c11 = vertcat(c11,shuff(i));
    else
        c22 = vertcat(c22,shuff(i));
    end
   end
   
   % Maximization step
   m11 = mean(c11); v11 = var(c11);
   m22 = mean(c22); v22 = var(c22);
   c1= c11;
   c2=c22;
   
  if (m1==m11)&&(m2==m22)
    break;
  end

end

figure
plot(c1,'ro'); 
hold on
plot(c2,'b*');title('classified data');
legend('class 1','class 2');
hold off


