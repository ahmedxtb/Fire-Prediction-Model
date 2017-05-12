noise=randn(1,1001)-0.5;
% noise=0;
noiset=noise*100;
noiseT=noiset';
TemN1=Tem1+noiseT;TemN21=Tem21+noiseT;TemN31=Tem31+noiseT;

noises=noise*10;
noiseS=noises';
SmokeN1=Smoke1+noiseS;SmokeN21=Smoke21+noiseS;SmokeN31=Smoke31+noiseS;

noisec=noise*10;
noiseC=noisec';
ColourN1=Colour1+noiseC;ColourN21=Colour21+noiseC;ColourN31=Colour31+noiseC;


