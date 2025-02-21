function parentPop=m_Select(matrixFitness,pop,SELECTRATE)
%% Selection
% Input£ºmatrixFitness-- Matrix of fitness
%      pop-- initial population
%      SELECTRATE-- select rate

sumFitness=sum(matrixFitness(:));%Fitness was calculated for all population

accP=cumsum(matrixFitness/sumFitness); %cumulative probability
%Roulette selection algorithm
for n=1:round(SELECTRATE*size(pop,2))
    matrix=find(accP>rand); %Find the cumulative probability larger than the random number
    if isempty(matrix)
        continue
    end
    parentPop(:,n)=pop(:,matrix(1));%Inheriting the individual whose cumulative
    % probability of the first position is larger than the random number
end
end