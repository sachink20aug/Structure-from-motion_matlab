clc;clear;close all;
img1 = imread('../data/im1.png');
img2 = imread('../data/im2.png');
Scale=size(img1,2);
load('../data/some_corresp.mat');
load('../data/templeCoords.mat');
load('../data/intrinsics.mat');
[ F ] = eightpoint( pts1, pts2 ,Scale);
x2=zeros(length(x1),1);
y2=x2;
for i=1:length(x1)
[ x2(i), y2(i) ] = epipolarCorrespondence( img1, img2, F, x1(i), y1(i) );
end
M1=[1 0 0 0;0 1 0 0;0 0 1 0];
findM2;
P_3d=triangulate(K1*M1,[x1,y1],K2*M2,[x2,y2]);
scatter3(P_3d(:,1),P_3d(:,2),P_3d(:,3));


