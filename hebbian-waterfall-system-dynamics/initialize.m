function [W, X] = initialize(nInputs, nNeurons)

fprintf('initialize\n')
% weights for each input and neuron
W = zeros(nInputs, nNeurons);
% randomized initialization
for (i = 1:nInputs)
  for (j= 1:nNeurons)
    W(i,j) = (0.1 + 0.1 * rand());
  end
end

% some internal state for each neuron (actual vmin for each neuron)
X = zeros(nNeurons,1);
for (i = 1:nNeurons)
    X(i) = 0.1;
end