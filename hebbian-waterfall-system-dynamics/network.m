## simulate a network of neurons
##
function [V, W, X] = network (U, W, X, vmin, percMin, percMax, learn)

nInner = 1;

[nSamples, nInputs] = size(U);
[nNeurons] = size(X, 1);

% firing rate for each neuron
V = zeros(nSamples, nNeurons);

for(s = 1:nSamples)
    Us =  U(s,:)';
    for(ti=1:nInner)
        i = 1;
        perc0 = (percMax - percMin) / (1 + floor(log2(nNeurons)));
        while (i <= nNeurons)
            perc = percMin + (1 + floor(log2(i))) * perc0;

            [v, Wi, Xi] = neuron(Us, W(:,i), X(i), perc);
            V(s,i) = v;

            if (learn > 0)
                W(:,i) = Wi;
                X(i) = Xi;
            end

            i = i * 2;
            % choose odd branch when firing
            if (v > vmin)
              i = i + 1;
            end
        end
    end
end


