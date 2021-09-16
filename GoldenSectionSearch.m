%% Golden Section Search Method
%Author: Vishnu K
%last updated:05 Oct 2020
%In this algorithm, the search space (a, b) is first linearly mapped to a 
%unit interval search space (0, 1). Thereafter, two points at τ from either 
%end of the search space are chosen so that at every iteration the eliminated 
%region is (1 − τ ) to that in the previous iteration
%% Input to algorithm
%under the assumption that right limit will be greater than left limit
%right and left limit input
prompt='Enter left limit: ';
a=input(prompt);
prompt='Enter right limit: ';
b=input(prompt);%can also be written as -->b=input("Enter right limit: "); to avoid extra variable called prompt 
prompt='Enter the termination parameter: ';
e=input(prompt);
%enter function as input
prompt='Enter a Unimodal function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string


%% computations
% initialisations
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
aw=0;
bw=1;
Lw=1;
k=1;%iteration count
c=0;%variable to decide number of function evaluations
%(b-a)*(0.618)^n=e
n=1;
%finding number of iterations to be run!
while((b-a)*(0.618)^n>e)
    n=n+1;
end
        
while(k<=n)
    w1=aw+(0.618)*Lw;
    w2=bw-(0.618)*Lw;
    %based on th value of function are evaluated and solved!
    if(c==0)
        %relation between x and w is: x=w*(b-a)+a
        f1=feval(f,w1*(b-a)+a);%for function evaluationuse the actual limit
        f2=feval(f,w2*(b-a)+a);%of a and b
    else if(c==1)
            f1=feval(f,w1*(b-a)+a);
       else if(c==2)
                f2=feval(f,w2*(b-a)+a);
            end%end of 3rd if
       end%end of 2nd if 
   end%end of 1st if
   %region elimination and allotment of new values of a and b
   %Also to make sure only one function value is computed in next iteration
   %current iteration function value is stored in appropriate positions
   %here w1>w2 so aw is replaced with w2!
   if(f1<f2)
        aw=w2;
        f2=f1;
        c=1;
    else if(f2<f1)
            bw=w1;
            f1=f2;
            c=2;
        else
            aw=w1;
            bw=w2;
            c=0;
        end
    end
   k=k+1;
   Lw=bw-aw;
end
%relation between x and w is: x=w*(b-a)+a
disp(['Hurray! the minimum exists in the interval (',num2str(aw*(b-a)+a),',',num2str(bw*(b-a)+a),')']);