function [factorsVector,meansVector, normalizedX] = Normalize(normalizedX)
        
        %normalizing training data
        [meansVector, normalizedX]=standardX(normalizedX);
        [factorsVector,normalizedX]=normalizeX(normalizedX);
end 

function [meanVector,subtractedX]= standardX(X)
rows = size(X, 1);
    cols= size(X,2);
    meanVector = zeros(rows,1);
    for i=1:rows
        for j=1:cols
            meanVector(i)= meanVector(i)+ X(i,j);
        end
        meanVector(i) = meanVector(i)./cols;
    end
    
             subtractedX = zeros(rows, cols);
    for i=1:rows
        for j=1:cols
            subtractedX(i,j)= X(i,j)- meanVector(i);
        end
    end
end

function [maxArray,normalizedX]=normalizeX(X)
     maxArray=[];
    cols = size(X,2);
    rows = size(X,1);
    normalizedX= ones(rows, cols);
    for i=1:rows
        maxVal = max(abs(X(i,:)));
        maxArray = [maxArray;maxVal];
        if maxVal ~= 0
            normalizedX(i,:) = X(i,:)./maxVal;
        else
            normalizedX(i,:) = X(i,:);
        end
    end
end