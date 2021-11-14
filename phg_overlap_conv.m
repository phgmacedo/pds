function y=phg_overlap_conv(x,h,k)
% calcula a convolu��o atrav�s do m�todo overlap-add
% x e h s�o 2 vetores de qualquer forma, e k � o n�mero de elementos em
% cada bloco, retorna vetor coluna

% Overlap-add � uma forma eficiente para calcular a convolu��o discreta de
% um sinal x longo com uma resposta ao impulso finita; 
% dividindo-se o sinal em blocos de tamanho apropriado, podemos calcular
% sua convolu��o discreta com apenas um pequeno delay.
% sobre: https://en.wikipedia.org/wiki/Overlap%E2%80%93add_method

% se alguns dos argumentos possuir apenas 1 elementos, a convolu��o � o
% produto escalar entre eles.
if min([numel(x) numel(h) k]) == 1
    y = phg_conv(x,h);
    return
end

% x precisa ser inteiramente dividido em blocos de k elementos, por isso
% adicionamos k zeros ao final de x
x(numel(x)+k)=0;

% L � o tamanho de x, com zeros adicionados, M � o tamanho de y
M = numel(h);
L = numel(x);

% protege contra vetores linha, pois y e x precisam ser colunas
if (isrow(x)==1)
    x = transpose(x);
end
if (isrow(h) == 1)
    h = transpose(h);
end

% pr�-aloca y_aux, que � a matrix com as convolu��es deslocadas
y = zeros(L+M-1);

% calcula uma matriz que � a convolu��o entre h, e os peda�oes do vetor x,
% de tamanho k
for n = 1:floor(L/k)
    y = y + [zeros((n-1)*k,1); phg_conv( x(1+(n-1)*k:n*k), h ); zeros(L-n*k,1)];
end

% pr� aloca y, que � a convolu��o
 % y = zeros( L+M-1 );

% % soma todas as colunas da matriz y_aux
% for n = 1:floor(L/k)
%     y = y+y_aux(:,n);
% end

y=y(1:L+M-k-1);