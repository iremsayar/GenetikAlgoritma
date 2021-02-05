%clc; clear all; close all;
%as: alt sýnýr
%us: ust sýnýr
%b: boyut %gen sayýsýný veriyor
%pop_size: populasyon boyut %kromozom sayýsýný veriyor
tic
K=8;
Rmin=0;

x_dbm=zeros(1,7); 
for i=1:7
    x_dbm(i)=(i-1)*5; 
end

 P=zeros(1,7);
 for i=1:7
     P(i)=10.^((x_dbm(i)-30)/20);
 end
     
    
% x_dbm=20;
% P=10.^((x_dbm-30)/20);

% y_linear = 0.3162
% y_linfcn = @(xdbm) 10.^((xdbm-30)/20);
% x_dbm = fzero(@(xdbm) y_linfcn(xdbm)-y_linear, 1)

 pop_size=1024; %toplam kromozom sayisi
 b=K;    %1 kromozomdaki gen sayisi
 as=Rmin; %alt sýnýr
 for j=1:7
 us=P(j); %ust sýnýr



% 1- baslangýc populasyonunu rastlantýsal olarak uret. 
pop=unifrnd(as,us,[pop_size, b]); 
pop1=pop;
% 2- amaç fonksiyonu deðerlerini hesapla.
% amac: fonksiyonu minimize veya maksimize etmek. 
%amac= zeros(pop_size,1);
eniyideger=0;
iterasyon=1;

while(iterasyon<1000)

for i=1:1:pop_size
    amac(i,1)=real(sum( log2(1+pop(i,:)) ));
end
% if (min(amac) < eniyideger)
%     eniyideger=min(amac);
%     idx=find(amac==eniyideger);
%     eniyicozum=pop(idx,:);
% end
% mindegerler(iterasyon)=eniyideger;

if (max(amac) >= eniyideger)
    eniyideger=max(amac);
    idx=find(amac==eniyideger);
    eniyicozum=pop(idx,:);
end
    if (j==1)
        cozum1=eniyicozum;
    end
    if (j==2)
        cozum2=eniyicozum;
    end   
    if (j==3)
        cozum3=eniyicozum;
    end    
    if (j==4)
        cozum4=eniyicozum;
    end
    if (j==5)
        cozum5=eniyicozum;
    end
    if (j==6)
        cozum6=eniyicozum;
    end
    if (j==7)
        cozum7=eniyicozum;
    end
%maxdegerler(iterasyon)=eniyideger;
% 3- dogal secilim 

% bir ara populasyon oluþacak rassal sayýlar ile
[ara_pop] = dogalsec(pop,amac,pop_size);

% 4-caprazlama
[ ara_pop2 ] = caprazlama(pop,ara_pop ,pop_size,b);

% 5- MUTASYON
[ara_pop3 gen_mutasyon] = mutasyon(ara_pop2, pop_size, b, as, us);

%mutasyonun sonucunda oluþan nesil yeni popluasyon oluyor.
pop=ara_pop3;

iterasyon=iterasyon+1;
end

end
%plot(maxdegerler,'r','LineWidth',2);
toc


SumRate=zeros(1,7);

SumRate(1) = sum_rate(cozum1,K,H2,H1,H_BS,G)
SumRate(2) = sum_rate(cozum2,K,H2,H1,H_BS,G)
SumRate(3) = sum_rate(cozum3,K,H2,H1,H_BS,G)
SumRate(4) = sum_rate(cozum4,K,H2,H1,H_BS,G)
SumRate(5) = sum_rate(cozum5,K,H2,H1,H_BS,G)
SumRate(6) = sum_rate(cozum6,K,H2,H1,H_BS,G)
SumRate(7) = sum_rate(cozum7,K,H2,H1,H_BS,G)

plot(x_dbm,SumRate,'-rs','MarkerSize',8,'LineWidth',2)
 xlabel("P dBm"); ylabel("Sum Rate");

