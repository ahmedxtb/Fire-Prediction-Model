
[r10,r20,r30]=getAlldata(TemN,SmokeN,ColourN);


[normalt,normal_lowt,lowt,low_mediumt,mediumt,medium_hight,hight,bellow_medium_hight,pllow_medium_hight,Xt]=getTemMassfunctionlargeFOD(r10);
[normals,normal_lows,lows,low_mediums,mediums,medium_highs,highs,bellow_medium_highs,pllow_medium_highs,Xs]=getSmokeMassfunctionlargeFOD(r20);
[normalc,normal_lowc,lowc,low_mediumc,mediumc,medium_highc,highc,bellow_medium_highc,pllow_medium_highc,Xc]=getColMassfunctionlargeFOD(r30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [BelUpdatedFireManyinputs,PlUpdatedFireManyinputs]=detectfire_fuseManyinputs(bellow_medium_hight,bellow_medium_highs,bellow_medium_highc,pllow_medium_hight,pllow_medium_highs,pllow_medium_highc,0.9,0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [bellow_medium_highavg,Xavg]=getBelByaverage(r10,r20,r30,1/3,1/3,1/3);
% BelUpdatedFireByaverage=detectfire_fuseWeightedAvg(bellow_medium_highavg,0.9,0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[belfusefireFinal,plfusefireFinal]=fuseDatabyEvidenceUpdating(bellow_medium_hight,bellow_medium_highs,bellow_medium_highc,pllow_medium_hight,pllow_medium_highs,pllow_medium_highc,0.9);

[BelUpdatedFireEvidenceUpdating,PlUpdatedFireEvidenceUpdating,uninputtin,unoutputtin]=firstOrderEvidenceFiltering(belfusefireFinal,plfusefireFinal,0.9,0.1);
% [BelUpdatedFireTV,PlUpdatedFireTV]=firstOrdertimevaryingEvidenceFiltering(belfusefireFinal,plfusefireFinal);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [normaltsc_N,normal_lowtsc_N,lowtsc_N,low_mediumtsc_N,mediumtsc_N,medium_hightsc_N,hightsc_N,bellow_medium_hightsc,normalized]=fuseDempsterShafer(normalt,normal_lowt,lowt,low_mediumt,mediumt,medium_hight,hight,bellow_medium_hight,normals,normal_lows,lows,low_mediums,mediums,medium_highs,highs,bellow_medium_highs,normalc,normal_lowc,lowc,low_mediumc,mediumc,medium_highc,highc,bellow_medium_highc);

% [normaltsc_N,normal_lowtsc_N,lowtsc_N,low_mediumtsc_N,mediumtsc_N,medium_hightsc_N,hightsc_N,bellow_medium_hightsc,normalized]=fuseDempsterShafer(normalt,normal_lowt,lowt,low_mediumt,mediumt,medium_hight,hight,bellow_medium_hight,normals,normal_lows,lows,low_mediums,mediums,medium_highs,highs,bellow_medium_highs,normalc,normal_lowc,lowc,low_mediumc,mediumc,medium_highc,highc,bellow_medium_highc)

% BelUpdatedFireDS=firstOrderEvidenceFiltering(bellow_medium_hightsc,bellow_medium_hightsc,0.9,0.1);
% plot(BelUpdatedFireManyinputs);hold;plot(BelUpdatedFireByaverage,'g')
plot(BelUpdatedFireEvidenceUpdating,'r');
% plot(BelUpdatedFireDS,'r');