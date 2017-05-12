
[t1,Temdatacom,t2,s1,Smokedatacom,s2,c1,Colourdatacom,c2 ] = GenerateArtificialDatawithfireEndSeperatelyForNofire()
r1=getTemdata(t1,Temdatacom,t2);
r2=getSmokedata(s1,Smokedatacom,s2);
r3=getColourdata(c1,Colourdatacom,c2);
[r11,r21,r31]=addNoisetodata(r1,r2,r3);
% [r11,r21,r31]=dropnodes(r11,r21,r31);

