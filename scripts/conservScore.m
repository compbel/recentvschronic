function [score] = scoringMatrix(seq)
    [a1,b1]=seqconsensus(seq,'alphabet','nt','scoringmatrix','nuc44');
    b1(isnan(b1))=0;
    score=mean(b1);
   
end

