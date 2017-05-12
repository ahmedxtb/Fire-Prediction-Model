function [normal,normal_low,low,low_medium,medium,medium_high,high,bellow_medium_high,pllow_medium_high,Xs]=getSmokeMassfunctionlargeFOD(r21)
for k=1:1000
Xs(k)=(r21(1).SmokeN(k)/100);
if(r21(1).SmokeN(k)>100)
    Xs(k)=1;
end
if(r21(1).SmokeN(k)<0)
    Xs(k)=0;
end
if(Xs(k)<0.08)
normal(k)=1; normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=0.09)
normal(k)=1-Xs(k);
normal_low(k)=Xs(k); low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k); 
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=0.1)
normal(k)=0;
normal_low(k)=1-Xs(k); low(k)=Xs(k); low_medium(k)=0; medium(k)=0;
medium_high(k)=0;
high(k)=0;
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=0.2)
normal(k)=0;
normal_low(k)=0; low(k)=1-Xs(k); low_medium(k)=Xs(k); medium(k)=0;
medium_high(k)=0;
high(k)=0; 
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=0.4)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=1-Xs(k); medium(k)=Xs(k);
medium_high(k)=0;
high(k)=0;
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=0.5)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=1-Xs(k);
medium_high(k)=Xs(k);
high(k)=0;
bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xs(k)<=1)
normal(k)=0;
normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
medium_high(k)=1-Xs(k);
high(k)=Xs(k);
 bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
 pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
%      elseif(Xs(k)<=1)
%     normal(k)=0;
%     normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
%     medium_high(k)=1-Xs(k);
%     high(k)=Xs(k);
end

end

plot(normal,'b');hold;plot(normal_low,'g');hold;plot(low_medium,'c');hold;plot(medium,'r')

end