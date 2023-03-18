model lab62
parameter Real a= 0.01;
parameter Real b= 0.02;

parameter Real N = 10850;
parameter Real y0 =209;
parameter Real z0 = 42;
parameter Real x0 =  N - y0 - z0;

Real X(start=x0);
Real Y(start=y0);
Real Z(start=z0);

equation //I>I*

der(X)= a*X;
der(Y)= a*X - b*Y;
der(Z)= b*Z;

annotation(experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.2));

end lab62;
