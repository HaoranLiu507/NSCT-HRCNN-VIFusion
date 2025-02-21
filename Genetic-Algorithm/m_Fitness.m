%% Subfunction: Fitness Function
function fitness=m_Fitness(pop,static_param,im1,im2)
    for n = 1:size(pop,2)
        dynamic_param.aT = pop{1}(n);
        dynamic_param.vT = pop{2}(n);
        dynamic_param.aF = pop{3}(n);
        dynamic_param.B_max = pop{4}(n);
        dynamic_param.a2 = pop{5}(n);
        fitness(n) = fusion_index(im1,im2,dynamic_param,static_param); % Optimization objective setting
    end
end
