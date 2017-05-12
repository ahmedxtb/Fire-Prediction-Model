function [r11,r21,r31]=addNoisetodata(r1,r2,r3)

for i=1:1
    
noise=rand(1,388)-0.5;
% noise=0;
tn=r1(i).Temdatacom+noise*100;
TemN=cat(2,r1(i).t1,tn,r1(i).t2);
r11(1)=struct('TemN',TemN);
end


for i=1:1
    
noise=rand(1,392)-0.5;
% noise=0;
sn=r2(i).Smokedatacom+noise*5;
SmokeN=cat(2,r2(i).s1,sn,r2(i).s2);
r21(1)=struct('SmokeN',SmokeN);
end

for i=1:1
    
noise=rand(1,392)-0.5;
% noise=0;
cn=r3(i).Colourdatacom+noise*10;
ColourN=cat(2,r3(i).c1,cn,r3(i).c2);
r31(1)=struct('ColourN',ColourN);
end

end