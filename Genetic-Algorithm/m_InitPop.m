function pop=m_InitPop(numpop,parameter,flag)
%% Initialize the population
%  Input£ºnumpop--  population size
%       [irange_l,irange_r]--  The interval in which the initial population is located
pop=[];
if flag == 0
        pop=ones(1,numpop).*parameter+0.01.*(rand(1,numpop)-0.5);
elseif flag == 1 
        pop=ones(1,numpop).*parameter+0.2.*(rand(1,numpop)-0.5);
elseif flag == 2
        pop=ones(1,numpop).*parameter+3.25.*(rand(1,numpop)-0.5);
end
    