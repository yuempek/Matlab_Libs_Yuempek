function  output = reflection(input, minlimit, maxlimit)
% REFLECTION
% reflects the values between min and max limits. 
% sample
% figure; plot(reflection(1:100, 50, 60));
% figure; plot(reflection(sin(0:0.01:(5*pi)), -0.8, +0.8));

    output = minlimit + abs(input - minlimit);
    output = maxlimit - abs(maxlimit - output);
    
    rereflectCondition = or(output < minlimit,  output > maxlimit);
    rereflect = output(rereflectCondition);
    
    if ~isempty(rereflect)
        output(rereflectCondition) = reflection(rereflect, minlimit, maxlimit);
    end
end
