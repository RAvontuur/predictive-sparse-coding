## simulate a network of neurons
##
function [U, V, W, X] = network (U, Nneurons, deltaT)

[Nsteps, Ninputs] = size(U);

% threshold for v, below this will pass input to the next neuron
vmin = 0.1;

% inputs for each input and neuron
U = [U zeros(Nsteps, Ninputs * (Nneurons-1))];

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


