##
## usage: [v, W] = cneuron (U, c, W)
##
##  U inputs (for each timestep)
##  c classifier
##  W synaptic weights
##
##  results:
##  v firing rate
##  W new synaptic weights

function [v, W] = cneuron (U, c, W)

  eta = 0.2;

  v = W' * U;
  if (v > 1.0)
    W = W/v;
    v = 1.0;
  end

  if (c > 0.1)
    W = W + eta * v * U;

    % limit firing rate to a maximum of one
    v = W' * U;
    if (v > 1.0)
      W = W/v;
      v = 1.0;
    end
  end
end
