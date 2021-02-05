function [ SumR ] = sum_rate(cozum_kumesi,K,H2,H1,H_BS,G)

S=zeros(1,K);
    
    for i=1:K       
        S(i) = (abs((H2(i,:)*H1 + H_BS(i,:))* G(:,i))^2 )* cozum_kumesi(i);      
    end
    
SNR=zeros(1,K);    
    for i=1:K
        SNR(i)= S(i)  / (sum(S)-S(i)+K) ;       
    end
SumR=0; 
    for i=1:K
        SumR = SumR+ log2(1+SNR(i));
    end
    

end

