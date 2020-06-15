function [mutFreq] = mutationFreq(sequence,freq,nr,nc)

      [m,p]=max(freq);
      ss=sequence;
      sequence(p)=[];
      freq(p)=[];
  
      distance=pdist2(char(ss(p)),char(sequence),'hamming');
      total=0;
      for m=1:(nr-1)
          total=total+(distance(m)*freq(m));
      end
      mutFreq=total/(sum(freq));
end