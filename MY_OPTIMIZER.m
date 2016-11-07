function xbest = MY_OPTIMIZER(FUN, DIM, ftarget, maxfunevals)
  mute_rate = 0.8;
  maxfunevals = min(1e8 * DIM, maxfunevals); 
  popsize = min(maxfunevals, 200);
  fbest = inf;
  xpop = 10 * rand(DIM, popsize) - 5;      % new solutions
 for iter = 1:ceil(maxfunevals/popsize)
    [fvalues, idx] = sort(feval(FUN, xpop)); % evaluate
     if fbest > fvalues(1)                    % keep best
      fbest = fvalues(1);
      xbest = xpop(:,idx(1));
     end
     if feval(FUN, 'fbest') < ftarget         % COCO-task achieved
      break;                                 % (works also for noisy functions)
     end
	x=randi([1 popsize]);
	selected=xpop(:,x);
	prob=rand;
	if prob<mute_rate
		for i = drange(1:DIM)
			mu=-rand*0.01;
			selected(i)=selected(i)+mu;
		end
	end
	new=feval(FUN, selected);
	old_worst=feval(FUN, xpop(:,popsize));
	if new<=old_worst
		xpop(:,popsize)=selected;
	end
 end 
