model lab71
parameter Real N = 945;
parameter Real N0 = 13;
Real n(start = N0);

function f
  input Real t;
  output Real result;
 algorithm
  result:=0.51;
  end f;

function g
  input Real t;
  output Real result;
 algorithm
  result:=0.000099;
  end g;
equation
der(n)=(f(time)+g(time)*n)*(N-n);

annotation(experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.1));

end lab71;
