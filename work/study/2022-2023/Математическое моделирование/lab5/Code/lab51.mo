model lab51
parameter Real a = 0.38;
parameter Real b = 0.36;
parameter Real c = 0.037;
parameter Real d = 0.035;

parameter Real x0 = 4;
parameter Real y0 = 14;



Real x(start = x0);
Real y(start = y0);
  

equation

der(x) = -a*x + c*x*y;
der(y) = b*x - d*x*y;
  annotation(experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-6,Interval = 0.1));
end lab51;
