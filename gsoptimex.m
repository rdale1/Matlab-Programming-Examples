opts=optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxFunEval',10000,'MaxIterations',100000);
problem = createOptimProblem('fmincon','objective',@mins,'x0',P,'Aineq',[],'bineq',[],'Aeq',[],'beq',[],'lb',lb,'ub',ub,'nonlcon',constraint,'options',opts);
[xgs,~,~,~,solsgs]=run(gs,problem);
xgs
solsgs
P=xgs;