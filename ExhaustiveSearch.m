%% Exhaustive Search Algorithm
%Author: Vishnu K
%last updated:04 Oct 2020
%In the exhaustive search method, the optimum of a function is bracketed by calculating the function values at
%a number of equally spaced points

%% Input to algorithm
%under the assumption that right limit will be greater than left limit
%right and left limit input
prompt='Enter left limit: ';
a=input(prompt);
prompt='Enter right limit: ';
b=input(prompt);%can also be written as -->b=input("Enter right limit: "); to avoid extra variable called prompt 
%n is no of intervals
prompt='Enter no. of intervals n: ';
n=input(prompt);
%enter function as input
prompt='Enter the function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string

%% computations
% initialisations
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
del_x=(b-a)/n;
x1=a;
x2=a+del_x;
x3=x2+del_x;
%function value evaluations using feval method
f1=feval(f,x1);
f2=feval(f,x2);
f3=feval(f,x3);
%evaluating the minimum
while x3<=b
    if(f1>=f2 && f3>=f2)%checking if f1>=f2<=f3
        disp(['Hurray! the minimum exists in the interval (',num2str(x1),',',num2str(x3),')']);
        % as display requires a string to display, num2str(x) converts number to string
        break;
    end
    %reusing the current function values for next iteration
    x1=x2;
    x2=x3;
    %computing x3 for next iteration
    x3=x3+del_x;
    %reusing the current function values for next iteration
    f1=f2;
    f2=f3;
    %evaluating f3 value for next iteration 
    f3=feval(f,x3);
end
if(x3>b)
    disp(["Sorry! minimum for the given function not found in the interval"]);
end
