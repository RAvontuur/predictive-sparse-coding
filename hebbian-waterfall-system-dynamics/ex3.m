
%% Initialization
clear ; close all; clc

% Load Training Data
fprintf('Loading Data ...\n')

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

nSamples = 200;
nValidations = 100;

% Randomly select nSamples data points to display
rand_indices = randperm(m);
U = X(rand_indices(1:nSamples), :);
C = y(rand_indices(1:nSamples));
% Uvalidate = X(rand_indices(nSamples+1, nSamples + nValidations), :);
% Cvalidate = y(rand_indices(nSamples+1, nSamples + nValidations));

displayData(U(1:min(100, nSamples), :));


fprintf('Program paused. Press enter to continue.\n');
pause;

page_output_immediately(1);

[nSamples, Ninputs] = size(U);

Nneurons = 4095;
% thresholds
vmin = 0.1;
percMin = 0.50;
percMax = 0.98;

[W, X] = initialize(Ninputs, Nneurons);

for (i=1:10)
    [V, W, X] = network (U, W, X, vmin, percMin, percMax);
    W2 = classifier (V, C);
    validate(V, C, W2);
end

