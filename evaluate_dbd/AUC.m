% y = [0.8526,
%     0.8516,
%     0.8510,
%     0.8508,
%     0.8506,
%     0.8504,
%     0.8501,
%     0.8499,
%     0.8497,
%     0.8494,
%     0.8492,
%     0.8490,
%     0.8487,
%     0.8484,
%     0.8480,
%     0.8476,
%     0.8471,
%     0.8465,
%     0.8455,
%     0.8437,
%     0.5085];

size(mFmeasureWF)

y = flip(mFmeasureWF)
x = 0:.05:1;

size(x)

% auc = 0

auc = trapz(x,y)

% for i = 1:21:
%     auc = auc + 0.05 * (mFeasureWF[i+1] - mFeasureWF[i])
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
