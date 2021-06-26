theta = 0:pi/180:2*pi; 
r = zeros(1,37);
r0 = 10;
dr = 2;
change = r0-dr/2;
pull = r0-dr;
%1
r = r+r0;
r(1) = change;
r(2:4) = r0;
r(5) = change;
r(6:12) = pull;
r(13) = change;
r(14:16) = r0;
r(17) = change;
r(18:36) = pull;
r(37) = change;

p=polyfit(theta,r,20);
r = polyval(p,theta);
polarplot(theta,r)




