## simulate a network of neurons
##
function [V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter)

[Nchanges, Ninputs] = size(U);

Nsteps = Nchanges * NrepeatsInner * NrepeatsOuter;

% threshold for v, below this will pass input to the next neuron
vmin = 0.1;

% firing rate for each neuron
V = zeros(Nsteps+1, Nneurons);
% weights for each input and neuron
W = zeros(Ninputs, Nneurons);
% some internal state for each neuron (actual vmin for each neuron)
X = zeros(Nneurons,1);

% randomized initialization
for (i = 1:Ninputs)
  for (j= 1:Nneurons)
    W(i,j) = (0.5 + 0.5 * rand()) / Ninputs;
  end
end
for (i = 1:Nneurons)
    X(i) = vmin;
end

for(to = 1:NrepeatsOuter)
    for(tc = 1:Nchanges)
        for(ti=1:NrepeatsInner)
            t = (to-1) * Nchanges * NrepeatsInner + (tc-1) * NrepeatsInner + ti;
            Ut =  U(tc,:)';
            v = 0;
            for (i=1:Nneurons)

                [v, deltaW, x] = neuron(Ut, W(:,i), X(i));
                V(t+1,i) = v;
                W(:,i) = W(:,i) + deltaW;
                X(i) = x;

                % chain of responsibility pattern
                if (v > vmin)
                  % handled
                  break;
                end
            end
        end
    end
end

