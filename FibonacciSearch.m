%% Fibonacci Search Method
%Author: Vishnu K
%last updated:05 Oct 2020
%The property of the Fibonacci numbers can be used to create a search 
%algorithm that requires only one function evaluation at each iteration. 
%The principle of Fibonacci search is that out of two points required for 
%the use of the region-elimination rule, one is always the previous point 
%and the other point is new. Thus,only one function evaluation is required 
%at each iteration.
%% Input to algorithm
%under the assumption that right limit will be greater than left limit
%right and left limit input
prompt='Enter left limit: ';
a=input(prompt);
prompt='Enter right limit: ';
b=input(prompt);%can also be written as -->b=input("Enter right limit: "); to avoid extra variable called prompt 
prompt='Enter Number of function evaluations: ';
m=input(prompt);
%enter function as input
prompt='Enter a Unimodal function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string


%% computations
% initialisations
L=b-a;%finding length of the region
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
k=2;%function evaluation count
c=0;%variable that decides the number function evaluations per iteration 
while(k<=m)
   Lk=fibo(m-k+1)*L/fibo(m+1);
   x1=a+Lk;
   x2=b-Lk;
   %based on the value of function are evaluated and solved!
   if(c==0)
    f1=feval(f,x1);
    f2=feval(f,x2);
   else if(c==1)
        f1=feval(f,x1);
       else if(c==2)
             f2=feval(f,x2);
            end%end of 3rd if
       end%end of 2nd if 
   end%end of 1st if
   %region elimination and allotment of new values of a and b
   %Also to make sure only one function value is computed in next iteration
   %current iteration function value is stored in appropriate positions
   if(f1<f2)
        b=x2;
        f2=f1;
        c=1;
    else if(f2<f1)
            a=x1;
            f1=f2;
            c=2;
        else
            a=x1;
            b=x2;
            c=0;
        end
    end
   k=k+1;
end
disp(['Hurray! the minimum exists in the interval (',num2str(a),',',num2str(b),')']);

%% Fibonacci Function
function fi=fibo(n)
    if (n==0 || n==1)
        fi=1;
    else 
        fi1=1;
        fi2=1;
        for i=2:n
            fi=fi1+fi2;
            fi1=fi2;
            fi2=fi;
        end
    end
end