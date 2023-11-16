clear
clc
close all
M1=csvread('maplake1.csv');
x1=M1(:,1);
y1=M1(:,2);
x11 = decimate(x1,40);
y11 = decimate(y1,40);
%在x1,y1的数据点中每40个点中，只保留一个点
y11=(y11+220); %曲线平移后，实现两条曲线的接合
phi=[0];
for k1=1:(length(x11)-1)
    dty1=y11(k1+1)-y11(k1);
    dtx1=x11(k1+1)-x11(k1);
    phi=[phi;atan(dty1/dtx1)];
end
% tra1=[flipud(x11),flipud(y11),flipud(phi)];
tra1=[x11,y11,phi];
plot(x11,y11,'r--')
hold on
scatter(x11,y11,30,'r','p');
hold on
M2=csvread('maplake2.csv');
x2=M2(:,1);
y2=M2(:,2);
x22 = decimate(x2,40);
y22 = decimate(y2,40);
psi=[0];
for k2=1:(length(x22)-1)
    dty2=y22(k2+1)-y22(k2);
    dtx2=x22(k2+1)-x22(k2);
    psi=[psi;atan(dty2/dtx2)];
end
tra2=[flipud(x22),flipud(y22),flipud(psi+pi)];
% tra2=[x22,y22,psi+pi];
plot(x22,y22,'b-.')
hold on
scatter(x22,y22,30,'b','s');
hold off
% tra=[x11 y11;flipud(x22) flipud(y22)];
tra=[tra1;tra2];
csvwrite('TJlake.csv',tra);
