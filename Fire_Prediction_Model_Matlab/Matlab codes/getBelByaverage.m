function [bellow_medium_high,Xavg]=getBelByaverage(r11,r21,r31,t,s,c)

for k=1:1000
 Xt(k)=(r11(1).TemN(k)-20)/(1000-20);
 if(r11(1).TemN(k)>1000)
 Xt(k)=1;
   end
   if(r11(1).TemN(k)<20)
        Xt(k)=0;
   end   
    
    Xs(k)=(r21(1).SmokeN(k)/100);
if(r21(1).SmokeN(k)>100)
        Xs(k)=1;
    end
    if(r21(1).SmokeN(k)<0)
        Xs(k)=0;
    end
    Xc(k)=(r31(1).ColourN(k))/(18);
if(r31(1).ColourN(k)>18)
Xc(k)=1;
end
    if(r31(1).ColourN(k)<0)
Xc(k)=0;
    end
  Xavg(k) = t*Xt(k)+s*Xs(k)+c*Xc(k);
    
Xn=t*0.028+s*0.08+c*0.03;
Xnnl=t*0.04+s*0.09+c*0.04;
Xnll=t*0.07+s*0.1+c*0.27;
Xllm=t*0.1+s*0.2+c*0.31;
Xlmm=t*0.4+s*0.4+c*0.4;
Xmmh=t*0.5+s*0.5+c*0.5;
Xmhh=1;    


if(Xavg(k)<Xn)
    normal(k)=1; normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
elseif(Xavg(k)<=Xnnl)
       normal(k)=1-Xc(k);
       normal_low(k)=Xc(k); low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
elseif(Xavg(k)<=Xnll)
    normal(k)=0;
    normal_low(k)=1-Xc(k); low(k)=Xc(k); low_medium(k)=0; medium(k)=0;
    medium_high(k)=0;
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
elseif(Xavg(k)<=Xllm)
    normal(k)=0;
    normal_low(k)=0; low(k)=1-Xc(k); low_medium(k)=Xc(k); medium(k)=0;
    medium_high(k)=0;
    high(k)=0; 
     bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
elseif(Xavg(k)<=Xlmm)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=1-Xc(k); medium(k)=Xc(k);
    medium_high(k)=0;
    high(k)=0;
   bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    elseif(Xavg(k)<=Xmmh)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=1-Xc(k);
    medium_high(k)=Xc(k);
    high(k)=0;
    bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
    elseif(Xavg(k)<=Xmhh)
    normal(k)=0;
    normal_low(k)=0; low(k)=0; low_medium(k)=0; medium(k)=0;
    medium_high(k)=1-Xc(k);
    high(k)=Xc(k);
   bellow_medium_high(k)=low(k)+medium(k)+low_medium(k)+medium_high(k)+high(k);
end
end
end
