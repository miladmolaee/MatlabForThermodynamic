function [dH,dS] = delHS(state,eos,T1,P1,T2,P2,cmp)
% delHS.m: calculates changes in H and S of pure fluids due to phase change
% inputs
% state: fluid state (liquid: L, vapor: V)
% eos: type of the equation of state (VR, VDW, RK, SRK, PR)
% T1,P1: temperature (K) and pressure (bar) at state 1
% T2,P2: temperature (K) and pressure (bar) at state 2
% cmp: structure containing the properties of pure fluids
% (A, B, C, D (coefficients of Cp equation), Tc, Pc, w)
% outputs:
% dH: change in enthalpy
% dS: change in entropy
% Data of pure fluids
A = cmp.A; B = cmp.B; C = cmp.C; D = cmp.D;
Tc = cmp.Tc; Pc = cmp.Pc; w = cmp.w;
% changes in enthalpy(H) and entropy(S)
[Z1,V1,dH1,dS1] = deptfun(state,eos,T1,P1,Tc,Pc,w);
[Z2,V2,dH2,dS2] = deptfun(state,eos,T2,P2,Tc,Pc,w);
% phase change in idela gas
R = 8.314;
fH = @(T) A + B*T + C*T.^2 + D*T.^3;
fS = @(T) A./T + B + C*T + D*T.^2;
dHi = quadl(fH,T1,T2); dSi = quadl(fS,T1,T2);
dSi = quadl(fS,T1,T2) - R*log(P2./P1);
% changes in H and S due to phase change
dH = dH2 + dHi - dH1;
dS = dS2 + dSi - dS1;
end