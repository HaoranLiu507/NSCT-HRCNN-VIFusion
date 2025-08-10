%% Subfunction
%
%Title��Variation
%
%
%Input ��
%           pop              population
%           VARIATIONRATE    mutant rate
%Output ��
%           pop              The population after the mutation
%% 
function kidsPop = Variation(kidsPop,VARIATIONRATE)
for n=1:size(kidsPop,2)
    if rand<VARIATIONRATE
        temp = kidsPop{n};
        %The mutant population finds the mutant position
        location = ceil(length(temp)*rand);
        % Flip the selected bit character '0' <-> '1'
        if temp(location) == '0'
            temp(location) = '1';
        else
            temp(location) = '0';
        end
       kidsPop{n} = temp;
    end
end