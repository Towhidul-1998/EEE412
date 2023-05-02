clc
clear all
close all

bus_id = 14;


power = 0:140;
s = length(power);
% reactive_power = -2000:1:195;
% s = length(reactive_power);

voltage = zeros(1,s);

for j = 1:length(bus_id)
    for i = 1:s

        system = loadcase('case14');

        system.bus(bus_id(1,j),3) = power(1,i);
        result = runpf(system);
        voltage(1,i) = result.bus(bus_id(1,j),8)
    end
    figure
    plot(voltage,power,'r')
    title(['Voltage vs Power for Bus ' , num2str(bus_id(1,j))])
    xlabel('Voltage');
    ylabel('Power');
    hold on
   
%     
%     system.bus(bus_id(1,j),4) = -100;
%     for i = 1:s
%         system.bus(bus_id(1,j),3) = power(1,i);
%         result = runpf(system);
%         voltage(1,i) = result.bus(bus_id(1,j),8);
%     end
%     figure(2)
%     plot(power,voltage,'b')
%     title(['Voltage vs Power After Shunt Capacitance 100Mvar for Bus ' , num2str(bus_id(1,j))])
    
    system = loadcase('case14');

    system.bus(14,4) = -30;
    system.bus(13,4) = 10;
    system.bus(12,4) = -30;
    system.bus(11,4) = -5;
%     system.bus(10,4) = 17;
    system.bus(9,4) = 45;
    system.bus(7,4) = 47;
    system.bus(5,4) = 10;
    system.bus(4,4) = 17;
%     
%     for i = 1:s
%         system.bus(bus_id(1,j),3) = power(1,i);
%         result = runpf(system);
%         voltage(1,i) = result.bus(bus_id(1,j),8);
%     end
% %     figure(2)
%     plot(power,voltage,'b')
%     title(['Voltage vs Power After Shunt Capacitance for Bus  ' , num2str(bus_id(1,j))])
%     
end


