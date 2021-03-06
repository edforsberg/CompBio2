%Problem 1, Travelling waves
a = 0.1; 
b = 1; 
c = 0.5; 
K = 30; 
D = 0.6; 

t = 100; 
x = 100; 
dt = 1; 
I = zeros(x,1); 
S = zeros(x,1); 
S(1) = 10; 
I(1) = 5;

sProg = zeros(x,t); 
for i = 1:t
    sProg(:,i) = S; 
    nextS = SusceptibleProgression(a,b,c,K,D,I,S,dt); 
    nextI = InfectedProgression(a,c,K,D,I,S,dt); 
    nextS(nextS<0) = 0; 
    nextI(nextI<0) = 0;
    S = nextS; 
    I = nextI;    
end
surf(1:t,1:x,sProg, 'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlabel('t')
ylabel('x')
zlabel('Infectives')
colorbar
title('Infective progression')


