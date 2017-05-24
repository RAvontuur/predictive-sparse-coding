
function res = validate(V, C, W2);

fprintf('validate\n')

nSamples = size(C,1);

ok = 0;
for (i = 1:nSamples)
  ci = classifySample (V(i,:)', W2);
  if (ci == C(i))
    ok = ok + 1;
  end
end
res = ok/nSamples