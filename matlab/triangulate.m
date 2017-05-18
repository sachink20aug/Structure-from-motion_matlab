function [ P, error ] = triangulate( M1, p1, M2, p2 )
% triangulate:
%       M1 - 3x4 Camera Matrix 1
%       p1 - Nx2 set of points
%       M2 - 3x4 Camera Matrix 2
%       p2 - Nx2 set of points

% Q2.4 - Todo:
%       Implement a triangulation algorithm to compute the 3d locations
%       See Szeliski Chapter 7 for ideas
%
% clc;clear;close all;
% load q2_1.mat;
% load intrinsics.mat;
% p1=pts1;p2=pts2;
% [ E ] = essentialMatrix( F, K1, K2 );
% [M2s] = camera2(E);
% M1=[1 0 0 0;0 1 0 0;0 0 1 0];
% M2=M2s(:,:,2);

P=[];
for i=1:size(p1,1)
D=[p1(i,1)*M1(3,:)-M1(1,:);
    p1(i,2)*M1(3,:)-M1(2,:);
    p2(i,1)*M2(3,:)-M2(1,:);
    p2(i,2)*M2(3,:)-M2(2,:)];
%D=reshape(D,4,4);
[~,d,V] = svd(D);
P_3d=V(:,end);
P_3d=[P_3d(1)/P_3d(4),P_3d(2)/P_3d(4),P_3d(3)/P_3d(4),P_3d(4)/P_3d(4)];
P=[P;P_3d];

end

p_cap_1=(M1*P')';
p_cap_2=(M2*P')';
p_cap_1=[p_cap_1(:,1)./p_cap_1(:,3),p_cap_1(:,2)./p_cap_1(:,3)];
p_cap_2=[p_cap_2(:,1)./p_cap_2(:,3),p_cap_2(:,2)./p_cap_2(:,3)];
d1=(p_cap_1-p1).^2;
d2=(p_cap_2-p2).^2;
error=d1(:,1)+d1(:,2)+d2(:,1)+d2(:,2);

end









