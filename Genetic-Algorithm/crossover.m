%% subfunction
%
%Title£ºCrossover
%
%%
%Input£º
%           parentsPop       Previous generation population
%           NUMPOP           population size
%           CROSSOVERRATE    crossing-over rate
%Output£º
%           kidsPop          Next generation population
%
%% 
function kidsPop = crossover(parentsPop,NUMPOP,CROSSOVERRATE)
kidsPop = {[]};n = 1;
while size(kidsPop,2)<NUMPOP-size(parentsPop,2)
    %The next generation population selects out the intersecting parent and mother
    father = parentsPop{1,ceil((size(parentsPop,2)-1)*rand)+1};
    mother = parentsPop{1,ceil((size(parentsPop,2)-1)*rand)+1};
    %Crossover positions were generated randomly
    crossLocation = ceil((length(father)-1)*rand)+1;
    %If the random number is lower than the crossover rate, the cross is made
    if rand<CROSSOVERRATE
        father(1,crossLocation:end) = mother(1,crossLocation:end);
        kidsPop{n} = father;
        n = n+1;
    end
end