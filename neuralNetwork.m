%Andri Hail, ENGR 105, Spring 2019, HW 11
%Collaborators: None
%
%
%neuralNetwork.m
%Using nnTrain this script will train a neural network and use the results
%to comupute statistics. The learned V and W will be tested on four vectors
%that correspond to A, C, G and, T, 4 vectors that correspond to A,C,G,T
%with one pixel displaced, and four vectors that correspond to A,C,G,T with
%two pixels displaced. This sequence of letters will then be displayed to
%the user. 


%V0 will be a random 25x25 matrix
V0 = randn(25);
%W0 will be a random 2x25
W0 = randn([2,25]);
%Our maximum number of iterations
max_iter = 10000;
%Learning rate
rate = .1;

%Calls nnTrain with the above inputs
[V, W] = nnTrain(V0,W0,max_iter, rate);

%Plots the trained V in a subplot with 3 other plots
subplot(2,2,1)
imagesc(V);
%Adds title
title('Trained V');

%Takes off the axis
axis off
%Adds the colorbar to the side
colorbar
%Sets up the colormap we're using
colormap(jet)

%Plots the distribution of trained V values in a subplot with 3 other plots
subplot(2,2,2)
histogram(V,20);
%Ensures the axes limits are correct
axis([-3 4 0 100])
%Adds title
title('Distribution of Trained V Values');

%Plots the trained W in a subplot with 3 other plots
subplot(2,2,3)
imagesc(W);
%Adds title
title('Trained W');
%Takes off axes
axis off
%Makes axes equal
axis equal
%Adds colorbar to the side
colorbar
%Plots the Distribution of Trained V Values in a subplot with 3 other plots
subplot(2,2,4)
histogram(W,20);
%Ensures the axes limits are correct
axis([-3 3 0 8])
%Adds title
title('Distribution of Trained V Values');

%Initializes testMatrix with zeros
testMatrix = zeros(12,25);
%The first four rows will be the four letters (A,C,G,T)
testMatrix(1,:) = [1 1 1 1 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1];
testMatrix(2,:) = [1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1];
testMatrix(3,:) = [1 1 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0 0 1 1 1 1 1 1];
testMatrix(4,:) = [1 1 1 1 1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0];

%For loop that adds the next four rows. They are equal to the first four
%except one element in each is flipped either from a 1 to a 0 or vice versa
for i = 5:8
    testMatrix(i,:) = testMatrix(i-4,:);
    index = randi(25);
    if testMatrix(i, index) == 1
        testMatrix(i, index) = 0;
    else
        testMatrix(i, index) = 1;
    end
end
%For loop that adds the next four rows. They are equal to the first four
%except two elements in each are flipped either from a 1 to a 0 or vice versa
for i = 9:12
    testMatrix(i,:) = testMatrix(i-8,:);
    for iter = 1:2
        index = randi(25);
        if testMatrix(i, index) == 1
            testMatrix(i, index) = 0;
        else
            testMatrix(i, index) = 1;
        end
    end
end

%Ensures the next plot will be on its own figure
figure

%For loop that goes through every row and puts each one into testMatrix to
%plot it
for i = 1:12
    %Subplot will make all the plots appear on the same figure
    subplot(3,4,i)
    y = testMatrix(i,:);
    plot_letters(y);
end
%Calculates the outputs using the trained W and V
out = round(sigmoid(W*sigmoid(V*testMatrix')));
%Initializes the vector of strings that will be used to display what each
%letter is
seq = (['']);
%For loop that goes through every column of out to check what letter it is
%and add that letter to seq
for i = 1:12
    if out(:,i) == [0;0]
        seq(i) = 'T';
    elseif out(:,i) == [0;1]
        seq(i) = 'A';
    elseif out(:,i) == [1;0]
        seq(i) = 'C';
    else
        seq(i) = 'G';
    end 
end

%Displays the vector seq
disp(seq)

%% nnTrain.m
% <include>nnTrain.m</include>
%% plot_letters.m
% <include>plot_letters.m</include>
%% sigmoid.m
% <include>sigmoid.m</include>

