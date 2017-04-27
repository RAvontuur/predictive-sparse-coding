## simulate a network of neurons
##
function [V, W, X] = network (U, Nneurons, deltaT)

[Nsteps, Ninputs] = size(U);

% threshold for v, below this will pass input to the next neuron
vmin = 0.1;

% firing rate for each neuron
V = zeros(Nsteps, Nneurons);
% weights for each input and neuron
W = zeros(Ninputs, Nneurons);
% some internal state for each neuron (actual vmin for each neuron)
X = zeros(Nneurons,1);

% randomized initialization
for (i = 1:Ninputs)
  for (j= 1:Nneurons)
    W(i,j) = 0.5 + 0.5 * rand();
  end
end
for (i = 1:Nneurons)
    X(i) = vmin;
end

for(t=1:Nsteps-1)
    Ut =  U(t,:)';
    for (i=1:Nneurons)
        [v, deltaW, x] = neuron(Ut, W(:,i), X(i), deltaT);
        V(t+1,i) = v;
        W(:,i) = W(:,i) + deltaW;
        X(i,1) = x;

        % chain of responsibility pattern
        if (v > vmin)
          % no input to next neuron
          Ut = zeros(Ninputs,1);
        else
          % previous neuron did not handle the input, pass input to next neuron
        end
    end
end 


