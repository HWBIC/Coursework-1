     clear all
     clc
     count_generations = 0;
     popsize = 100;
     mute_rate = 0.8;
     eval = 1000;
     dim = 2;
     %tour = 8;
     %gen = 200;
     crosrange = 5;
    % precision = 5;
     p=1/popsize;
     a=1;
     do=0;
     for j = drange(1:popsize)
         for d = drange(1:dim)
             x(d)=rand;
         end
     total(j,:)=x;
     end
 total;
 best=fitnessandsort(total);
 best_t=best';

 for g = drange(1:popsize)
     probs(g)=a;
     a=a-p;
 end
 
 for j = drange(1:eval)
 test=fitnessandsort(best');
 if myfunc(test(:,1)')<=0.001
     break
 else

      for sol = drange(1:dim)
         crostimes=randi([1 crosrange]);
         for times = drange(1:crostimes)
         r1=randi([1 popsize]);
         r2=randi([1 popsize]);
         k1 = test(sol,r1);
         k2 = test(sol,r2);
         test(sol,r1)=k2;
         test(sol,r2)=k1;
         end
      end
      best=test;
 test=fitnessandsort(best');
 while do == 0
    x=randi([1 popsize]);
    luck=rand;
    if luck<probs(x)
        do = 1;
    else
        do = 0;
    end
 end
 do=0;
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
 old_worst=myfunc(test(:,popsize)');
 if new<=old_worst
     test(:,popsize)=selected;
 else
 end
 best=test;
 end
 count_generations=count_generations+1;
 end
 test=fitnessandsort(best');
 best_t=test';
 for v = drange(1:popsize)
 neww_best(1,v)=myfunc(best_t(v,:));
 end
 neww_best
 best_value_achieved=neww_best(1)
 count_generations

     