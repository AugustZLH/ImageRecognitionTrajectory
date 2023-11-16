% 提取图片中的曲线数据
close all;clear;clc;
%% 图片与曲线间的定标
im=imread('maplake1.png');%读入图片(替换成需要提取曲线的图片)
im=rgb2gray(im);%灰度变化
thresh = graythresh(im);%二值化阈值
im=im2bw(im,thresh);%二值化
set(0,'defaultfigurecolor','w')
imshow(im)%显示图片
[y,x]=find(im==0);%找出图形中的“黑点”的坐标。该坐标是一维数据。
y=max(y)-y;%将屏幕坐标转换为右手系笛卡尔坐标
y=fliplr(y);%fliplr()——左右翻转数组
plot(x,y,'r.','Markersize', 2);
disp('请在Figrure中先后点击实际坐标框的两个顶点(左上点和右下点)，即A、B两点. ');
[Xx,Yy]=ginput(2);%Xx,Yy——指实际坐标框的两个顶点
min_x=input('最小的x值：');%输入x轴最小值0
max_x=input('最大的x值：');%输入x轴最大值385m
min_y=input('最小的y值：');%输入y轴最小值0
max_y=input('最大的y值：');%输入y轴最大值461+39=500m
% Xx=[0 0];
% Yy=[385 500];
% min_x=0;
% max_x=385;
% min_y=0;
% max_y=500;
x=(x-Xx(1))*(max_x-min_x)/(Xx(2)-Xx(1))+min_x;
y=(y-Yy(1))*(min_y-max_y)/(Yy(2)-Yy(1))+max_y;
figure()
plot(x,y,'r.','Markersize', 2);
axis([min_x,max_x,min_y,max_y])%根据输入设置坐标范围
title('由原图片得到的未处理散点图')
A=[x,y];
csvwrite('maplake1.csv',A)
