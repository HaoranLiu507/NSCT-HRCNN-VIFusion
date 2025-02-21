function pop=m_Incoding(binPop,irange_l,flag)
%% Decode
popNum=1;
popNum = 1;%The number of parameters the chromosome contains
for n=1:size(binPop,2)
    Matrix = binPop{1,n};
    for num=1:popNum
        pop(num,n) = bin2dec(Matrix);
    end
end

if flag == 0
    pop = pop./10^5+irange_l;
elseif flag == 1
    pop = pop./10^2+irange_l;
elseif flag ==2
    pop = pop./10^1+irange_l;
end

end