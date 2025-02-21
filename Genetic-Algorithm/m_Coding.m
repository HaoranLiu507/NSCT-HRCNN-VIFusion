function binPop=m_Coding(pop,pop_length,irange_l,flag)
%% Binary coding (generating chromosomes)
% Input£ºpop--  population
% pop_length--  encoding length
if flag == 0
 % Keep 5 decimal places and 2 bit integer, The length of the code should be 18
    pop=round((pop-irange_l)*10^5);
    for n=1:size(pop,2) %Column cycle
        for k=1:size(pop,1) %Row cycle
            dec2binpop{k,n}=dec2bin(pop(k,n));%£»The output of dec2bin is a character vector
                                              %dec2binpop is the cell array
            lengthpop=length(dec2binpop{k,n});
            for s=1:pop_length-lengthpop %zero fill
                dec2binpop{k,n}=['0' dec2binpop{k,n}];
            end
        end
        binPop{n}=dec2binpop{k,n};   %Take line k of dec2binpop
    end

elseif flag == 1
    % Keep 2 decimal places and 2 bit integer, The length of the code should be 14
    pop=round((pop-irange_l)*10^2);
    for n=1:size(pop,2) %Column cycle
        for k=1:size(pop,1) %Row cycle
            dec2binpop{k,n}=dec2bin(pop(k,n));%£»The output of dec2bin is a character vector
                                              %  dec2binpop is the cell array
            lengthpop=length(dec2binpop{k,n});
            for s=1:pop_length-lengthpop %zero fill
                dec2binpop{k,n}=['0' dec2binpop{k,n}];
            end
        end
        binPop{n}=dec2binpop{k,n};   %Take line k of dec2binpop
    end
elseif flag == 2
    % Keep 1 decimal places and 2 bit integer, The length of the code should be 10
    pop=round((pop-irange_l)*10^1);
    for n=1:size(pop,2) %Column cycle
        for k=1:size(pop,1) %Row cycle
            dec2binpop{k,n}=dec2bin(pop(k,n));%£»The output of dec2bin is a character vector
                                              %  dec2binpop is the cell array
            lengthpop=length(dec2binpop{k,n});
            for s=1:pop_length-lengthpop %zero fill
                dec2binpop{k,n}=['0' dec2binpop{k,n}];
            end
        end
        binPop{n}=dec2binpop{k,n};   %Take line k of dec2binpop
    end
end

end
    