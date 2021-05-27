function [y, x2, errorq] = quantize(x,nivel)

    % Levels of uniform quantization 
    dif=(max(x)-min(x))/(nivel-1);
    val=[min(x):dif:max(x)];

    % y = vector to plot levels of quantization
    y=kron(val',ones(1,size(x,1)));
            %------------  A LAW
    A=87.6;

    for i=1:length(x)
        if abs(x(i))<(1/A)
            xp(i,1)=sign(x(i)).*((A*abs(x(i)))/(1+log(A)));
        else
            xp(i,1)=sign(x(i)).*((1+log(A*abs(x(i))))/(1+log(A)));
        end 
    end

    % Value decision: it decides where the value corresponds to one level
    % according minimum distance
    ref=repmat(xp',nivel,1); 
    x1=abs(y-ref);   
    [distancia x2]=min(x1);


    %Signal normalization 
    m=2/(nivel-1);
    b=(-nivel-1)/(nivel-1);
    xerror=m.*x2+b;

    for i=1:size(xp,1)
        if xp(i)==0
            xp(i)=0.001;
        end    
        er(i)=abs((xp(i)-xerror(i))/xp(i));
    end

    errorq=mean(er);
end