function [Param,Best_value] = GA_Main(param,static_param,im1,im2)
%% Convert the image to grayscale
if ~isgray(im2)
    im2 = rgb2gray(im2);
end
if ~isgray(im1)
    im1 = rgb2gray(im1);
end

%% Reference: https://github.com/strawberry-magic-pocket/Genetic-Algorithm
%% Genetic PARAMETER Settings
NUMPOP=5;%Initial population size
ITERATION = 5;%Iterations
CROSSOVERRATE = 0.9;%Rate of hybridization
SELECTRATE = 0.6;  %selection rate
VARIATIONRATE = 0.6; %aberration rate
num_var = 5;

irange_l = [0,0,0,0,0.00]; %Left interval
%% Binary code length
% For digits with 5 decimal places and 1 digit integers, the encoding should be 18 bits
% For numbers with 2 decimal and 1 integers, the encoding should be 10 bits
% For numbers with 2 decimal and 2 integers, the encoding should be 14 bits
LENGTH=[18,10,18,10,14]; %Binary code length

%% sign bits
% The symbol for a 5-decimal number is 0
% The symbol for a 2-decimal number is 1
% The symbol for a 1-decimal number is 2
flag=[0,2,0,2,1];

%% Init population
pop{1}=m_InitPop(NUMPOP,param.aT,0); 
pop{2}=m_InitPop(NUMPOP,param.vT,2); 
pop{3}=m_InitPop(NUMPOP,param.aF,0); 
pop{4}=m_InitPop(NUMPOP,param.B_max,2); 
pop{5}=m_InitPop(NUMPOP,param.a2,1); 

%% Start
for time=1:ITERATION
    % Calculate fitness
    fitness=m_Fitness(pop,static_param,im1,im2);
    for i  = 1:num_var
        %selection
        pop{i} = m_Select(fitness,pop{i},SELECTRATE);
        % Coding
        binpop{i} = m_Coding(pop{i},LENGTH(i),irange_l(i),flag(i));
        % Crossing
        kidsPop{i} = crossover(binpop{i},NUMPOP,CROSSOVERRATE);
        % Variation
        kidsPop{i} = Variation(kidsPop{i},VARIATIONRATE);
        % Decode
        kidsPop{i} = m_Incoding(kidsPop{i},irange_l(i),flag(i));
        % update
        pop{i}=[pop{i},kidsPop{i}];
    end
end

%% The parameters that are best in last population are selected;
[Best_value,index] = max(fitness);
Param.aT = pop{1}(index);
Param.vT = pop{2}(index);
Param.aF = pop{3}(index);
Param.B_max = pop{4}(index);
Param.a2 = pop{5}(index);
    
end

