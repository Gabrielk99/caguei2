function [placa] = placaExtern(coluna1,coluna2,linha1,linha2,tensao1,tensao2,col,lin)

erro = 100000;
matrizAnterior = zeros (col);


placa = matrizAnterior;

for  x = coluna1
  for y = linha1:linha2
    placa(y,x) = tensao1;
  endfor
endfor
placa(1,coluna1)
for x = coluna2
  for y = linha1:linha2
    placa(y,x) = tensao2;
   endfor
endfor

while(erro>0.00001)
 matrizAnterior = placa;
  for x = 1:lin
    for y = 1:col
      superior = 0;
      aux1 = x-1;
      if(aux1 > 0)
      superior = placa(aux1,y);
      endif
      aux2 = x + 1;
      inferior = 0;
      if (aux2 <lin) 
        inferior = placa(aux2,y);
      endif
      aux3 = y+1;
      direita = 0;
      if(aux3<=col)
      direita = placa (x,aux3);
      endif
      aux4 = y-1;
      esquerda = 0;
      if(aux4>=1)
      esquerda = placa (x,aux4);
      endif
      if (placa (x,y) != tensao1 && placa (x,y) != tensao2)
      placa (x,y) = (direita+inferior+superior+esquerda)/4;
      endif
    endfor
  endfor
  matrizAnterior = placa-matrizAnterior;
  Max = matrizAnterior(1,1);
  for x = 1:lin
    for y = 1:col
      if Max < matrizAnterior (x,y)
        Max = matrizAnterior(x,y);
      endif
    endfor
 endfor
  erro = abs(Max)
endwhile
placa(1,coluna1)
endfunction