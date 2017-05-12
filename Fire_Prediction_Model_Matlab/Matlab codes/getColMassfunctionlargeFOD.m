function [normal,normal_low,low,low_medium,medium,medium_high,high, bellow_medium_high,pllow_medium_high,Xc]=getColMassfunctionlargeFOD(r31)
for k=1:1000
Xc(k)=(r31(1).ColourN(k))/(18);
if(r31(1).ColourN(k)>18)
        Xc(k)=1;

    end 
    if(r31(1).ColourN(k)<0)
        Xc(k)=0;

    end 
if(Xc(k)<0.03)
    normal(k)=1; normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xc(k)<=0.04)
       normal(k)=1-Xc(k);
       normal_low(k)=Xc(k); low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xc(k)<=0.27)
    normal(k)=0;
    normal_low(k)=1-Xc(k); low(k)=Xc(k); low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xc(k)<=.31)
    normal(k)=0;
    normal_low(k)=0; low(k)=1-Xc(k); low_medium(k)=Xc(k); medium(k)=0;
    medium_high(k)=0;
    high(k)=0; 
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
elseif(Xc(k)<=0.4)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=1-Xc(k); medium(k)=Xc(k);
    medium_high(k)=0;
    high(k)=0;
   bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
   pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
    elseif(Xc(k)<=0.5)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=1-Xc(k);
    medium_high(k)=Xc(k);
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
    elseif(Xc(k)<=1)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=1-Xc(k);
    high(k)=Xc(k);
   bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
   pllow_medium_high(k)=bellow_medium_high(k)+normal_low(k);
%      elseif(Xc(k)<=1)
%     normal(k)=0;
%     normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
%     medium_high(k)=1-Xc(k);
%     high(k)=Xc(k);
end

end

plot(normal,'b');hold;plot(normal_low,'g');hold;plot(low_medium,'c');hold;plot(medium,'r')

end