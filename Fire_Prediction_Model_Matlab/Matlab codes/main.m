noise=randn(1,1001)-0.5;

 noiset=noise*100;
 noiseT=noiset';
 TemN=Tem+noiseT;
 noises=noise*10;
 noiseS=noises';
 SmokeN=Smoke+noiseS;
  noisec=noise*10;
  noiseC=noisec';
  ColourN=Colour+noiseC;
  for i=1:200
      x(i)=0;
  end
   for i=1:801
  
  t(i)=-100/801*i;
   end
   o=cat(2,x,t);
   v=SmokeN+o;
    oo=o';
    v=SmokeN+oo;
    SmokeN=v;