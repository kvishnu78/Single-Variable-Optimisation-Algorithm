%% Newton Raphson Method
%Author: Vishnu K
%last updated:06 Oct 2020
%In the Newton-Raphson method,a linear approximation to the first derivative of the function is made at a
%point using the Taylor’s series expansion. That expression is equated to zero
%to find the next guess. If the current point at iteration t is x(t),

%% Input to algorithm
%Choose initial guess x0
prompt='Enter initial guess x0: ';
x0=input(prompt);
prompt='Enter termination parameter: ';
e=input(prompt);
%enter function as input
prompt='Enter the function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string
%% computations
% initialisations
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
x1=x0;%xk
while(1)
    fx1_der2=SecondDerivative(f,x1);
    x2=x1-(firstDerivative(f,x1)/fx1_der2);%x2=x_k+1  and x1=x_k
    fx2_der1=firstDerivative(f,x2);
    if(abs(fx2_der1)<e)
        disp(['Hurray! the minimum is at ',num2str(x2),' with the function value ',num2str(feval(f,x2))]);
        break;
    else
        x1=x2;%k=k+1
    end
end
%% First Derivative
function f_der=firstDerivative(g,x)
    if(-0.01<x && x<0.01)
        del_x=0.0001;
    else
        del_x=0.01*abs(x);
    end
    f_der=(feval(g,x+del_x)-feval(g,x-del_x))/(2*del_x);
    %𝑓′(a)=(𝑓(a+Δa)−𝑓(𝑎−Δ𝑎))/2Δ𝑎
end

%% Second Derivative
function f_der2=SecondDerivative(g,x)
    if(-0.01<x && x<0.01)
        del_x=0.0001;
    else
        del_x=0.01*abs(x);
    end
    f_der2=(feval(g,x+del_x)-2*feval(g,x)+feval(g,x-del_x))/(del_x^2);
   %𝑓′′(a)=(f(a+Δa)−2f(a)+f(a−Δa))/Δa^2
end