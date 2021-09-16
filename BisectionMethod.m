%% Bisection Method
%Author: Vishnu K
%last updated:06 Oct 2020
%In the bisection method, the computation of the second derivative is avoided; instead,
%only the first derivative is used. Both the function value and the sign of the
%first derivative at two points is used to eliminate a certain portion of the search space.
%% Input to algorithm
%under the assumption that right limit will be greater than left limit
%right and left limit input
prompt='Enter left limit: ';
a=input(prompt);
prompt='Enter right limit: ';
b=input(prompt);%can also be written as -->b=input("Enter right limit: "); to avoid extra variable called prompt 
prompt='Enter termination parameter: ';
e=input(prompt);
%enter function as input
prompt='Enter the function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string
%% computations
% initialisations
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
if(firstDerivative(f,a)<0 && firstDerivative(f,b)>0)%making sure that minimum exists in th interval
    x1=a;
    x2=b;
    while(1)
        z=(x1+x2)/2;
        fz_der=firstDerivative(f,z);
        if(abs(fz_der)<e)
            disp(['Hurray! the minimum is at ',num2str(z),' with the function value ',num2str(feval(f,z))]);
            break;
        else if(fz_der<0)
                x1=z;
            else if(fz_der>0)
                    x2=z;
                end%end of if 3
            end%end of if 2
        end%end of if 1
    end%end of while
else
    disp(['The Entered values of a and b do not stisfy the conditions, hence terminating!']);
end
%% First Derivative
function f_der=firstDerivative(g,x)
    if(-0.01<x && x<0.01)
        del_x=0.0001;
    else
        del_x=0.01*abs(x);
    end
    f_der=(feval(g,x+del_x)-feval(g,x-del_x))/(2*del_x);
    %𝑓′(a)=(𝑓(a+Δa)−f(a−Δa))/2Δ𝑎
end