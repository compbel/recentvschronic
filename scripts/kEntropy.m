function [kentropy] = kEntropy(sequences,k)
       [nr,nc]=size(sequences);
       count=0;
       kmerVec=cell(1,nr);
       kmerVec{1,nr}=[];
       kmerEntropy=zeros(1,nc-k+1);
       Sequence = cellstr(sequences);
       for m=1:(nc-k+1)    
           for n=1:nr 
               substring=char(Sequence(n));
               kmer=substring(m:k+count);
               kmerVec{n}=kmer;    
           end
           count=count+1;
           total=0;
           [occurence,ua,ub]=unique(kmerVec);
           occurenceCounts=histc(ub,1:length(occurence));
           lenOcc=length(occurenceCounts);
           freq_kmer=zeros(1,lenOcc);
           for p=1:lenOcc
              freq_kmer(p)=occurenceCounts(p)/sum(occurenceCounts);
              total=total-(freq_kmer(p)*log2(freq_kmer(p)));
           end  
           kmerEntropy(m)=total;
       end
       kentropy=sum(kmerEntropy)/length(kmerEntropy);
end