function [normaltsc_N,normal_lowtsc_N,lowtsc_N,low_mediumtsc_N,mediumtsc_N,medium_hightsc_N,hightsc_N,bellow_medium_hightsc,normalizedfinal]=fuseDempsterShafer(normalt,normal_lowt,lowt,low_mediumt,mediumt,medium_hight,hight,bellow_medium_hight,normals,normal_lows,lows,low_mediums,mediums,medium_highs,highs,bellow_medium_highs,normalc,normal_lowc,lowc,low_mediumc,mediumc,medium_highc,highc,bellow_medium_highc)

for i=1:1000
    
    normalts(i)=normalt(i)*(normals(i)+normal_lows(i))+normal_lowt(i)*normals(i);
    normal_lowts(i)=normal_lowt(i)*normal_lows(i);
    lowts(i)=lowt(i)*(normal_lows(i)+lows(i)+low_mediums(i))+normal_lowt(i)*(lows(i)+low_mediums(i))+low_mediumt(i)*(normal_lows(i)+lows(i));
    low_mediumts(i)=low_mediumt(i)*low_mediums(i);
    mediumts(i)=low_mediumt(i)*(mediums(i)+medium_highs(i))+mediumt(i)*(low_mediums(i)+mediums(i)+medium_highs(i))+medium_hight(i)*(low_mediums(i)+mediums(i));
    medium_hights(i)= medium_hight(i)* medium_highs(i);
    hights(i)=medium_hight(i)*highs(i)+hight(i)*(medium_highs(i)+highs(i));
    
    %%%%%%%%%%%%%%%%%%%%%%%% masses with 0 intersections
    zeroMasstot(i)=normalt(i)*(lows(i)+low_mediums(i)+mediums(i)+medium_highs(i)+highs(i))+normal_lowt(i)*(mediums(i)+medium_highs(i)+highs(i))+lowt(i)*(normals(i)+mediums(i)+medium_highs(i)+highs(i))+low_mediumt(i)*(normals(i)+highs(i))+mediumt(i)*(highs(i)+normals(i)+normal_lows(i)+lows(i))+medium_hight(i)*(normals(i)+normal_lows(i)+lows(i))+hight(i)*(normals(i)+normal_lows(i)+lows(i)+low_mediums(i)+mediums(i));
%     normalized(i)=1-zeroMasstot(i);
 normalized(i)=normalts(i)+normal_lowts(i)+lowts(i)+low_mediumts(i)+mediumts(i)+medium_hights(i)+hights(i);
   
 if(normalized(i)~=0)
    normalts_N(i)=normalts(i)/normalized(i);
    normal_lowts_N(i)=normal_lowts(i)/normalized(i);
    lowts_N(i)=lowts(i)/normalized(i);
    low_mediumts_N(i)=low_mediumts(i)/normalized(i);
    mediumts_N(i)=mediumts(i)/normalized(i);
    medium_hights_N(i)=medium_hights(i)/normalized(i);
    hights_N(i)=hights(i)/normalized(i);
    else
    normalts_N(i)=normalts(i);
    normal_lowts_N(i)=normal_lowts(i);
    lowts_N(i)=lowts(i);
    low_mediumts_N(i)=low_mediumts(i);
    mediumts_N(i)=mediumts(i);
    medium_hights_N(i)=medium_hights(i);
    hights_N(i)=hights(i);
end
    
    normaltsc(i)=normalts(i)*normalc(i)+normalts(i)*normal_lowc(i)+normal_lowts(i)*normalc(i);
    normal_lowtsc(i)=normal_lowts(i)*normal_lowc(i);
    lowtsc(i)=lowts(i)*(normal_lowc(i)+lowc(i)+low_mediumc(i))+normal_lowts(i)*(lowc(i)+low_mediumc(i))+low_mediumts(i)*(normal_lowc(i)+lowc(i));
    low_mediumtsc(i)=low_mediumts(i)*low_mediumc(i);
    mediumtsc(i)=low_mediumts(i)*(mediumc(i)+medium_highc(i))+mediumts(i)*(low_mediumc(i)+mediumc(i)+medium_highc(i))+medium_hights(i)*(low_mediumc(i)+mediumc(i));
    medium_hightsc(i)= medium_hights(i)* medium_highc(i);
    hightsc(i)=medium_hights(i)*highc(i)+hights(i)*(medium_highc(i)+highc(i));

    zeroMasstotfinal(i)=normalts(i)*(lowc(i)+low_mediumc(i)+mediumc(i)+medium_highc(i)+highc(i))+normal_lowts(i)*(mediumc(i)+medium_highc(i)+highc(i))+lowts(i)*(normalc(i)+mediumc(i)+medium_highc(i)+highc(i))+low_mediumts(i)*(normalc(i)+highc(i))+mediumts(i)*(highc(i)+normalc(i)+normal_lowc(i)+lowc(i))+medium_hights(i)*(normalc(i)+normal_lowc(i)+lowc(i))+hights(i)*(normalc(i)+normal_lowc(i)+lowc(i)+low_mediumc(i)+mediumc(i));
%     normalizedfinal(i)=1-zeroMasstotfinal(i);
    normalizedfinal(i)=normaltsc(i)+normal_lowtsc(i)+lowtsc(i)+low_mediumtsc(i)+mediumtsc(i)+medium_hightsc(i)+hightsc(i);
   
if(normalizedfinal(i)~=0)
    normaltsc_N(i)=normaltsc(i)/normalizedfinal(i);
    normal_lowtsc_N(i)=normal_lowtsc(i)/normalizedfinal(i);
    lowtsc_N(i)=lowtsc(i)/normalizedfinal(i);
    low_mediumtsc_N(i)=low_mediumtsc(i)/normalizedfinal(i);
    mediumtsc_N(i)=mediumtsc(i)/normalizedfinal(i);
    medium_hightsc_N(i)=medium_hightsc(i)/normalizedfinal(i);
    hightsc_N(i)=hightsc(i)/normalizedfinal(i);
    else
    normaltsc_N(i)=normaltsc(i);
    normal_lowtsc_N(i)=normal_lowtsc(i);
    lowtsc_N(i)=lowtsc(i);
    low_mediumtsc_N(i)=low_mediumtsc(i);
    mediumtsc_N(i)=mediumtsc(i);
    medium_hightsc_N(i)=medium_hightsc(i);
    hightsc_N(i)=hightsc(i);
end
bellow_medium_hightsc(i)=lowtsc_N(i)+low_mediumtsc_N(i)+mediumtsc_N(i)+medium_hightsc_N(i)+hightsc_N(i);
end
end