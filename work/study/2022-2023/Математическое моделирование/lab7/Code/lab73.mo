model lab73

parameter Real N = 945;
parameter Real N0 = 13;
Real n(start = N0);

function f
  input Real t;
  output Real result;
 algorithm
  result:=0.99*t;
  end f;

function g
  input Real t;
  output Real result;
 algorithm
  result:=0.3*cos(4*t);
  end g;

equation

der(n)=(f(time)+g(time)*n)*(N-n);

annotation(experiment(StartTime = 0, StopTime = 1.0, Tolerance = 1e-6, Interval = 0.1));

end lab73;
