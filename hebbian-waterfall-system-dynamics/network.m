
Nsteps = 200;
Ninputs = 2;
Nneurons = 5;

% threshold for v, below this will pass input to the next neuron
vmin = 0.1;

% total duration (sec)
duration = 10;
% duration of integration step
deltaT = duration / Nsteps;

% inputs for each input and neuron
U = zeros(Nsteps, Ninputs * Nneurons);
% firing rate for each neuron
V = zeros(Nsteps, Nneurons);
% weights for each input and neuron
W = zeros(Nsteps, Ninputs * Nneurons);
% some internal state for each neuron (actual vmin for each neuron)
X = zeros(Nsteps, Nneurons);

% randomized initialization
for (i = 1:Ninputs*Nneurons)
    W(1,i) = 0.5 + 0.5 * rand();
end
for (i = 1:Nneurons)
    X(1,i) = vmin;
end

for(t=1:Nsteps-1)
    U(t,1:Ninputs) = input(t * deltaT);

    for (i=1:Nneurons)
        i1 = (i-1) * Ninputs + 1;
        i2 = i1 + Ninputs - 1;

        Wt = reshape(W(t,i1:i2), Ninputs, 1);
        [v, deltaW, x] = neuron(U(t,i1:i2)', Wt, X(t,i), deltaT);
        V(t+1,i) = v;
        W(t+1,i1:i2) = W(t,i1:i2) + vec(deltaW)';
        X(t+1,i) = x;

        % chain of responsibility pattern
        if (i < Nneurons)
          if (v > vmin)
            % no input to next neuron
            U(t,i1+Ninputs:i2+Ninputs) = zeros(1,Ninputs);
          else
            % previous neuron did not handle the input, pass input to next neuron
            U(t,i1+Ninputs:i2+Ninputs) = U(t,i1:i2);
          end
        end
    end
end 

disp('V firing rates')
V(Nsteps-1,:)
disp('X (vmin)')
X(Nsteps-1,:)
disp('W weights')
reshape(W(Nsteps,:), Ninputs, Nneurons)

subplot(2,1,1)
plot(V(:,1), "r", V(:,2), "b", V(:,3), "g", V(:,4), "p")
ylabel('v')
subplot(2,1,2)
plot(W(:,1), "r", W(:,2), "b", W(:,3), "g", W(:,4), "p")
ylabel('W')
