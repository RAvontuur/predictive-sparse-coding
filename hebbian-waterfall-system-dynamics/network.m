

Nsteps = 100;
Ninputs = 2;
Nneurons = 2;

% total duration (sec)
duration = 10;
% duration of integration step
deltaT = duration / Nsteps;

U = zeros(Nsteps, Ninputs * Nneurons);
V = zeros(Nsteps, Nneurons);
W = zeros(Nsteps, Ninputs * Nneurons);
X = zeros(Nsteps, Nneurons);

% randomized initialization
for (i = 1:Ninputs*Nneurons)
    W(1,i) = 0.5 + 0.5 * rand();
end
for (i = 1:Nneurons)
    X(1,i) = 0.1;
end

for(t=1:Nsteps-1)
    U(t,1:Ninputs) = input(t);

    for (i=1:Nneurons)
        i1 = (i-1) * Ninputs + 1;
        i2 = i1 + Ninputs - 1;

        Wt = reshape(W(t,i1:i2), Ninputs, 1);
        [v, deltaW, x, EPS] = neuron(U(t,i1:i2)', Wt, X(t,i), deltaT);
        V(t+1,i) = v;
        W(t+1,i1:i2) = W(t,i1:i2) + vec(deltaW)';
        X(t+1,i) = x;

        if (i < Nneurons)
          U(t,i1+Ninputs:i2+Ninputs) = EPS;
        end
    end
end 

V(Nsteps-1,:)
reshape(W(Nsteps,:), Ninputs, Nneurons)

subplot(2,1,1)
plot(V(:,1), "r", V(:,2), "b")
ylabel('v')
subplot(2,1,2)
plot(W(:,1), "r", W(:,2), "b", W(:,3), "g", W(:,4), "p")
ylabel('W')
