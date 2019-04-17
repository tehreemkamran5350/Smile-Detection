function yPredicted = f_predictLogisticR(XTest,w)
    X = [ones(1,size(XTest,2)); XTest]; 
    yPredicted = (1./(1+exp(-X'*w)))' >= 0.3;    
end