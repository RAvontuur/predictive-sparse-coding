##
## sparse constraint penalty
##
##
function gdot = sparse(V)
    
  [Nneurons Nsamples] = size(V);

  for (s = 1:Nsamples)
    VV = (V(:,s)' * V(:,s)) - (V(:,s) .* V(:,s));
    gdot(:,s) = -sign(V(:,s)) .* VV;
  end

end
