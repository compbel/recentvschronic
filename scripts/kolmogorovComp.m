function [kc] = kolmogorovComp(sequences)
    if size(sequences,2) == 291
        sequences = sequences(:,8:271);
   end
   if size(sequences,2) == 306
        sequences = sequences(:,21:284);
   end
   sequences = sequences(:,2:end);
    Array_of_SequencesBin=(nuc2numBin(sequences))';
    seq_concat = (Array_of_SequencesBin(:))';
    kc = kolmogorov(seq_concat);
end

