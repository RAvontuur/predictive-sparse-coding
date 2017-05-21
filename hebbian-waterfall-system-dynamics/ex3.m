%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%% Initialization
clear ; close all; clc

% Load Training Data
fprintf('Loading Data ...\n')

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;

U = sel;
[Nchanges, Ninputs] = size(U);


NrepeatsInner = 5;
NrepeatsOuter = 5;
Nsteps = Nchanges * NrepeatsInner * NrepeatsOuter;
Nneurons = 256;
% thresholds
vmin = 0.1;
percMin = 0.20;
percMax = 0.98;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMin, percMax);

% output

%disp('V firing rates')
%V(Nsteps: -NrepeatsInner: 1 + Nchanges * NrepeatsInner * (NrepeatsOuter - 1), :)

disp('X (vmin)')
X'
