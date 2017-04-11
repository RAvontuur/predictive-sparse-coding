##
## input generator
##
##
function [U] = input(t, steps)

S = 0.02 + 0.95 * [1 0; 0 0.95; 1 0.95; 0 0];

repeat = mod(t, steps/3);
choice = 1 + floor(repeat*4*3/steps);

U = S(choice,:)';

end
