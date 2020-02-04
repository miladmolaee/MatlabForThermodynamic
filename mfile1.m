%% Example 4.1
P=14.8;
T=323.15;
Pc=48.08;
Tc=305.3;
w=0.1;
[Z,V] = virialEOS(P,T,Pc,Tc,w);

%% Example 4.2
g.P=20;
g.T=400;
g.Pc=40.2;
g.Tc=419.6;
g.w=0.191;
Z = zLK(g);

%% Example 4.3
T=350;
P=9.4573;
Tc=425.1;
Pc=37.96;
w=0.2;
state ='v';
eos = 'vdw';
[Z,V] = cubicEOSZ(state,eos,T,P,Tc,Pc,w)
%%
T=350;
P=9.4573;
Tc=425.1;
Pc=37.96;
w=0.2;
state = 'L';
eos = 'rk';
[Z,V] = cubicEOSZ(state,eos,T,P,Tc,Pc,w)

%% Example 4.4
[Q mc] = delH([1.702 9.081e-3 -2.164e-6 0], 533.15, 873.15)

%% Example 4.5
% resbutane.m: residual properties of n-butane
resbutane

%% example 4.6
Tc = 369.8; Pc = 42.49; w = 0.152; T = 378.15; P = 5; eos = 'pr';
state = 'v';
T1 = 378.15; P1 = 5; T2 = 463.15; P2 = 25;
[Z1 V1 dH1 dS1] = deptfun(state,eos,T1,P1,Tc,Pc,w)
[Z2 V2 dH2 dS2] = deptfun(state,eos,T2,P2,Tc,Pc,w)

cmp.A=-4.224; cmp.B=0.3063; cmp.C=-1.586e-4; cmp.D=3.215e-8;
cmp.Tc=369.8; cmp.Pc=42.49; cmp.w=0.152;
eos = 'pr'; state = 'v'; T1 = 378.15; P1 = 5; T2 = 463.15; P2 = 25;
[dH dS] = delHS(state,eos,T1,P1,T2,P2,cmp)

%% Example 4.7
usekhmix