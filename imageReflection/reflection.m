function  output = reflection(input, minlimit, maxlimit)
%% REFLECTION
% reflects the values between min and max limits. 
% sample
% %% reflection of an array
% arr_in = 1:100;
% min_limit = 50;
% max_limit = 60;
% arr_reflect = reflection(arr_in, min_limit, max_limit);
% figure; plot(arr_in,':'); hold on; plot(arr_reflect, '-'); hold off;
% 
% %% reflection of an wave
% arr_in = sin(0:0.01:(5*pi)); % results between -1..1
% min_limit = -0.8; % reflect from -0.8
% max_limit = +0.8; % reflect from  0.8
% arr_reflect = reflection(arr_in, min_limit, max_limit);
% figure; plot(arr_in,':'); hold on; plot(arr_reflect, '-'); hold off;

    output = minlimit + abs(input - minlimit);
    output = maxlimit - abs(maxlimit - output);
    
    rereflectCondition = or(output < minlimit,  output > maxlimit);
    rereflect = output(rereflectCondition);
    
    if ~isempty(rereflect)
        output(rereflectCondition) = reflection(rereflect, minlimit, maxlimit);
    end
end
