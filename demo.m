clc;close all;clear;

%% Add related paths
addpath("image\")
addpath("image\VI\");
addpath("image\IR\");
addpath("Fusion\");
addpath("Fusion\Tool_function\");
addpath("Fusion\function\");
addpath("Fusion\enhancement_fun\")
addpath("Genetic-Algorithm\");

%% Setting
GA_switch = 1;
visualization = 0;
c = parcluster('local');
c.NumWorkers = 32;
saveProfile(c);

%% Image name structure
img = {struct('name','carLight'),...
    struct('name','carShadow'),...
    struct('name','carWhite'),...
    struct('name','elecbike'),...
    struct('name','fight'),...
    struct('name','kettle'),...
    struct('name','labMan'),...
    struct('name','man'),...
    struct('name','manCall'),...
    struct('name','manCar'),...
    struct('name','manlight1'),...
    struct('name','manWalking'),...
    struct('name','manwithbag'),...
    struct('name','nightcar'),...
    struct('name','peopleshadow'),...
    struct('name','running'),...
    struct('name','snow'),...
    struct('name','tricycle'),...
    struct('name','walking_1'),...
    struct('name','walking_2'),...
    struct('name','walkingNight'),...
    };len = length(img);

%% read image
parfor j = 1:len
    im1{j} = imread([img{j}.name,'.jpg']);%VI
    im2{j}= imread([img{j}.name,'2','.jpg']);%IR
end

%% The parameters were adapted and image fusion was performed
result_img = cell(1,len);
parfor idx = 1:len
    result_img{idx} = run_RCNN(im1{idx},im2{idx},visualization,GA_switch);
end

%% Save data
save result_img.mat 
imwrite(result_img{6},"fusion.png")

