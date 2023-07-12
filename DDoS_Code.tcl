#Malik Elgomati
#DDoS Simulation 
#Cyber/Infastructure Defense



# Creating the simulation
set ns [new Simulator]

# Setting up the traces
set f [open out.tr w]
set nf [open out.nam w]
$ns namtrace-all $nf
$ns trace-all $f
proc finish {} { 
	global ns nf f
	$ns flush-trace
	puts "Simulation completed."
	close $nf
	close $f
	exit 0
}


#
#Create Nodes
#


set bot01 [$ns node]
      puts "bot01: [$bot01 id]"
set bot02 [$ns node]
      puts "bot02: [$bot02 id]"
set bot03 [$ns node]
      puts "bot03: [$bot03 id]"
set bot04 [$ns node]
      puts "bot04: [$bot04 id]"
set bot05 [$ns node]
      puts "bot05: [$bot05 id]"
set bot06 [$ns node]
      puts "bot06: [$bot06 id]"
set bot07 [$ns node]
      puts "bot07: [$bot07 id]"
set bot08 [$ns node]
      puts "bot08: [$bot08 id]"      
set bot09 [$ns node]
      puts "bot09: [$bot09 id]"
set bot10 [$ns node]
      puts "bot07: [$bot10 id]"
set bot11 [$ns node]
      puts "bot11: [$bot11 id]"
set bot12 [$ns node]
      puts "bot12: [$bot12 id]"

set router01 [$ns node]
      puts "router01: [$router01 id]"
set router02 [$ns node]
      puts "router02: [$router02 id]"
set router03 [$ns node]
      puts "router03: [$router03 id]"
set router04 [$ns node]
      puts "router04: [$router04 id]"
set router05 [$ns node]
      puts "router05: [$router05 id]"
set router06 [$ns node]
      puts "router06: [$router06 id]"
set router07 [$ns node]
      puts "router07: [$router07 id]"


set user01 [$ns node]
      puts "user01: [$user01 id]"
set user02 [$ns node]
      puts "user02: [$user02 id]"      
set user03 [$ns node]
      puts "user01: [$user03 id]"
set user04 [$ns node]
      puts "user04: [$user04 id]"


set WebServer [$ns node]
      puts "WebServer: [$WebServer id]"








#Setting up shape of routers

$router01 shape hexagon
$router02 shape hexagon
$router03 shape hexagon
$router04 shape hexagon
$router05 shape hexagon
$router06 shape hexagon
$router07 shape hexagon


#Setting up Bot and user colors and labels
$bot01 color red
$bot01 label "Bot1"
$bot02 color red
$bot02 label "Bot2"
$bot03 color red
$bot03 label "Bot3"
$bot04 color red
$bot04 label "Bot4"
$bot05 color red
$bot05 label "Bot5"
$bot06 color red
$bot06 label "Bot6"
$bot07 color red
$bot07 label "Bot7"
$bot08 color red
$bot08 label "Bot8"
$bot09 color red
$bot09 label "Bot9"
$bot10 color red
$bot10 label "Bot10"
$bot11 color red
$bot11 label "Bot11"
$bot12 color red
$bot12 label "Bot12"


$user01 color green
$user01 label "User1"
$user02 color green
$user02 label "User2"
$user03 color green
$user03 label "User3"
$user04 color green
$user04 label "User4"


$WebServer color blue
$WebServer label "Web Server"




#
#Setup Bot Connections
$ns duplex-link $bot01 $router01 950kb 5ms RED
$ns duplex-link $bot02 $router02 950kb 5ms RED
$ns duplex-link $bot03 $router03 950kb 5ms RED
$ns duplex-link $bot04 $router04 950kb 5ms RED
$ns duplex-link $bot05 $router05 950kb 5ms RED
$ns duplex-link $bot06 $router06 950kb 5ms RED
$ns duplex-link $bot07 $router07 950kb 5ms RED
$ns duplex-link $bot08 $router03 950kb 5ms RED
$ns duplex-link $bot09 $router04 950kb 5ms RED
$ns duplex-link $bot10 $router05 950kb 5ms RED
$ns duplex-link $bot11 $router06 950kb 5ms RED
$ns duplex-link $bot12 $router07 950kb 5ms RED





#Setup User Connections
$ns duplex-link $user01 $router01 950kb 5ms RED
$ns duplex-link $user02 $router02 950kb 5ms RED
$ns duplex-link $user03 $router06 950kb 5ms RED
$ns duplex-link $user04 $router05 950kb 5ms RED

#Setup Router Connections
$ns duplex-link $router01 $router03 950kb 5ms RED
$ns duplex-link $router02 $router03 950kb 5ms RED
$ns duplex-link $router03 $router04 950kb 5ms RED
$ns duplex-link $router04 $router05 950kb 5ms RED
$ns duplex-link $router04 $router06 950kb 5ms RED
$ns duplex-link $router05 $router07 950kb 5ms RED
$ns duplex-link $router06 $router07 950kb 5ms RED

#Setting up target links
$ns duplex-link $router03 $WebServer 950kb 5ms RED
$ns duplex-link-op $router03 $WebServer color purple
$ns duplex-link-op $router03 $WebServer label "Target Link 1"
 
$ns duplex-link $router05 $WebServer 950kb 5ms RED
$ns duplex-link-op $router05 $WebServer color purple
$ns duplex-link-op $router05 $WebServer label "Target Link 2"

$ns duplex-link $router06 $WebServer 950kb 5ms RED
$ns duplex-link-op $router06 $WebServer color purple
$ns duplex-link-op $router06 $WebServer label "Target Link 3"


#Setup Router to Webserver Connection

$ns duplex-link $router07 $WebServer 950kb 5ms RED







#Set up Webserver Transport Level Connections

set null_WebServer [new Agent/Null]
$ns attach-agent $WebServer $null_WebServer




#Set up Bot Transport Level Connections

set udp_bot01 [new Agent/UDP]
$ns attach-agent $bot01 $udp_bot01

set udp_bot02 [new Agent/UDP]
$ns attach-agent $bot02 $udp_bot02

set udp_bot03 [new Agent/UDP]
$ns attach-agent $bot03 $udp_bot03

set udp_bot04 [new Agent/UDP]
$ns attach-agent $bot04 $udp_bot04

set udp_bot05 [new Agent/UDP]
$ns attach-agent $bot05 $udp_bot05

set udp_bot06 [new Agent/UDP]
$ns attach-agent $bot06 $udp_bot06

set udp_bot07 [new Agent/UDP]
$ns attach-agent $bot07 $udp_bot07

set udp_bot08 [new Agent/UDP]
$ns attach-agent $bot08 $udp_bot08

set udp_bot09 [new Agent/UDP]
$ns attach-agent $bot09 $udp_bot09

set udp_bot10 [new Agent/UDP]
$ns attach-agent $bot10 $udp_bot10

set udp_bot11 [new Agent/UDP]
$ns attach-agent $bot11 $udp_bot11

set udp_bot12 [new Agent/UDP]
$ns attach-agent $bot12 $udp_bot12






#Set up Webserver Transport Level Connections

set udp_user01 [new Agent/UDP]
$ns attach-agent $user01 $udp_user01

set udp_user02 [new Agent/UDP]
$ns attach-agent $user02 $udp_user02

set udp_user03 [new Agent/UDP]
$ns attach-agent $user03 $udp_user03

set udp_user04 [new Agent/UDP]
$ns attach-agent $user04 $udp_user04






#Setup Bot traffic sources
#
set cbr_bot01 [new Application/Traffic/CBR]
$cbr_bot01 set rate_ 400Kb
$cbr_bot01 attach-agent $udp_bot01


set cbr_bot02 [new Application/Traffic/CBR]
$cbr_bot02 set rate_ 400Kb
$cbr_bot02 attach-agent $udp_bot02

set cbr_bot03 [new Application/Traffic/CBR]
$cbr_bot03 set rate_ 300Kb
$cbr_bot03 attach-agent $udp_bot03

set cbr_bot04 [new Application/Traffic/CBR]
$cbr_bot04 set rate_ 500Kb
$cbr_bot04 attach-agent $udp_bot04

set cbr_bot05 [new Application/Traffic/CBR]
$cbr_bot05 set rate_ 600Kb
$cbr_bot05 attach-agent $udp_bot05

set cbr_bot06 [new Application/Traffic/CBR]
$cbr_bot06 set rate_ 450Kb
$cbr_bot06 attach-agent $udp_bot06

set cbr_bot07 [new Application/Traffic/CBR]
$cbr_bot07 set rate_ 600Kb
$cbr_bot07 attach-agent $udp_bot07

set cbr_bot08 [new Application/Traffic/CBR]
$cbr_bot08 set rate_ 300Kb
$cbr_bot08 attach-agent $udp_bot08

set cbr_bot09 [new Application/Traffic/CBR]
$cbr_bot09 set rate_ 200Kb
$cbr_bot09 attach-agent $udp_bot09

set cbr_bot10 [new Application/Traffic/CBR]
$cbr_bot10 set rate_ 300Kb
$cbr_bot10 attach-agent $udp_bot10

set cbr_bot11 [new Application/Traffic/CBR]
$cbr_bot11 set rate_ 250Kb
$cbr_bot11 attach-agent $udp_bot11

set cbr_bot12 [new Application/Traffic/CBR]
$cbr_bot12 set rate_ 200Kb
$cbr_bot12 attach-agent $udp_bot12


#Setup User traffic sources

set cbr_user01 [new Application/Traffic/CBR]
$cbr_user01 set rate_ 100Kb
$cbr_user01 attach-agent $udp_user01

set cbr_user02 [new Application/Traffic/CBR]
$cbr_user02 set rate_ 100Kb
$cbr_user02 attach-agent $udp_user02

set cbr_user03 [new Application/Traffic/CBR]
$cbr_user03 set rate_ 100Kb
$cbr_user03 attach-agent $udp_user03

set cbr_user04 [new Application/Traffic/CBR]
$cbr_user04 set rate_ 100Kb
$cbr_user04 attach-agent $udp_user04




#connect traffic sources to traffic destination (for CBR components, the destination is defined as a NULL component)
$ns connect $udp_bot01 $null_WebServer
$ns connect $udp_bot02 $null_WebServer
$ns connect $udp_bot03 $null_WebServer
$ns connect $udp_bot04 $null_WebServer
$ns connect $udp_bot05 $null_WebServer
$ns connect $udp_bot06 $null_WebServer
$ns connect $udp_bot07 $null_WebServer
$ns connect $udp_bot08 $null_WebServer
$ns connect $udp_bot09 $null_WebServer
$ns connect $udp_bot10 $null_WebServer
$ns connect $udp_bot11 $null_WebServer
$ns connect $udp_bot12 $null_WebServer


$ns connect $udp_user01 $null_WebServer
$ns connect $udp_user02 $null_WebServer
$ns connect $udp_user03 $null_WebServer
$ns connect $udp_user04 $null_WebServer



#define colors for traffic types (bot vs. user)
$ns color 1 green
$ns color 2 red


#sets bot traffic color to red
$udp_bot01 set fid_ 2
$udp_bot02 set fid_ 2
$udp_bot03 set fid_ 2
$udp_bot04 set fid_ 2
$udp_bot05 set fid_ 2
$udp_bot06 set fid_ 2
$udp_bot07 set fid_ 2
$udp_bot08 set fid_ 2
$udp_bot09 set fid_ 2
$udp_bot10 set fid_ 2
$udp_bot11 set fid_ 2
$udp_bot12 set fid_ 2



# set udp_user01 (user) traffic color to green
$udp_user01 set fid_ 1 
$udp_user02 set fid_ 1 
$udp_user03 set fid_ 1 
$udp_user04 set fid_ 1 


#Start up the sources

$ns set-animation-rate 3ms
#start bots at time 0

$ns at 0 "$cbr_bot01 start" 
$ns at 0 "$cbr_bot02 start" 
$ns at 0 "$cbr_bot03 start"
$ns at 0 "$cbr_bot04 start"
$ns at 0 "$cbr_bot05 start"
$ns at 0 "$cbr_bot06 start"
$ns at 0 "$cbr_bot07 start"
$ns at 0 "$cbr_bot08 start"
$ns at 0 "$cbr_bot09 start"
$ns at 0 "$cbr_bot10 start"
$ns at 0 "$cbr_bot11 start"
$ns at 0 "$cbr_bot12 start"


#start user at time 1
$ns at 1 "$cbr_user01 start"
$ns at 1 "$cbr_user02 start"
$ns at 1 "$cbr_user03 start"
$ns at 1 "$cbr_user04 start"

$ns at 10.0 "finish"
#end simulation after 10 seconds

$ns run