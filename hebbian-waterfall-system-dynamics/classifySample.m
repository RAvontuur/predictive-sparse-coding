function c = classifySample (V, W)

[nInputs, nClasses] = size(W);

c = 0;
zmax = 0;

for (i = 1: nClasses)
  z = cneuron(V, 0, W(:,i));
  if (z > zmax)
    zmax = z;
    c = i;
  end
end