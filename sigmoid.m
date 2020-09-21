% Andri Hail, ENGR 105, Spring 2019, HW 11
%
% function s = sigmoid(x)
% Passes each element of a column vector through the sigmoid function
%
% Inputs: x = length 25 vector corresponding to a letter
% Outputs: s = length 25 vector that is x which each element being put
% through the sigmoid function

%Sets up the function
function s = sigmoid(x)

%Finds teh sigmoid of each element
s = 1./(1+exp(.5-x));

end
