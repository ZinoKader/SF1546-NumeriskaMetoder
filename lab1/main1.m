
% Några nollställen:

% x≈1.945
% x≈2.727
% x≈3.859
% x≈4.905

% jämför värden på: 
% www.wolframalpha.com/input/?i=x%5E2+-+9*x+-+12*sin(3*x+%2B+1)+%2B+20

% Det finns 6 nollställen totalt - se nollställen.fig

clc
close all
x0 = 1.9446428935136946906;
x1 = 2.7270929625423093925;
x2 = 3.8598941014263592357;
x3 = 4.9050416992212232942;
x4 = 6.0061925134423466720;
x5 = 6.8459963836977124461;


feltolerans = 10^-10;


%uppgift 1a)
nums = 0:0.01:10;
plot(nums, ose(nums))
hold on
plot(nums, 0*nums, "r-")
%figure()


% uppgift 1b)
fixpunkt(1.7, feltolerans)
% kan bara räkna ut nollställen som har tillräckligt långt avstånd från
% varandra

% iterationen konvergerar om abs(f'(x)) < 1 ; divergerar om abs(f'(x)) > 1

%uppgift 1c)
newton(1.7, feltolerans)
