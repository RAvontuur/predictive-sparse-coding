function W = classifier (V, C)

fprintf('classifier\n')

nClasses = max(C);
[nSamples, nInputs] = size(V);

% randomized initialization
for (i = 1:nInputs)
  for (j= 1:nClasses)
    W(i,j) = (0.00001 + 0.001 * rand());
  end
end

for (t = 1:10)
    for (i = 1:nSamples)
        Ui = V(i,:)';
        c = C(i);
        Wc = W(:,c);
        [v, Wc] = cneuron (Ui, 1, Wc);
        W(:,c) = Wc;
    end
end


