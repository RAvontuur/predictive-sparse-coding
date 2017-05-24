
function res = validate(U, C, W, X, W2, vmin, percMin, percMax);

nSamples = size(C,1);

[V, W, X] = network (U, W, X, vmin, percMin, percMax, 0);

ok = 0;
for (i = 1:nSamples)
  ci = classifySample (V(i,:)', W2);
  if (ci == C(i))
    ok = ok + 1;
  end
end
res = ok/nSamples