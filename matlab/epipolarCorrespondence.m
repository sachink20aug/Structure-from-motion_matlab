function [ x2, y2 ] = epipolarCorrespondence( im1, im2, F, x1, y1 )
% epipolarCorrespondence:
%       im1 - Image 1
%       im2 - Image 2
%       F - Fundamental Matrix between im1 and im2
%       x1 - x coord in image 1
%       y1 - y coord in image 1

% Q2.6 - Todo:
%           Implement a method to compute (x2,y2) given (x1,y1)
%           Use F to only scan along the epipolar line
%           Experiment with different window sizes or weighting schemes
%           Save F, pts1, and pts2 used to generate view to q2_6.mat
%
%           Explain your methods and optimization in your writeup
% clc;clear;close all;
% load 'q2_1.mat';
im1=im2double(rgb2gray(im1));
im2=im2double(rgb2gray(im2));
offset=15;
%x1=150;y1=150;
epi_line=F*[x1;y1;1];
a=epi_line(1);
b=epi_line(2);
c=epi_line(3);
for i=1:size(im1,1)
    x2(i)=i;
    Slope=-b/a;
    Const=-c/a;
    all_ys(i)=Slope*i+Const;
end
patch_1=im1(y1:y1+15,x1:x1+15);

for i=1:size(im1,1)-offset
    patch_2{i}=im2(i:i+15,round(all_ys(i)):round(all_ys(i))+15);
    distances(i)=norm(patch_2{i}-patch_1);


end
Index=find(distances==min(distances));
x2=all_ys(Index);
y2=Index;
end


    










