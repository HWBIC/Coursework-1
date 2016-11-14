     clear all
     clc
     count_generations = 0;
     population = 1000;
     mute_rate = 0.8;
     eval = 1000;
     dim = 2;
     tour = 8;
     gen = 200;
     crosrange = 5;
     precision = 5;
     for j = drange(1:population)
         for d = drange(1:dim)
             x(d)=rand;
         end
     total(j,:)=x;
     end

 total;
 
 best=fitnessandsort(total);
 best_t=best';

 for j = drange(1:eval)
 test=fitnessandsort(best');
 if myfunc(test(:,1)')<=0.001
     break
 else
 x=randi([1 population]);
 selected=test(:,x);
 prob=rand;
 if prob<mute_rate
     for i = drange(1:dim)
         mu=-rand*0.01;
         selected(i)=selected(i)+mu;
     end
 else
 end
 new=myfunc(selected');
 old_worst=myfunc(test(:,population)');
 if new<=old_worst
     test(:,population)=selected;
 else
 end
 best=test;
 end
 count_generations=count_generations+1;
 end
 best_t=test';
 for v = drange(1:population)
 neww_best(1,v)=myfunc(best_t(v,:));
 end
 neww_best
 neww_best(1)
 count_generations

     