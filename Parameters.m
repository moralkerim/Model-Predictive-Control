close all
clc

%%
Ts = 0.03; 
we = 1;
wn = 120*pi;

%machine's inertia coefficient
h1 = 23.64;
h2 = 6.40;
h3 = 3.01;

%x0 = [delta      omega  Pref Pe  dist]
x01 = [3.58570 ; 0.9684 ; 0 ;  0  ; 0.01];
x02 = [61.0992 ; 1.0258 ; 0 ;  0  ; 0.01];
x03 = [54.1368 ; 1.0184 ; 0 ;  0  ; 0.01];

r1 =  [   0    ;    1   ; 0 ; 0.1 ; 0.01];
r2 =  [   0    ;    1   ; 0 ; 0.1 ; 0.01];
r3 =  [   0    ;    1   ; 0 ; 0.1 ; 0.01];

%% plant 1

A1 = [1    Ts*wn             0              0                 0;
      0      1        (Ts/2*we*h1)    (-Ts/2*we*h1)       Ts*we*wn;
      0      0               1              0                 0;
      0      0               0              1                 0;
      0      0               0              1                 1];
 
B = [0;0;Ts;0;0];
C = [eye(4) zeros(4,1) ; zeros(1,5)];
D = zeros(5,1);

plant1 = ss(A1,B,C,D,Ts);

plant1.InputName =  {'u1'};
plant1.OutputName = {'del1','omega1','Pref1','Pe1','dist'};
plant1.StateName =  {'del1','omega1','Pref1','Pe1','dist'};

%% plant 2

A2 = [1    Ts*wn             0              0                 0;
      0      1        (Ts/2*we*h2)    (-Ts/2*we*h2)       Ts*we*wn;
      0      0               1              0                 0;
      0      0               0              1                 0;
      0      0               0              1                 1];


plant2 = ss(A2,B,C,D,Ts);

plant2.InputName =  {'u2'};
plant2.OutputName = {'del2','omega2','Pref2','Pe2','dist'};
plant2.StateName =  {'del2','omega2','Pref2','Pe2','dist'};


%% plant 3

A3 = [1    Ts*wn             0              0                 0;
      0      1        (Ts/2*we*h3)      (-Ts/2*we*h3)    Ts*we*wn;
      0      0               1              0                 0;
      0      0               0              1                 0;
      0      0               0              1                 1];
  

plant3 = ss(A3,B,C,D,Ts);

plant3.InputName =  {'u3'};
plant3.OutputName = {'del3','omega3','Pref3','Pe3','dist'};
plant3.StateName =  {'del3','omega3','Pref3','Pe3','dist'};
