%% If the image is grayscale, it returns 1
function bool = isgray(Image)
    m=size(Image);
    if(length(m)==3)
        bool = 0;
    else
        bool = 1;
    end
end