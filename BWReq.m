function f = BWReq(Vr,h)
B = h.B; C = h.C; D = h.D; c = h.c; Tr = h.Tr; Pr = h.Pr; gam = h.gam;
beta = h.beta; ind = h.ind;
f = 1 + B/Vr + C/Vr^2 + D/Vr^5 + c(ind, 4)/(Tr^3*Vr^2)*(beta(ind)+...
gam(ind)/Vr^2)*exp(-gam(ind)/Vr^2) - Pr*Vr/Tr;
end