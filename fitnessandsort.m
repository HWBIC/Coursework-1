function y=fitnessandsort(x)
    st=size(x);
    tour=st(1);
    totfit = 0;
    global rank;
    rank=[];
  for i = drange(1:tour)
      f(i)=myfunc(x(i,:));
  end
  new_f=fitness(f);
  new_t=x';
  new_plus_f=[new_t; new_f];
  di=size(new_t);
  dime=di(1);
  new_sorted=sortrows(new_plus_f',dime+1)';
  for g = 1:tour
      totfit=totfit+new_sorted(dime+1,g);
  end
  for e = 1:tour
      rank(e)=1-(100*new_sorted(dime+1,e)/totfit);
  end
  %rank=1-rank;
  new_sorted(dime+1,:)=[];
  y=new_sorted;
  