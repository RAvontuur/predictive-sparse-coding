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
Nneurons = 100;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter);

% output

disp('V firing rates')
V(Nsteps,:)
disp('X (vmin)')
X
disp('W weights')
W

plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')