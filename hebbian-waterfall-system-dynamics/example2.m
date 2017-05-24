Ninputs = 25;
Nneurons = 15;

% set give input traject (noisy input)
Ut1 = [1 0 0 0 0
      0 1 0 0 0
      0 0 1 0 0
      0 0 0 1 0
      0 0 0 0 1];
Ut2 = [0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0
      0 0 1 0 0];
Ut3 = [0 0 0 0 1
      0 0 0 1 0
      0 0 1 0 0
      0 1 0 0 0
      1 0 0 0 0];
Ut4 = [0 0 0 0 0
      0 0 0 0 0
      1 1 1 1 1
      0 0 0 0 0
      0 0 0 0 0];

U = [vec(Ut1)'; vec(Ut2)'; vec(Ut3)'; vec(Ut4)'];

C = [1;2;3;4];

[nSamples, Ninputs] = size(U);


NrepeatsInner = 5;
NrepeatsOuter = 5;
Nsteps = nSamples * NrepeatsInner * NrepeatsOuter;
% thresholds
vmin = 0.1;
percMin = 0.90;
percMax = 0.98;

% simulate

[V, W, X] = network (U, Nneurons, NrepeatsInner, NrepeatsOuter, vmin, percMin, percMax);
Vfinal = V(1 + nSamples * NrepeatsInner * (NrepeatsOuter - 1): NrepeatsInner: Nsteps, :);

W2 = classifier (Vfinal, C);

c1 = classifySample (Vfinal(1,:)', W2)
c2 = classifySample (Vfinal(2,:)', W2)
c3 = classifySample (Vfinal(3,:)', W2)
c4 = classifySample (Vfinal(4,:)', W2)

% output

disp('V firing rates')
Vfinal

disp('X (vmin)')
X

subplot(2,1,1)
plot(V(:,Nneurons), "r", V(:,Nneurons-1), "b", V(:,Nneurons-2), "g", V(:,Nneurons-3), "p")
ylabel('v')
subplot(2,1,2)
plot(V(:,Nneurons-4), "r", V(:,Nneurons-5), "b", V(:,Nneurons-6), "g", V(:,Nneurons-7), "p")
ylabel('v')
