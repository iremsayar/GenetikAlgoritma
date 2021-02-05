function [ara_pop3 gen_mutasyon] = mutasyon(ara_pop2,pop_size,b,as,us)

    olas_mutasyon=0.05;
    delta=0.5;
    rs_m=unifrnd(0,1,[pop_size,b]);
    ara_pop3=ara_pop2; %size
    for i=1:pop_size
        for j=1:b
            if (rs_m(i,j)<olas_mutasyon)              
            ara_pop3(i,j)=ara_pop2(i,j)-delta;
             gen_mutasyon(i,j)=1;
            end
        end   
    end
    
    
    
    
end

