
function [X, cond, count] = Gauss_P(A,b,x_0,n_max) 

[m, n] = size(A);

if m>n
    X = x_0;
    count = 0;
    cond='Sistema no compatible';
elseif m<n
    X = x_0;
    count = 0;
    cond='El sistema tiene infinitas soluciones';
else
    count=0;
    M=[A b];
    for i=1:n-1
        [aux0,aux]=max(abs(M(i+1:n,i)));
        if count==n_max
            break
        end
        if aux0>abs(M(i,i))
            aux2=M(i+aux,i:n+1);
            M(aux+i,i:n+1)=M(i,i:n+1);
            M(i,i:n+1)=aux2;
        end
        for j=i+1:n
                if M(j,i)~=0
                    M(j,i:n+1)=M(j,i:n+1)-(M(j,i)/M(i,i))*M(i,i:n+1);
                end
        end
        count=count+1
    end
    x=zeros(n,1);
    for i=n:-1:1
        a=M(i,i);
        b=M(i,n+1);
        c=0;
        for j=i+1:n
            c=c+M(i,j)*x(j);
        end
        x(i)=(b-c)/a;
    end
    X=x;
    cond = 'Se obtuvo una respuesta para el sistema de ecuaciones.';
end
end