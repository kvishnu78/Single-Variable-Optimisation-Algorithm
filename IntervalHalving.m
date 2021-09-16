%% Interval Halving Method
%Author: Vishnu K
%last updated:05 Oct 2020
%Three points divide the search space into four regions. Fundamental region
%elimination rule is used to eliminate a portion of the search space based
%on function values at the three chosen points. Three points chosen in the
%interval (a, b) are all equidistant from each other and equidistant from the
%boundaries by the same amount.


%% NOTE:IF MINIMUM AFTER N ITERATIONS REQUIRED REMOVE THE SEMI COLON AND FIND 
%% IT MANUALLY FROM THE DISPLAYED a AND b VAlUE


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
prompt='Enter a Unimodal function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string


%% computations
% initialisations
xm=(a+b)/2;%finding intial midpoint
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
L=b-a;%finding length of the region
while(1)
    %computing x1,x2,f1,f2 for iterations
    x1=a+L/4;
    x2=b-L/4;
    fm=feval(f,xm);
    f1=feval(f,x1);
    f2=feval(f,x2);
    %eliminating regions based on conditions 
    if(f1<fm)
        b=xm;
        xm=x1;
    else if(f2<fm)
            a=xm;
            xm=x2;
        else
            a=x1;
            b=x2;
        end
    end
    %checking termination conditions
    L=b-a;
    if(abs(L)<e)
            disp(['Hurray! the minimum exists in the interval (',num2str(a),',',num2str(b),')']);
            break;
    end
end