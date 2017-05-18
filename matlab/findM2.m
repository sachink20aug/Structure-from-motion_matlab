% Q2.5 - Todo:
%       1. Load point correspondences
%       2. Obtain the correct M2
%       4. Save the correct M2, p1, p2, R and P to q2_5.mat


load q2_1.mat;
load ../data/intrinsics.mat

[ E ] = essentialMatrix( F, K1, K2 );
[M2s] = camera2(E);
M1=[1 0 0 0;0 1 0 0;0 0 1 0];
M1_new=K1*M1;

error=cell(4,1);
P_temp=cell(4,1);
for i=1:4
M2_new=K2*M2s(:,:,i);
[P_temp{i}, error{i} ] = triangulate( M1_new, pts1, M2_new, pts2 );

end
for i=1:4
    if min(P_temp{i}(:,3))>0
        Index=i;
        P=P_temp{Index};
        M2=M2s(:,:,Index);
        break;
    end
end

p1=pts1;p2=pts2;
save('q2_5.mat','P','p1','p2','M2');
  






