function y = phg_filter(b,a,x)
% a fun��o phg_filter recebe tr�s argumentos, para resolver a equa��o de
% difere�as. 
% a � um vetor dos coeficientes que acompanham y
% b � um vetor dos coeficientes que acompanham x
% x � um vetor do sinal
% Uma equa��o de diferen�as � do tipo:
% a(n)y(n) + a(n-1)y(n-1) ... a(1)y(1) = b(n)x(n) + b(n-1)x(n-1) ... b(1)x(1)
% podemos encontrar a sa�da conhecendo apenas

% pega o maior numero 
% pra servir de padr�o pro produto escalar
% espero que o compilador do matlab seja bom o suficiente para pular todas
% as multiplica��es por zeros desnecess�rias
max_size = max([numel(x) numel(a) numel(b)]); 

% preenche o restante com zeros, at� max_size
y(max_size) = 0;
y = transpose(y);
a(max_size) = 0;
b(max_size) = 0;

% protege contra um vetor coluna, a e b precisam ser linhas
if (isrow(b)==0)
    b = transpose(b);
end
if (isrow(a) == 0)
    a = transpose(a);
end
% assegura que x � vetor coluna
if (iscolumn(x) == 0)
    x = transpose(x);
end

% resolve a equa��o de diferen�as
for n=1:numel(x)
    y(n) = (1/a(1))*( b(1:n)*x(n:-1:1) -a(2:n)*y(n-1:-1:1) );
end

%trunca a sa�da para que a compara��o com a fun��o do matlab possa ser feita
y = y( 1:numel(x) );