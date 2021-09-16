%% Succesive Quadratic Estimation
%Author: Vishnu K
%last updated:06 Oct 2020
%In this algorithm, the fitted curve is a quadratic polynomial function. Since
%any quadratic function can be defined with three points, the algorithm begins
%with three initial points.
%% Input to algorithm
%Initial point x1 taken as input
prompt='Enter initial point x1: ';
x1=input(prompt);
prompt='Enter step size delta: ';
delta=input(prompt);
prompt='Enter termination Parameter: ';
e=input(prompt);
%enter function as input
prompt='Enter the function in x: ';
fun=input(prompt,'s');%s is used for storing the function as a string
%% computations
% initialisations
f=inline(fun,'x');%converting the string to infix expression i.e. an inline function
x2=x1+delta;
f1=feval(f,x1);
f2=feval(f,x2);
if(f1>=f2)%setting initial conditions for x1,x2,x3
    x3=x1+2*delta;
else
    x3=x1-delta;
end
f3=feval(f,x3);
a0=f1;
a1=(f2-f1)/(x2-x1);
a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
%will run as long as a2 is positive
while(a2>0)   
    Fmin=min([f1,f2,f3]);%for finding minimum function value
    %finding Xmin 
    if(Fmin==f1)
        Xmin=x1;
    else if (Fmin==f2)
        Xmin=x2;
        else if(Fmin==f3)
                Xmin=x3;
            end
        end
    end
    a0=f1;
    a1=(f2-f1)/(x2-x1);
    a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    x_bar=((x1+x2)/2)-(a1/(2*a2));
    fx_bar=feval(f,x_bar);
    %checking if current point satisfies termination condition
    if(abs(Fmin-fx_bar)<e && abs(Xmin-x_bar)<e)
        Fmin=min([f1,f2,f3,fx_bar]);%reusing fmin for displaying output
        if(Fmin==f1)
            Xmin=x1;
        else if (Fmin==f2)
            Xmin=x2;
            else if(Fmin==f3)
                    Xmin=x3;
                else if(Fmin==fx_bar)
                        Xmin=x_bar;
                    end
                end
            end
        end
        disp(['Hurray! the minimum is at ',num2str(Xmin),' with the function value ',num2str(Fmin)]);
        break;
    else
        %if minimum not found trying to find new set of 3 points from
        %availabe four points
        temp=sort([f1,f2,f3,fx_bar]);
        for i=1:3
            if(temp(i)==f1)
                p(i)=x1;
                i=i+1;
            else if(temp(i)==f2)
                p(i)=x2;
                i=i+1;
                else if(temp(i)==f3)
                    p(i)=x3;
                    i=i+1;
                    else if(temp(i)==fx_bar)
                                p(i)=x_bar;
                                i=i+1;
                        end
                    end
                end
            end
        end
        %getting the best 3 points and sorting them
        temp_x=sort(p);
        x1=temp_x(1);
        x2=temp_x(2);
        x3=temp_x(3);
        f1=feval(f,x1);
        f2=feval(f,x2);
        f3=feval(f,x3);
    end
end
if(a2<=0)
    disp(['Sorry, Program terminating abruptly as a2<=0']);
end