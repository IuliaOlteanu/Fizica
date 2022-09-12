% Studiul functiei de distributie Maxwell dupa modulul vitezei a

% moleculelor unui gaz ideal aflat la echilibru termic

% - dependenta de temperatura (grafic 1)

% - dependenta de natura gazului (grafic 2)

% - probabilitatea ca o molecula a aiba viteza cuprinsa intre v1 si v2

% -----------------------------

clc; clear; close all;

kB=1.38e-23; % constanta lui Boltzmann [J/K]

ua=1.67e-27; % unitatea atomica de masa [kg]

T=[400 500 600 300]; % temperatura absoluta a gazului [K]

m0=[84 32 138]*ua; % masa absoluta a moleculei de Ne, O2, si C3H4 [kg]

vmax=3e3; % viteza maxima in reprezentarile grafice [m/s]

v=linspace(0,vmax,1000); % sirul vitezelor moleculare

color=['b' 'g' 'r' 'm' 'k']; % vector de culori pentru grafice

% - dependenta de temperatura

% Realizeaza graficul functiei de distributie pentru N2 la trei temperaturi

subplot(2,1,1) % graficul din jumatatea superioara a ferestrei

hold on

for i=1:3

    f=Maxwell(v,kB,m0(2),T(i));

    plot(v,f,color(i))

end

legend('400 K','500 K','600 K')

title('Dependenta de temperatura a functiei Maxwell pentru hexafluoroetan')

xlabel('v(m/s)'); ylabel('f(s/m)'); grid

% - dependenta de natura gazului

% Realizeaza graficul functiei de distributie la 500 K pentru cele 3 gaze

subplot(2,1,2) % graficul din jumatatea inferioara a ferestrei

hold on

for i=1:3

    f=Maxwell(v,kB,m0(i),T(2)); % se apeleaza functia Maxwell.m

    plot(v,f,color(i+2))

end

legend('kripton','oxigen','chexafluoroetan')

title('Dependenta de natura gazului a functiei Maxwell la 300 K')

xlabel('v(m/s)'); ylabel('f(s/m)'); grid

% - probabilitatea ca o molecula a aiba viteza cuprinsa intre v1 si v2

% azot m0(2) la T(2)=500 K

v1=1e5; v2=inf; % limitele de integrare [m/s]

prob=integral(@(v)Maxwell(v,kB,m0(3),T(4)),v1,v2); % integreaza intre v1 si v2

afis=['Probabilitatea ca o molecula de hexafluoroetan la 300 K sa aiba viteza cuprinsa intre ',...

    num2str(v1),' si ',num2str(v2), ' m/s este: ',num2str(prob*100),'%'];

disp(afis)

% ------------------------------------------------------------------------------

