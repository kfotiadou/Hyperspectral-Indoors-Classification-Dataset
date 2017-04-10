clc;clear all;close all;

% srcFiles = dir('\classification_dataset\hsi_output\object_categories\BAG*.pgm');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('\classification_dataset\BAG\',srcFiles(i).name);
%  
%     I_25_bands=imread(filename);
% %     figure;imagesc(I_25_bands)
%     [cube_4x4]=make3D_cube(I_25_bands,4);
%     
%     save(['bag' num2str(i) '.mat'],'cube_4x4')
% 
% end

 files = dir('*.mat'); %try to look for all the .mat files under the folder
totalObjCounter = 1;
cube_227_227x3 = [];
for i=1:length(files)
   load(files(i).name);%load the files
   cube_4x4 = imresize(cube_4x4,[227,NaN]);
   cube_4x4 = cube_4x4(:,1:227,:);
   for jj = 1:16
       cube_227_227x3 =repmat(cube_4x4(:,:,jj),[1 1 3]);    
%        save(['bag' num2str(i) 'band' num2str(jj) '.mat'],'cube_227_227x3')
       imwrite(cube_227_227x3,...
           ['C:/Users/kfot/Dropbox/classification_data/vanilla_cubes/vanilla_images/' 'vanilla' num2str(i) 'band' num2str(jj) '.png'], 'png')
   end
   
%    SBDInfo(totalObjCounter).ImageName = files(i).name;
%      totalObjCounter = totalObjCounter + 1;
end