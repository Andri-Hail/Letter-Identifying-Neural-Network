% Andri Hail, ENGR 105, Spring 2019, HW 11
%
% function plot_letters(x)
% Plots the letter associated to a 25x1 matrix by making it into a 5x5
% matrix
%
% Inputs: x = length 25 vector that corresponds to a letter


%Sets up the function
function plot_letters(x)

%Puts the vector into a 5x5 matrix 
y = (reshape(x,[5,5]))'; 

%So that the colors are black and white
colormap(1-gray);

%Makes an image of the matrix
imagesc(y)

end
