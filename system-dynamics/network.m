

Nsteps = 10000;
Ninputs = 2;
Nneurons = 4;

% total duration (sec)
duration = 100;
% duration of integration step
deltaT = duration / Nsteps;

U = zeros(Nsteps, Ninputs);
V = zeros(Nsteps, Nneurons);
G = zeros(Nsteps, Ninputs * Nneurons);

% randomized initialization
for (i = 1:Ninputs*Nneurons)
    G(1,i) = rand() / 30;
end
for (i = 1:Nneurons)
    V(1,i) = rand() * 30;
end

Vprev = V(1,:)';

for(t=1:Nsteps-1)
    U(t,:) = input(t, Nsteps);
   
    Gt = reshape(G(t,:), Ninputs, Nneurons); 
    [deltaV, deltaG] = neuron(U(t,:)', V(t,:)', Gt, deltaT, Vprev);
    
    Vprev = V(t,:)';
    V(t+1,:) = V(t,:) + deltaV';
    G(t+1,:) = G(t,:) + vec(deltaG)';
end 

subplot(3,1,1)
plot(U(:,1), "r", U(:,2), "b")
ylabel('U')
subplot(3,1,2)
plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "y")
ylabel('V')
subplot(3,1,3)
plot(G(:,1), "r", G(:,2), "b", G(:,3), "g", G(:,4), "y", G(:,5), "r", G(:,6), "b")
ylabel('G')
