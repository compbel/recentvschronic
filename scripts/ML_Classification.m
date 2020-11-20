[vals,headers,raw]=xlsread('../output_ex/param_results.xlsx','13Params');
labels=vals(:,end);% 0 for chronic, 1 for recent
params=vals(:,1:end-1);% all parameters
raws=raw;
raw(1,:)=[];
nPar=13;%13 Parameters
nChronic=256;
nRecent=98;

% call classification models
chronic_params=params(1:256,:);
recent_params=params(257:end,:);
TrainLabels = [labels(1:98);labels(257:354)];%labels for balanced data

% 100 runs for subsampling
validationAccuracy=zeros(100,1);

colNames = raws(1,1:13);
labName=raws(1,end);

OverallPredictionAcc=zeros(1,10);
for i=1:100
    i
    %generate 98 random number for subsampling, balance data
    idx=randsample(nChronic,nRecent);
    subChronic_params=chronic_params(idx,:);
    TrainData = [subChronic_params; recent_params];

    PredictionAcc=zeros(1,10);
    for j=1:10
        j;
        
        % Uncomment ML Model to use it

        % ---------------------------- SVM Model ------------------------------------ %
        % --> Linear Kernel
%         Mdl=crossval(SVM_Model(TrainData, TrainLabels, 'linear', []), 'KFold',10);
        % --> polynomial Kernal
%         Mdl=crossval(SVM_Model(TrainData, TrainLabels,'polynomial', 2), 'KFold',10);
%         
%         oosLoss=kfoldLoss(Mdl);
%         PredictionAcc(j)=100-oosLoss*100; 

        % --------------------------------------------------------------------------- %
        
          

        % ----------------------------- LR model ------------------------------------- %
%         cp=cvpartition(TrainLabels, 'k', 10);
%         fcn = @(Xtr, Ytr, Xte) predict( fitlm(Xtr,Ytr), Xte);
%         mse = crossval('mse', TrainData, TrainLabels,'Predfun',fcn, 'kfold',10);        
%         PredictionAcc(j)=100-mse*100; 

        % ---------------------------------------------------------------------------- %
        
        
    end
    
    OverallPredictionAcc(i)=mean(PredictionAcc);

   
end
FinalAccuracy=mean(OverallPredictionAcc)


