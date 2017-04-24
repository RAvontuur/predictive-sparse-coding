##
## input generator
##
##
function [U] = input(t)

if (t < 30)
  U = [0.7;0.3];
else if (t< 50)
  U = [0.1;0.8];
else if (t<75)
  U = [0.7;0.3];
else
  U = [0.1;0.8];
end
end
end

