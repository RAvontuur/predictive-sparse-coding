## simulate a network of neurons
##
function [V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMax)

[Nchanges, Ninputs] = size(U);

Nsteps = Nchanges * NrepeatsInner * NrepeatsOuter;

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
    X(i) = 0.1;
end

for(to = 1:NrepeatsOuter)
    for(tc = 1:Nchanges)
        for(ti=1:NrepeatsInner)
            t = (to-1) * Nchanges * NrepeatsInner + (tc-1) * NrepeatsInner + ti;
            Ut =  U(tc,:)';
            v = 0;
            i = 1;
            perc0 = percMax / (1 + floor(log2(Nneurons)));
            while (i <= Nneurons)
                perc = (1 + floor(log2(i))) * perc0;

                [v, Wi, Xi] = neuron(Ut, W(:,i), X(i), perc);
                V(t+1,i) = v;
                W(:,i) = Wi;
                X(i) = Xi;

                i = i * 2;
                % choose odd branch when firing
                if (v > vmin)
                  i = i + 1;
                end
            end
        end
    end
end

