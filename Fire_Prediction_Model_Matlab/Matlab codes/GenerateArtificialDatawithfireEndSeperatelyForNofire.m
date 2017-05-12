function [t1,Temdatacom,t2,s1,Smokedatacom,s2,c1,Colourdatacom,c2 ] = GenerateArtificialDatawithfireEndSeperatelyForNofire()

t1 = randi([27 30],1,50);
fire1= [27:(103/40):130];
fire2 = [130:(130/40):260];
fire3 = randi([260 270],1,166);
Temdata1=cat(2,fire1,fire2,fire3);


t2 = randi([27 30],1,36);
fire12= [130:(-103/69):27];
fire22 = [260:(-130/69):130];
Temdata2=cat(2,fire22,fire12);

Temdatacom=cat(2,Temdata1,Temdata2);


s11 = randi([0 1],1,36);
s1=s11/2;
smokefire1 = [0.5:(4.5/35):5];
smokefire2= [5:1/35:6];
smokefire3=  randi([0 1],1,180);
s32=((smokefire3)/2)+6.5; %max 7
Smokedata1=cat(2,smokefire1,smokefire2,s32);

s22 = randi([0 1],1,36);
s2=s22/2;
smokefire12 = [5:(-4.5/69):0.5];
smokefire22= [6:(-1/69):5];
Smokedata2=cat(2,smokefire22,smokefire12);
Smokedatacom=cat(2,Smokedata1,Smokedata2);

c1 = randi([350 351],1,36);
colourfire1 = [350:(-30/71):320];
colourfire3 = randi([320 321],1,180);
Colourdata1=cat(2,colourfire1,colourfire3);

c2 = randi([350 351],1,36);
colourfire1 = [320:(30/139):350];
Colourdata2=cat(2,colourfire1);
Colourdatacom=cat(2,Colourdata1,Colourdata2);

end