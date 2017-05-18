function [ F ] = eightpoint( pts1, pts2, M )
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.1 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save F, M, pts1, pts2 to q2_1.mat

%     Write F and display the output of displayEpipolarF in your writeup
% clc;clear all;close all;

pts1_new=pts1/M;
pts2_new=pts2/M;
L_u=size(pts1,1);
U=[];
for i=1:L_u
    u=[pts1_new(i,1)*pts2_new(i,1),pts1_new(i,2)*pts2_new(i,1),pts2_new(i,1),pts2_new(i,2)*pts1_new(i,1),pts2_new(i,2)*pts1_new(i,2),pts2_new(i,2),pts1_new(i,1),pts1_new(i,2),1];
    U=[U;u];
    

end
[u,d,v]=svd(U);
min_eigen_vector=v(:,end);
Essential=reshape(min_eigen_vector,3,3);
F=refineF(Essential',pts1_new,pts2_new);


x_unnorm=1/M;
y_unnorm=x_unnorm;
T=[x_unnorm 0 0;0 y_unnorm 0; 0 0 1];
F=T'*F*T;
%save('../data/q2_1.mat','F','M','pts1','pts2');
end
















