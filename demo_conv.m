%% Implementa��o da convolu��o no dom�nio do tempo
% Aluno: Pedro Henrique Garcia - R.A. 1829696
%
% Fun��o pro c�lculo da convolu��o no dom�nio do tempo

%% Inicializa��o
clc; clear;

Lx=randi(1000); % tamanho do sinal, inteiro aleatorio
Lh=randi(1000); % tamanho da resposta ao impulso, inteiro aleatorio
x = randn(Lx,1); % geramos um sinal aleat�rio de tamanho Lx
h = randn(Lh,1); % geramos uma resposta ao impulso de tamanho Lh

%% Testes da fun��o de convolu��o
% testamos o tempo de execu��o da fun��o craida com a fun��o de convolu��o
% do matlab
tic; y_conv= conv(x,h); toc
tic; y_phg = phg_conv(x,h);toc
%% C�digo da fun��o de convolu��o 
% A fun��o convolu��o recebe dois vetores, e realiza a convolu��o discreta
% entre eles atrav�s de produtos escalares.
%
% Os vetores de entrada podem ser linhas ou colunas, a fun��o retorna um
% vetor linha

%function  y = phg_conv(x,h)

% Aqui determinamos o tamanho de cada vetor de entrada
Lx = numel(x);
Lh = numel(h);

% como o produto escalar s� pode ser feitos com vetores com o mesmo n�mero
% de elementos, preenchemos o final dos vetores de entrada com zeros
x(Lh+Lx-1)=0;
h(Lh+Lx-1)=0;

% Esta parte do c�digo garante que os vetores de entrada estar�o no formato
% exigido para a multiplica��o de matrizes, para fazer o produto escalar.
% Para fazer h*x como produto escalar, h() precisa ser linha e x() coluna
if (isrow(h) == 1)
    h = transpose(h);
end
if (iscolumn(x) == 1)
    x = transpose(x);
end

% realiza o produto escalar de h[-k]*x[k]; h[-k] � reverso no tempo.
% O n-�simo elemento do vetor da convolu��o � o produto escalar dos
% primeiros n-�simos elementos do vetor h[k], reversos no tempo,
% com os primeiros n-�simos elementos do vetor x[k]
for n=1:Lx+Lh-1
        y(n)=x(1:n)*h(n:-1:1);
end

%% Comparando os algoritmos
% Verifica-se atrav�s deste gr�fico, que a diferen�a entre as duas fun��es
% de convolu��o � da ordem de 10E-10, ou seja, � insignificante.
figure
plot(y_phg)
xlabel("Tempo")
ylabel("Intensidade")
title("Implementa��o da Convolu��o")

figure
plot(y_conv)
xlabel("Tempo")
ylabel("Intensidade")
title("Convolu�ao nativa do matlab")

figure
stem(abs(y_phg - y_conv))
title('Erro')

% podemos ver tamb�m o maior valor entre as diferen�as - o erro - que � de
% ordem insignificante.
max(abs(y_phg-y_conv))