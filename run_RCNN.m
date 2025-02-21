function img = run_RCNN(imgVI, imgIR, visualization, flag)
% Runs the Random-Coupled Neural Network (RCNN) based image fusion on visible (VI) and infrared (IR) images.
%
% Inputs:
%   imgVI: Visible light image (uint8 or double).
%   imgIR: Infrared image (uint8 or double).
%   visualization: Flag (0 or 1) to enable/disable visualization of input and fused images.
%   flag: Flag (0 or 1) to select between using the genetic algorithm (GA) for parameter optimization (1) or using default parameters (0).
%
% Output:
%   img: Fused image (uint8).

% Add necessary paths for fusion and genetic algorithm functions
addpath(genpath('Fusion')); % Adds the 'Fusion' folder and its subfolders to the MATLAB path.  This folder should contain the fusion_main function.
addpath(genpath('Genetic-Algorithm')); % Adds the 'Genetic-Algorithm' folder and its subfolders to the MATLAB path. This folder should contain the GA_Main function.

image_input1 = imgIR; % Assigns the infrared image to the variable image_input1.
image_input2 = imgVI; % Assigns the visible image to the variable image_input2.

% Visualization of input images
if visualization == 1
    figure;imshow(image_input1); % Displays the infrared image in a new figure window.
    figure;imshow(image_input2); % Displays the visible image in a new figure window.
end

% Define dynamic parameters for the fusion process.  These parameters are potentially optimized by the genetic algorithm.
dynamic_param.aT = 0.04; 
dynamic_param.vT = 5.0;  
dynamic_param.aF = 0.023; 
dynamic_param.B_max = 10;  
dynamic_param.a2 = 0.2;  

% Define static parameters for the fusion process.  These parameters are manually set and remain constant.
static_param.T = 120;   % Static parameter T (example: temperature threshold).
static_param.a1 = 2;    % Static parameter a1 (example: scaling factor).

% Parameter selection: Genetic Algorithm (GA) or default values
if flag == 1
    % Use Genetic Algorithm to optimize parameters
    [PARAM, Best_value] = GA_Main(dynamic_param,static_param,image_input2,image_input1);
    % GA_Main function is assumed to perform the genetic algorithm optimization,
    % taking dynamic and static parameters, and the input images as input.
    % It returns the optimized parameters (PARAM) and the best value achieved (Best_value).
else
    % Use default parameter values
    PARAM.aT = dynamic_param.aT; % Assign default value to parameter aT.
    PARAM.vT = dynamic_param.vT; % Assign default value to parameter vT.
    PARAM.aF = dynamic_param.aF; % Assign default value to parameter aF.
    PARAM.B_max = dynamic_param.B_max; % Assign default value to parameter B_max.
    PARAM.a2 = dynamic_param.a2; % Assign default value to parameter a2.
end

% Perform image fusion using the selected parameters
imgf = fusion_main(image_input2,image_input1,PARAM,static_param);
% fusion_main function is assumed to perform the actual image fusion process,
% taking the input images, optimized/default parameters (PARAM), and static parameters as input.
% It returns the fused image (imgf).

% Visualization of the fused image
if visualization == 1
    figure;imshow(uint8(imgf)); % Displays the fused image in a new figure window.  The image data is converted to uint8 for display purposes.
end

img = uint8(imgf); % Convert the fused image to uint8 and assign it to the output variable img.

end
