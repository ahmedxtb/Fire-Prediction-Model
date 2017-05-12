function [belfusefireFinal,plfusefireFinal]=fuseDatabyEvidenceUpdating(bellow_medium_hight,bellow_medium_highs,bellow_medium_highc,pllow_medium_hight,pllow_medium_highs,pllow_medium_highc,alpha)

beta=1-alpha;

for i=1:1000
    bellow_medium_high(1,i)=bellow_medium_hight(i);
    bellow_medium_high(2,i)=bellow_medium_highs(i);
    bellow_medium_high(3,i)=bellow_medium_highc(i);
    
    pllow_medium_high(1,i)=pllow_medium_hight(i);
    pllow_medium_high(2,i)=pllow_medium_highs(i);
    pllow_medium_high(3,i)=pllow_medium_highc(i);
    belfusefire(i)=bellow_medium_hight(1,i);
    plfusefire(i)=pllow_medium_hight(1,i);
    for k=2:3
       belfusefire(i)=alpha*belfusefire(i)+beta* bellow_medium_high(k,i);
       plfusefire(i)=alpha*plfusefire(i)+beta* pllow_medium_high(k,i);
    end
end

for k=1:1000
belfusefireFinal(k)=belfusefire(k);
plfusefireFinal(k)=plfusefire(k);
end

end 