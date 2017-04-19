##  
## computes changes in V and G of a collection of neurons
## usage: [deltaV, deltaG] = neuron (U, V, G, deltaT, Vprev)
##
##  U inputs (for each sample)
##  V firing rates of the neurons (for each sample)
##  G synaptic weights
## 
function [deltaV, deltaG] = neuron (U, V, G)

  [Ninputs Nneurons] = size(G);
  [Ninputs Nsamples] = size(U);
  [Nneurons Nsamples] = size(V);

  % damping constants
  tau1 = 100;
  tau2 = 100;

  % Prediction Error for U
  EPS = U - G*V;

  % Sparseness Constraint
  gdot = sparse(V);

  % Recurrent Network Implementation of Sparse Coding
  for (s = 1:Nsamples)
    deltaV(:,s) = (1/tau1) * (G' * EPS(:,s) + gdot(:,s));
  end

  % Learning the Synaptic Weights
  deltaG = zeros(Ninputs, Nneurons);
  for (s = 1:Nsamples)
    deltaG = deltaG + (1/tau2) * EPS(:,s) * V(:,s)';
  end

end
