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

% total duration
deltaT = 0.02;

Nsteps = 50;
Ninputs = size(X,2);
Nneurons = 5;

% set give input traject (no noise)
U = zeros(Nsteps, Ninputs);
for(t=1:Nsteps-1)
  i = floor(t/10);
  i = 1 + mod(i,m);
  U(t,1:Ninputs) = X(i,:);
end

% simulate

[V, W, Z] = network(U, Nneurons, deltaT);

% output

disp('V firing rates')
V(Nsteps-1,:)
disp('Z (vmin)')
Z
disp('W weights')
W

plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')