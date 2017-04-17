

Nsteps = 1000;
Ninputs = 2;
Nneurons = 2;
Nsamples = 2;

% chosen U
U = eye(2);

% randomized initialization
V = zeros(Nsteps, Nneurons * Nsamples);
G = zeros(Nsteps, Ninputs * Nneurons);

for (i = 1:Ninputs*Nneurons)
    G(1,i) = -1.0 + 2 * rand();
end
for (i = 1:Nneurons)
    V(1,i) = rand();
end

for(i=1:Nsteps-1)

    Gi = reshape(G(i,:), Ninputs, Nneurons);
    Vi = reshape(V(i,:), Nneurons, Nsamples);

    [deltaV, deltaG] = neuron(U, Vi, Gi);
    
    V(i+1,:) = V(i,:) + vec(deltaV)';
    G(i+1,:) = G(i,:) + vec(deltaG)';

end 

Vfinal = reshape(V(Nsteps,:), Ninputs, Nneurons)
Gfinal = reshape(G(Nsteps,:), Ninputs, Nneurons)

Ureconstructed = Gfinal * Vfinal

subplot(2,1,1)
plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "y")
ylabel('V')
subplot(2,1,2)
plot(G(:,1), "r", G(:,2), "b", G(:,3), "g", G(:,4))
ylabel('G')
