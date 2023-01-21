# port-grabber
Grab ports from initial nmap output in order to analyze deeply only the open ports 

<br/>

## How to use it
Script showcased on my [website](https://chronossec.site/port-grabber-325348de8b7a4d6bbab91c8161e19e88)

<br/>

**Command structure**:
```bash
port-grabber.sh -f <nmap-output-file> > <open-ports-file>
```

<br/>

**Example**:
```bash
sudo nmap -O -Pn -p- -v $IP -oN nmap/nmap.init;
port-grabber.sh -f nmap/nmap.init > nmap/ports;
sudo nmap -O -Pn -sC -sV -v -A -T4 -p $(cat nmap/ports) $IP -oN nmap/nmap.alltcp
```

<br/>

**Add the script to system binaries (to call it without path)**
```bash
sudo cp ./port-grabber.sh /bin/port-grabber.sh  
```

<br/>

## Why do it so?
Using this script is viable because you can start with a small recon that doesn't require too much detail for each port.
Once you got a list of open ports, you can start scanning in depth each of them.


