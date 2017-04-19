

Nsteps = 100;
Ninputs = 2;
Nneurons = 1;

% total duration (sec)
duration = 10;
% duration of integration step
deltaT = duration / Nsteps;

U = zeros(Nsteps, Ninputs);
V = zeros(Nsteps, Nneurons);
W = zeros(Nsteps, Ninputs * Nneurons);

% randomized initialization
for (i = 1:Ninputs*Nneurons)
    W(1,i) = -0.5 + 2 * rand();
end

for(t=1:Nsteps-1)
    U(t,:) = input(t);
   
    Wt = reshape(W(t,:), Ninputs, Nneurons);
    [v, deltaW] = neuron(U(t,:)', Wt, deltaT);
    V(t+1) = v;
    W(t+1,:) = W(t,:) + vec(deltaW)';
end 

V(Nsteps-1,:)
reshape(W(Nsteps,:), Ninputs, Nneurons)

subplot(2,1,1)
plot(V(:,1), "r")
ylabel('v')
subplot(2,1,2)
plot(W(:,1), "r", W(:,2), "b")
ylabel('W')
