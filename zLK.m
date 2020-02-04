function Z = zLK(g)
% zLK.m: calculates compressibility factor using the Lee-Kesler equation
% constants and parameters
b = [0.1181193 0.2657280 0.1547900 0.0303230;
0.2026579 0.3315110 0.0276550 0.2034880];
c = [0.0236744 0.0186984 0.0000000 0.0427240;
0.0313385 0.0503618 0.0169010 0.0415770];
d = 1e-4*[0.155488 0.623689; 0.487360 0.0740336];
beta = [0.653920 1.22600]; gam = [0.060167 0.03754]; wr = 0.3978;
% Assign P(MPa), T(K), Pc(MPa), Tc(K), w(acentric factor)
P = g.P; T = g.T; Pc = g.Pc; Tc = g.Tc; w = g.w;
Pr = P/Pc; Tr = T/Tc;
h.c = c; h.Tr = Tr; h.Pr = Pr; h.gam = gam; h.beta = beta;
% Calculation of Z0 of simple fluid (ind=1)
ind=1; [B C D] = compBCD(Tr, b, c, d, ind);
h.B = B; h.C = C; h.D = D; h.ind = ind; Vr0 = Tr./Pr; % initial Vr
Vr = fzero(@BWReq, Vr0, [], h); Z0 = Pr*Vr./Tr;
% Calculation of Zr of reference fluid (ind=2)
ind = 2; [B C D] = compBCD(Tr, b, c, d, ind);
h.B = B; h.C = C; h.D = D; h.ind = ind;
Vr = fzero(@BWReq, Vr, [], h); Zr = Pr*Vr/Tr;
Z1 = 1/wr * (Zr - Z0);
% compressibility factor of real fluid
Z = Z0 + w*Z1;
fprintf('Compressibility factor Z = %f\n', Z);
end