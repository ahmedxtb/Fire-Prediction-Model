function alarm=earlyAlarm(belSignal,thereshold,duration)
flag=0;

for i=1:1000
    
    if(belSignal(i)>thereshold)
     flag=flag+1;
     if(flag>duration)
       alarm(i)=1;  
     end
         
    
        
    end
    
end

end