License:
1.The files in the data folder was given by Carnegie Mellon University for the course Computer Vision(16720).
2.The following files : camera2.m,displayEpipolarF.m and epipolarMatchGUI are supporting files given by Carnegie Mellon University.

Steps:
1.Open visualize_3d.m and run it with matlab folder as the current directory.

Problem:
1.Given im1 and im2 as the input images the goal is to find the 3d reconstruction of the image as a point cloud.

 Theory:
1.Calculate Fundamental (eightpoint.m)and Essential Matrices(essentialMatrix.m)
2.Extra Credit using RANSAC and seven point.
2.Find the epipolar correspondences for each point.(epipolarCorrespondence.m)
3.Triangulate to obtain the 3d point and visualize.(triangulate.m)
4.Rest of the mat files were for storing data from each step.
