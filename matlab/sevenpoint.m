function [ F ] = sevenpoint( pts1, pts2, M )
% sevenpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.2 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save recovered F (either 1 or 3 in cell), M, pts1, pts2 to q2_2.mat

%     Write recovered F and display the output of displayEpipolarF in your writeup
% clc;clear all ;close all;
% load some_corresp.mat;
% M=640;
pts1_new=pts1/M;
pts2_new=pts2/M;
L_u=size(pts1_new,1);
U=[];
for i=1:L_u
    u=[pts1_new(i,1)*pts2_new(i,1),pts1_new(i,2)*pts2_new(i,1),pts2_new(i,1),pts2_new(i,2)*pts1_new(i,1),pts2_new(i,2)*pts1_new(i,2),pts2_new(i,2),pts1_new(i,1),pts1_new(i,2),1];
    U=[U;u];
    

end
[u,d,v]=svd(U);


F1=v(:,end);
F2=v(:,end-1);
syms al

P =al*F1+ (1-al)*F2; 
P=reshape(P,3,3);
P=P';
roots_p=double(solve((det(P))));
F1_new=reshape(F1,3,3);
F2_new=reshape(F2,3,3);

N=length(roots_p);
x_unnorm=1/M;
y_unnorm=x_unnorm;
T=[x_unnorm 0 0;0 y_unnorm 0; 0 0 1];
for i=1:N
F_req{i}=roots_p(i)*F1_new+(1-roots_p(i))*F2_new;
F3{i}=T'*F_req{i}*T;
end
F=F3{1};















