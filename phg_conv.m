% a fun��o convolu��o recebe dois vetores, e realiza a convolu��o discreta
% entre eles atrav�s de produtos escalares
% os vetores de entrada podem ser linhas ou colunas, a fun��o retorna um
% vetor linha

function  y = phg_conv(x,h)

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
y = transpose(y);