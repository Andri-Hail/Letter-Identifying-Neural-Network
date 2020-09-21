% Andri Hail, ENGR 105, Spring 2019, HW 11
%
% function [V, W] = nnTrain(V0,W0,max_iter, rate)
% Finds the optimized weights for the neural net
%
% Inputs: V0, W0 = two initial weight matrices
%         max_iter = number of optimization steps
%         rate = learning rate
%
% Outputs: V,W = Optimized weights
% V will be 25 x25 and W will be 2X25

function [V, W] = nnTrain(V0,W0,max_iter, rate)

%The vectors that correspond to the needed letters
T = [1 1 1 1 1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0]';
A = [1 1 1 1 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1]';
C = [1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
G = [1 1 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0 0 1 1 1 1 1 1]';

%First set of V and W are equal to the inputted V0 and W0
V = V0;
W = W0;
 
%For loop that runs until we reach the maximum number of iterations
for iter = 1:max_iter
    %Random number between 0 and 4
    probabilityTraining = 4*rand;
   
    %If statement where each part has the same probability of happening.
    %Depending on what probabilityTraining comes out to be this will choose
    %the associated training vector and target output.
    if probabilityTraining <=1
        training = T;
        targetOutput = [0,0];
    elseif probabilityTraining >1 && probabilityTraining <=2
        training = A;
        targetOutput = [0,1];
    elseif probabilityTraining >2 && probabilityTraining <=3
        training = C;
        targetOutput = [1,0];  
    else
        training = G;
        targetOutput = [1,1];
    end
    
    %Val will be either 1 or 2 (chosen randomly)
    val = randi(2);
    %This is the row of W that we will be using to calculate the gradients
    WTraining = W(val, :);
    
    %Hidden layer states:
    q = (sigmoid(V*training));  %25x1
    %Output of net:
    o = sigmoid(W*q); % 2x1
    
    %Calculating both gradients:
    wE = (o(val) - targetOutput(val))*o(val)*(1-o(val))*q';
    vE = (o(val) - targetOutput(val))*o(val)*(1-o(val))*((WTraining'.*q).*(1-q))*training';
    
    %Computing new V and W:
    V = V - rate*vE;
    W = W - rate*wE;
    
end

end
