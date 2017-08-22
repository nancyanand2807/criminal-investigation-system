
clear all
clc
close all

% You can customize and fix initial directory paths
%TrainDatabasePath = uigetdir('D:\Program Files\MATLAB\R2006a\work', 'Select training database path' );
TrainDatabasePath = getappdata(0,'db_loc');
%TestDatabasePath = uigetdir('D:\Program Files\MATLAB\R2006a\work', 'Select test database path');

%prompt = {'Enter test image name (a number between 1 to 10):'};
%dlg_title = 'Input of PCA-Based Face Recognition System';
%num_lines= 1;
%def = {'1'};

%TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
%TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');

TestImage = getappdata(0,'im_value_loc');
%im = imread(TestImage);
im = getappdata(0,'im_value');
T = CreateDatabase(TrainDatabasePath);

[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

OutputName = OutputName(1:end-4);
setappdata(0,'imageID',OutputName);
setappdata(0,'testImage',im);
setappdata(0,'matchedImage',SelectedImage);

matchedDetails;
%imshow(im)
%title('Test Image');
%figure,imshow(SelectedImage);
%title('Equivalent Image');

%str = strcat('Matched image is :  ',OutputName);
%disp(str)
