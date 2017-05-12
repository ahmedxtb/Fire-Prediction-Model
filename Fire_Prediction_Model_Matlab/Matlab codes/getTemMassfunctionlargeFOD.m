function [normal,normal_low,low,low_medium,medium,medium_high,high,bellow_medium_high,pllow_medium_high,Xt]=getTemMassfunctionlargeFOD(r11)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for k=1:1000
Xt(k)=(r11(1).TemN(k)-20)/(1000-20);
if(r11(1).TemN(k)>1000)
    Xt(k)=1;
end
if(r11(1).TemN(k)<20)
    Xt(k)=0;
end
if(Xt(k)<0.028)
normal(k)=1; normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=0.04)
normal(k)=1-Xt(k);
normal_low(k)=Xt(k); low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=0.07)
normal(k)=0;
normal_low(k)=1-Xt(k); low(k)=Xt(k); low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=0.1)
normal(k)=0;
normal_low(k)=0; low(k)=1-Xt(k); low_medium(k)=Xt(k); medium(k)=0;
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=0.4)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=1-Xt(k); medium(k)=Xt(k);
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=0.5)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=1-Xt(k);
medium_high(k)=Xt(k);
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xt(k)<=1)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=1-Xt(k);
high(k)=Xt(k);
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
%      elseif(Xt(k)<=1)
%     normal(k)=0;
%     normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
%     medium_high(k)=1-Xt(k);
%     high(k)=Xt(k);
end

end

plot(normal,'b');hold;plot(normal_low,'g');hold;plot(low_medium,'c');hold;plot(medium,'r')

end