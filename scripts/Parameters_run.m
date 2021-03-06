% input type of data
type = {'Chronics', 'Acutes'};
% input path folder
inputPath = '../input/';

%add package
addpath('aeolianine-octave-networks-toolbox-d818511')


% thresholds
freq_thr=0;
ntoktype=5;
dist_thr=1;
    
% 13 parameters
meandist=cell(1,2);
stddist=cell(1,2);
conserv_score=cell(1,2);
snventropy=cell(1,2);
transver_mutation=cell(1,2);
dnds=cell(1,2);
compPCA=cell(1,2);
kolComp=cell(1,2);
robust_select=cell(1,2);
smetric=cell(1,2);
clustCoeff=cell(1,2);

% 3 extra parameters (highly correlated ones)
mutation_freq=cell(1,2);
kentropy=cell(1,2);
freqentropy=cell(1,2);


for t=1:length(type)
    inDir=[inputPath type{t} '_NGS_large'];%put extension of folder name (ex. Acutes_NGS_large)
    files = dir(fullfile(inDir,'*.fas'));
    
    % initialize parameters
    meandist{t}=zeros(length(files),1);
    stddist{t}=zeros(length(files),1);
    snventropy{t}=zeros(length(files),1);
    transver_mutation{t}=zeros(length(files),1);
    dnds{t}=zeros(length(files),1); 
    compPCA{t}=zeros(length(files),1);
    kolComp{t}=zeros(length(files),1);
    robust_select{t}=zeros(length(files),1);
    smetric{t}=zeros(length(files),1);
    clustCoeff{t}=zeros(length(files),1);
    
    
    conserv_score{t}=zeros(length(files),1);
    mutation_freq{t}=zeros(length(files),1);
    kentropy{t}=zeros(length(files),1);
    
    for f=1:size(files,1) 
        f;
        % read and parse fasta files
        seq_file = [inDir,filesep,files(f).name]; 
        [headers,sequences]=fastaread(seq_file);
        [seq,freq,subtype] = readSeqFreq(seq_file,freq_thr,ntoktype);
        cell_seq=sequences;
        sequences = char(sequences);
        [nr,nc]=size(char(sequences));
        
        % pairwise hamming distance
        dvec=pdist(sequences,'hamming');
        D=nc*squareform(dvec);
            
        % calculate parameters
        meandist{t}(f)=meanDist(D)/nc;
        stddist{t}(f)=stdDist(D)/nc;
        conserv_score{t}(f)=conservScore(sequences);
        snventropy{t}(f)=kEntropy(sequences,1);%k=1
        transver_mutation{t}(f)=transverMut(sequences);
        dnds{t}(f)=DNDS(sequences, freq);
        compPCA{t}(f)=PCAComponents(cell_seq, freq, nc);
        kolComp{t}(f)=kolmogorovComp(sequences);
        robust_select{t}(f)=corrFREig(D,freq,dist_thr);
        smetric{t}(f)=sMetrics(sequences,dist_thr);
        clustCoeff{t}(f)=ClusterCoeff(sequences,dist_thr);

        % 3 extra parameters
        mutation_freq{t}(f)=mutationFreq(cell_seq,freq,nr,nc);
        kentropy{t}(f)=kEntropy(sequences, 10);% k=10
        freqentropy{t}(f)=freqEntropy(freq);
            
    end
    
end

