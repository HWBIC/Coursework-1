     clear all
     clc
     count = 0;
     population = 100;
     dim = 2;
     tour = 8;
     best_champs = 5;
     gen = 200;
     crosrange = 5;
     precision = 5;
     
     for j = drange(1:population)
         for d = drange(1:dim)
             x(d)=rand;
         end
    y = myfunc(x);
     total(j,:)=x;
     end
     
 total;
 
 for g = drange(1:tour)
         pick=randi([1 population]);
         new(g,:)=total(pick,:);
 end
 
  best=fitnessandsort(new)
  
 for h = drange(1:best_champs)
     champs(:,h)=best(:,h);
 end
 
 champs;
 champs_old=champs;
 champs_old
 for g = drange(1:gen)
     for sol = drange(1:dim)
         crostime=randi([1 crosrange]);
         for times = drange(1:crostime)
         r1=randi([1 best_champs]);
         r2=randi([1 best_champs]);
         k1 = champs(sol,r1);
         k2 = champs(sol,r2);
         champs(sol,r1)=k2;
         champs(sol,r2)=k1;
         end
     end
     new_champs=updategen(champs,champs_old);
     champs=new_champs;
 end
 champs
