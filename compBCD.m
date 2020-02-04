function [B C D] = compBCD(Tr, b, c, d, ind)
% ind 1: Simple fluids, ind 2: Reference fluids
B = b(ind,1) - b(ind,2)/Tr - b(ind,3)/Tr^2 - b(ind,4)/Tr^3;
C = c(ind,1) - c(ind,2)/Tr + c(ind,3)/Tr^3;
D = d(ind,1) + d(ind,2)/Tr;
end