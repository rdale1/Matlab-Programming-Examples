time1=0; time2=1; time3=6;
time=[time1,time2,time3];
%% Concatenate
Mh = horzcat(time,time);
Mv = vertcat(time,time);
%% Transpose
time = time';
%% Matrix multiplication
time2 = time*time;
time2=time.*time;