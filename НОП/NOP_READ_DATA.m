clear s;
s = serialport("COM3", 115200);

N = 1e4;

CommandData = zeros(1,N);
AngleData = zeros(1,N);
XData = 1:N;

for i = 1:N
    InData = char(readline(s));

    Command = str2double(InData(1:find(InData == ' ')));
    Angle = str2double(InData(find(InData == ' '):end));

    CommandData(i) = Command;
    AngleData(i) = Angle;
    fprintf('Выполнено на %.3f%%\n',i/N*100);
    pause(1e-3);
    clc
end

hold on
grid on
axis([0 N 0 180]);
plot(XData,CommandData,'LineWidth',1.5,'Color','Red');
plot(XData,AngleData,'LineWidth',1.5,'Color','Blue');
legend('Командный сигнал','Сигнал с датчика');
clear s;