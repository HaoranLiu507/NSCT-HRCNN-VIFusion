%% Subfunction
%
%Title£ºVariation
%
%
%Input £º
%           pop              population
%           VARIATIONRATE    mutant rate
%Output £º
%           pop              The population after the mutation
%% 
function kidsPop = Variation(kidsPop,VARIATIONRATE)
for n=1:size(kidsPop,2)
    if rand<VARIATIONRATE
        temp = kidsPop{n};
        %The mutant population finds the mutant position
        location = ceil(length(temp)*rand);
        temp = [temp(1:location-1) num2str(~temp(location))...
            temp(location+1:end)];
       kidsPop{n} = temp;
    end
end