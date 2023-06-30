% Starting coordinate
maxStep = 10000;
radiusInit = 5;
cAccept = false;
while ~cAccept
    c = int16(randi(2*radiusInit + 1, 2, 1) - (radiusInit + 1));
    cAccept = c ~= [0; 0];
end

C = c;
% Random Walk
isReturn = false;
isMaxStep = false;
step = 0;
while ~isReturn && ~isMaxStep
    step = step + 1;
    dx = 0;
    dy = 0;
    t = sign(randn);
    if randn >= 0
        dx = t;
    else
        dy = t;
    end
    c = c + int16([dx;dy]);
    C = [C, c];
    isReturn = all(c == [0; 0], 'all');
    isMaxStep = step >= maxStep;
end
close all
plot(C(1, :), C(2, :));
hold on
plot(C(1, 1), C(2, 1), '.', MarkerSize = 10);
plot(0, 0, '.', MarkerSize = 10);
title(sprintf("Total Steps: %d",step));
legend("Trait", "Origin", "Home");
if ~isReturn
    plot(C(1, end), C(2, end), '.', MarkerSize = 10);
    legend("Trait", "Origin", "Home", "Stop here");
end
grid on