function y=updategen(ol,ne)
    old=ol';
    new=ne';
    st=size(old);
    tour=st(1);
  for i = drange(1:tour)
      fold(i)=myfunc(old(i,:));
      fnew(i)=myfunc(new(i,:));
  end
  fit_fold=fitness(fold);
  fit_fnew=fitness(fnew);
  new_told=old';
  new_tnew=new';
  new_plus_fnew=[new_tnew; fit_fnew];
  new_plus_fold=[new_told; fit_fold];
  di=size(new_tnew);
  dime=di(1);
  new_sorted=sortrows(new_plus_fnew',dime+1)';
  
  for g = drange(1:tour)
      if new_sorted(dime+1,g)<new_plus_fold(dime+1,g)
          yy(:,g)=new_sorted(:,g);
      else
          yy(:,g)=new_plus_fold(:,g);
      end
  end
  yy(dime+1,:)=[];
  y=yy;