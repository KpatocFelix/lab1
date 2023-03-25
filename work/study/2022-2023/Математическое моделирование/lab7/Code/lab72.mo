model lab72
parameter Real N = 945;
parameter Real N0 = 13;
Real n(start = N0);

function f
  input Real t;
  output Real result;
 algorithm
  result:=0.000019;
  end f;

function g
  input Real t;
  output Real result;
 algorithm
  result:=0.99;
  end g;
equation

der(n)=(f(time)+g(time)*n)*(N-n);

annotation(experiment(StartTime = 0, StopTime = 2.0, Tolerance = 1e-6, Interval = 0.1));

end lab72;
