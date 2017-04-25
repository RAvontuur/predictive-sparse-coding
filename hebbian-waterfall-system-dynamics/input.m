##
## input generator
##
##
function [U] = input(t)

if (t < 3.0)
  U = [0.7;0.3];
else if (t< 5.0)
  U = [0.1;0.8];
else if (t<7.5)
  U = [0.3;0.3];
else
  U = [0.4;0.6];
end
end
end

U = U / norm(U);
