% diferen�a o cheby para o butterworth � a oscila��o
% butter n�o oscila
% cheby perde por ripple na banda de passagem
% cheby2 tem rindo na banda de transi��o
% el�ptico tem ripple nas duas bandas, mas a banda de transi��o �
% rid�culamente estreita. 

%% no filtro IIR n�s n�o podemos utilizar a H(z) pois ela � infinita. 
% Usamos portanto a equa��o de diferen�as. menos contas. 
% Desvantagem � que a fase n�o � linear. 
% O atraso do IIR � aprox metade da ordem do filtro, o que � 
% insignificante no tempo em compara��o com a freq de amostragem. 

%% lp2lp

rp = 3;
rs = 40;
wp = 0.5;
ws = 0.6;
[n wn] = buttord(wp, ws, rp, rs);
[b a] =butter(n,wn);
freqz(b,a,1024)
%%
rp = 3;
rs = 40;
wp = 0.5;
ws = 0.6;
[n wp] = cheb1ord(wp, ws, rp, rs);
[b a] = cheby1(n,rp,wp);
freqz(b,a,1024)
%% 
% invariancia ao impulso n�o pode ser compensado por causa do aliasing
% por isso � usado apenas a transform��o bilinear. 
