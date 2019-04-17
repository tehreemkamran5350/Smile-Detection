function yPredicted = f_predictLR(XTest,w)
    X = [ones(1,size(XTest,2)); XTest]; 
    yPredicted = (X'*w)' >= 0.3;    
end