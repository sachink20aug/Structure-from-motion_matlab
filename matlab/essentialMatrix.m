function [ E ] = essentialMatrix( F, K1, K2 )
% essentialMatrix:
%    F - Fundamental Matrix
%    K1 - Camera Matrix 1
%    K2 - Camera Matrix 2

% Q2.3 - Todo:
%       Compute the essential matrix 
%
%       Write the computed essential matrix in your writeup
% clc;clear;close all;
% load q2_1.mat;
% load intrinsics.mat
E=K2'*F*K1;
end




