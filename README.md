# DDoS-Simulation
The objective of this project was to simulate a Distributed Denial of Service (DDoS) network attack and analyze its impact on network traffic using NS2. The simulation was coded using tcl scripting, and it involved 4 users, 7 routers, 1 webserver, and 12 bots. The bots were used to attack the links between routers, resulting in a DDoS attack on the network.

To start the simulation, we first created a network topology using NS2, consisting of 4 users, 7 routers, and 1 webserver. We then introduced 12 bots into the network, which generated a high volume of traffic and overwhelmed the routers' capacity. The bots were programmed to generate traffic at a high rate, targeting specific links between routers.

Once the simulation was complete, a trace file was generated, which contained information on the network traffic and the packets dropped from each user node within every second during the simulation. This information was used to create a visual representation of the simulation to analyze the total number of packets dropped from each user node within every second during the simulation to achieve the highest degradation possible.

We analyzed the simulation results by examining the network's performance metrics, such as the throughput, delay, and packet loss. We also analyzed the performance of individual nodes and links in the network to determine which ones were most vulnerable to the DDoS attack. This information could be used to identify potential weaknesses in the network and develop strategies to mitigate the effects of a DDoS attack.

The simulation results were presented in a report that included graphs and charts to illustrate the impact of the DDoS attack on the network. The report also discussed the strengths and weaknesses of the network in terms of its ability to withstand a DDoS attack and suggested possible improvements to enhance the network's security.

In conclusion, this project simulated a DDoS attack on a network using NS2 and tcl scripting and analyzed its impact on network traffic. The results provided valuable insights into the network's performance under attack and identified potential vulnerabilities that could be addressed to enhance its security.
