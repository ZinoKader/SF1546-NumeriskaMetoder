function A=trussplot(x,y,br,c)
% TRUSSPLOT  Plots a truss
%
% TRUSSPLOT(X,Y,BARS) plots a truss with nodes in
% coordinates (X,Y) and bars between node indices
% given in BARS. 
%
% The same plotstyles S as the PLOT command can be obtained
% with TRUSSPLOT(X,Y,BARS,S).

if (nargin < 4)
  c='k';
end

for k=1:length(br)
    plot(x(br(k,1:2)),y(br(k,1:2)),c); hold on
end
axis equal
hold off



