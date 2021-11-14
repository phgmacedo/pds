function X = phg_dft(x, N)
% fun��o para o c�lculo da dft. Recebe um vetor x e o numero de pontos da
% dft N.

% M � o tamanho do x
M = numel(x);

% para um vetor maior que o numero de amostras da dft, o Matlab trunca o
% sinal. Por isso, calculamos a dft de N pontos ent�o.
if M>N
    M=N;
end
% pre-alocamos a dft
 X(N)=0;

 % utilizamos dois la�os para calcular a somat�ria da dft pela defini��o
for k=0:N-1
    for n=0:M-1
        X(k+1) = X(k+1) + (x(n+1)*exp( -1i*(2*pi/N)*k*n ));
    end
end

% assegura que a dft ser� compat�vel com a do matlab. Se x � coluna, X
% dever� ser coluna tamb�m.
if (iscolumn(x) == 1)
    X = transpose(X);
end