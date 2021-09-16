%% Bounding Phase Algorithm
%Author: Vishnu K
%last updated:04 Oct 2020
%Bounding phase method is used to bracket the minimum of a function. 
%This method guarantees to bracket the minimum of a unimodal function.

%% Input to algorithm
%Initial guess x0 taken as input
prompt='Enter initial guess x0: ';
x0=input(prompt);
prompt='Enter increment delta: ';
delta=input(prompt);
if(delta<0)
    delta=-1*delta;%just to make sure that the increment parameter is positive for the next stage
end
%enter function as input
prompt='Enter a Unimodal function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string
%% computations
% initialisations
k=0;
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
flag=0;
%function value evaluations are done using feval method
while 1%loop runs infinitely until correct x0 value not entered
    if(feval(f,x0-delta)>=feval(f,x0) &&feval(f,x0)>=feval(f,x0+delta))%checking if f(x0-del)>=f(x0)>=f(x0+del) then delta is positive 
    %no change in delta required as delta is currently positive as defined in input step!
            break;%break the loop if condition satisfied
    else if(feval(f,x0-delta)<=feval(f,x0) && feval(f,x0)<=feval(f,x0+delta))%checking if f(x0-del)<=f(x0)<=f(x0+del) then delta is negative
            delta=-1*delta;
            break;%break the loop if condition satisfied
        else if(feval(f,x0-delta)>=feval(f,x0) && feval(f,x0)<=feval(f,x0+delta))
                disp(['Hurray! the minimum exists in the interval (',num2str(x0-delta),',',num2str(x0+delta),')']);
                flag=1;%used to check if minimum already found
                break;%break the loop if condition satisfied
            else
                x0=input("Invalid x0 value, change intial point!");
            end%end of if 3
        end%end of if 2
    end%wnd of if 1
end%end of while

%evaluations
if flag~=1%minimum not found yet condition
    p1=x0;
    p2=p1+(2^k)*delta;
    k=k+1;%here fx0 will be less than fx1 always
    while 1
        p3=p2+(2^k)*delta;
        f2=feval(f,p2);%f1 is for x_k
        f3=feval(f,p3);%f2 is for x_k+1
        if(f3<f2)
            k=k+1;
        else
            if(p1>p3)%checking if p1 greater than p2 then swapping and displaying
                disp(['Hurray! the minimum exists in the interval (',num2str(p3),',',num2str(p1),')']);
                break;
            else
                disp(['Hurray! the minimum exists in the interval (',num2str(p1),',',num2str(p3),')']);
                break;
            end
        end
        %retaining the values of x_k-1 and x_k for next iterations 
        p1=p2; 
        p2=p3;
    end
end