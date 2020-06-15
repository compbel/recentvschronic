function [Mdl] = LR_Model(parName,resName, Data, Label)

    pTable=array2table(Data,'VariableNames',parName);
    lTable=array2table(Label,'VariableNames',resName); 
    concatenatedPredictorsAndResponse = [pTable, lTable];

     Mdl = fitglm(concatenatedPredictorsAndResponse, 'Distribution', 'binomial', ...
        'link', 'logit');

end

