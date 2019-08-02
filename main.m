clear
clc

IniEng=1;%0.5; % Initial Energy of Every Node
NetSize=200; % Network Size
NoOfNode=200; % Number of Node
NoOfRound=1500; % Number of Round
cluster_head_percentage=0.1;

[STATISTICS1,FD1,TD1,AD1]=leach(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage);%% Leach
[STATISTICS4,FD5,TD5,AD5]=Leach_Centralized(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage); %% Centralized Leach
[STATISTICS2,FD2,TD2,AD2]=Improved1_leach(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage); %% Improved Leach 1
%[STATISTICS25,FD3,TD3,AD3]=Improved1_5_leach(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage); %% Improved Leach 2 
%[STATISTICS3,FD4,TD4,AD4]=EDGE(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage);%% EDGE without two hop comuunication
%[STATISTICS6,FD6,TD6,AD6]=EDGE_TWO_HOP(IniEng,NetSize,NoOfNode,NoOfRound,cluster_head_percentage);%% EDGE with two hop comuunication

r=0:NoOfRound;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(r,STATISTICS1.DEAD,'k:',r,STATISTICS4.DEAD,'m-',r,STATISTICS2.DEAD,'r-.','LineWidth',2);
%plot(r,STATISTICS1.DEAD,'k:',r,STATISTICS4.DEAD,'m-',r,STATISTICS2.DEAD,'r-.',r,STATISTICS3.DEAD,'b-',r,STATISTICS6.DEAD,'g-','LineWidth',2);
legend('LEACH','LEACH-C','E-LEACH','Location','SouthEast');
%legend('Leach','Leach-C','E-Leach','EDGE-without-Two-hop','EDGE-with-Two-hop','Location','SouthEast');
xlabel('x(time)');
ylabel('No of Dead Nodes');
title('No of Allive Nodes Over Time');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(r,STATISTICS1.ALLIVE,'k:',r,STATISTICS4.ALLIVE,'m-',r,STATISTICS2.ALLIVE,'r-.','LineWidth',2);
%plot(r,STATISTICS1.ALLIVE,'k:',r,STATISTICS4.ALLIVE,'m-',r,STATISTICS2.ALLIVE,'r-.',r,STATISTICS3.ALLIVE,'b-',r,STATISTICS6.ALLIVE,'g-','LineWidth',2);
legend('LEACH','LEACH-C','E-LEACH');
%legend('Leach','Leach-C','E-Leach','EDGE-without-Two-hop','EDGE-with-Two-hop');
xlabel('x(time)');
ylabel('No of Allive Nodes');
title('No of Dead Nodes Over Time');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(r,STATISTICS1.PACKETS_TO_BS,'k:',r,STATISTICS4.PACKETS_TO_BS,'m-',r,STATISTICS2.PACKETS_TO_BS,'r-.','LineWidth',2);
%plot(r,STATISTICS1.PACKETS_TO_BS,'k:',r,STATISTICS4.PACKETS_TO_BS,'m-',r,STATISTICS2.PACKETS_TO_BS,'r-.',r,STATISTICS3.PACKETS_TO_BS,'b-',r,STATISTICS6.PACKETS_TO_BS,'g-','LineWidth',2);
legend('LEACH','LEACH-C','E-LEACH','Location','SouthEast');
%legend('Leach','Leach-C','E-Leach','EDGE-without-Two-hop','EDGE-with-Two-hop','Location','SouthEast');
xlabel('x(time)');
ylabel('No of Packets');
title('Number of packets send to Sink Node');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(r,STATISTICS1.TotalEnergy,'k:',r,STATISTICS4.TotalEnergy,'m-',r,STATISTICS2.TotalEnergy,'r-.','LineWidth',2);
%plot(r,STATISTICS1.TotalEnergy,'k:',r,STATISTICS4.TotalEnergy,'m-',r,STATISTICS2.TotalEnergy,'r-.',r,STATISTICS3.TotalEnergy,'b-',r,STATISTICS6.TotalEnergy,'g-','LineWidth',2);
legend('LEACH','LEACH-C','E-LEACH');
%legend('Leach','Leach-C','E-Leach','EDGE-without-Two-hop','EDGE-with-Two-hop');
xlabel('x(time)');
ylabel('Total Energy of Network in (Joule)');
title('The total Remaining Energy of the System in (J)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
bargraph=[FD1,FD5,FD2;TD1,TD5,TD2;AD1,AD5,AD2];
%bargraph=[FD1,FD5,FD2,FD4,FD6;TD1,TD5,TD2,TD4,TD6;AD1,AD5,AD2,AD4,AD6];
bar(bargraph,'group');
legend('LEACH','LEACH-C','E-LEACH','Location','NorthWest');
%legend('Leach','Leach-C','E-Leach','EDGE-without-Two-hop','EDGE-with-Two-hop','Location','NorthWest');
title('The Time when First node die, Tenth node die and All nodes die');
xlabel('FIRST DEATH              TENTH DEATH              ALL DEATH');
ylabel('Number of rounds');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%figure;
%plot(STATISTICS1.PACKETS_TO_BS,STATISTICS1.AvgEnergy,'k:',STATISTICS4.PACKETS_TO_BS,STATISTICS4.AvgEnergy,'m-',STATISTICS2.PACKETS_TO_BS',STATISTICS2.AvgEnergy,'r-.',STATISTICS25.PACKETS_TO_BS,STATISTICS25.AvgEnergy,'g--',STATISTICS3.PACKETS_TO_BS,STATISTICS3.AvgEnergy,'b-','LineWidth',2);
%plot(STATISTICS1.PACKETS_TO_BS,STATISTICS1.AvgEnergy,'k:',STATISTICS4.PACKETS_TO_BS,STATISTICS4.AvgEnergy,'m-',STATISTICS2.PACKETS_TO_BS',STATISTICS2.AvgEnergy,'r-.',STATISTICS3.PACKETS_TO_BS,STATISTICS3.AvgEnergy,'b-','LineWidth',2);
%legend('Leach','Leach-C','Imp1-Leach','Imp2-Leach','EDGE');
%legend('Leach','Leach-C','E-Leach','EDGE');
%xlabel('The Packets send to Base Station');
%ylabel('The Network Energy Over Time');
%title('No. of Packets received at Base Station as a fn. of Avg. Energy Dissipation(J)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure;
%plot(STATISTICS1.PACKETS_TO_BS,STATISTICS1.AvgEnergy,'k:',STATISTICS4.PACKETS_TO_BS,STATISTICS4.AvgEnergy,'m-',STATISTICS2.PACKETS_TO_BS',STATISTICS2.AvgEnergy,'r-.',STATISTICS25.PACKETS_TO_BS,STATISTICS25.AvgEnergy,'g--',STATISTICS3.PACKETS_TO_BS,STATISTICS3.AvgEnergy,'b-','LineWidth',2);
%plot(r,STATISTICS1.COUNTCHS,'k:',r,STATISTICS4.COUNTCHS,'m-',r,STATISTICS2.COUNTCHS,'r-.',r,STATISTICS3.COUNTCHS,'g-','LineWidth',2);
%legend('Leach','Leach-C','Imp1-Leach','Imp2-Leach','EDGE');
%legend('LEACH','LEACH-C','E-LEACH','EECS');
%xlabel('Number of simulation rounds');
%ylabel('Number of cluster heads created');
%title('The number of cluster heads created in each round');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%