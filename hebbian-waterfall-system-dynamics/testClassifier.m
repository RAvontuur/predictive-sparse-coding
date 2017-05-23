


C = [1; 1; 2; 2];
V = [1 0 0; 1 1 0; 0 0 1; 0 1 1];

W = classifier (V, C);

W

c1 = classifySample (V(1,:)', W)
c2 = classifySample (V(2,:)', W)
c3 = classifySample (V(3,:)', W)
c4 = classifySample (V(4,:)', W)

cx = classifySample ([0.8; 0.7; 1], W)
