function out = find_category(in)
    if(0.5<=in&&in<2)
        out=1;
    elseif(2<=in&&in<4)
        out=2;
    elseif(4<=in&&in<9)
        out=3;
    else
        out=4;
    end
end