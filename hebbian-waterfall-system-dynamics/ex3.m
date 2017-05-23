%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%% Initialization
clear ; close all; clc

% Load Training Data
fprintf('Loading Data ...\n')

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
U = X(rand_indices(1:100), :);

displayData(U);

C = y(rand_indices);

fprintf('Program paused. Press enter to continue.\n');
pause;

[nSamples, Ninputs] = size(U);

NrepeatsInner = 5;
NrepeatsOuter = 5;
Nsteps = nSamples * NrepeatsInner * NrepeatsOuter;
Nneurons = 256;
% thresholds
vmin = 0.1;
percMin = 0.20;
percMax = 0.98;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMin, percMax);
Vfinal = V(1 + nSamples * NrepeatsInner * (NrepeatsOuter - 1): NrepeatsInner: Nsteps, :);

W2 = classifier (Vfinal, C);

C(1:7)
c1 = classifySample (Vfinal(1,:)', W2)
c2 = classifySample (Vfinal(2,:)', W2)
c3 = classifySample (Vfinal(3,:)', W2)
c4 = classifySample (Vfinal(4,:)', W2)
c5 = classifySample (Vfinal(5,:)', W2)
c6 = classifySample (Vfinal(6,:)', W2)
c7 = classifySample (Vfinal(7,:)', W2)


% output

%disp('V firing rates')
%V(Nsteps: -NrepeatsInner: 1 + Nchanges * NrepeatsInner * (NrepeatsOuter - 1), :)

%disp('X (vmin)')
%X'
