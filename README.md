# Example OSPF unnumbered for Chef

## Overview

This repo contains example [OSPF Unnumbered](http://docs.cumulusnetworks.com/display/CL25/Open+Shortest+Path+First+-+OSPF+-+Protocol) topologies automated using Chef.

### Functionality

* Templates the /etc/network/interfaces file
* Disables the kernel ARP filter on all interfaces
* Configures the Prescriptive Topology Manager (PTM)
* Configures the switch ports.conf file for 40G switches
* Installs a Cumulus Linux license
* Templates the /etc/quagga/Quagga.conf file for OSPF Unummbered neighbours and starts Quagga

Additionally, the following basic system configuration is performed

* Creates a "cumulus" user, and configures sudo & SSH for the new user
* Configures the NTP client and a Message Of The Day (motd)
* Ensures Chef is running as a daemon
* 
## Usage

### In your own network

Upload the Cookbooks, Roles and Data Bags to your Chef server.

### Within the Cumulus Workbench

In the [workbench](http://cumulusnetworks.com/cumulus-workbench/) you can install the package cldemo-wbench-ospfunnum-puppet. When this package is installed a [postinst](https://github.com/CumulusNetworks/cldemo/blob/master/pkgs/workbench/cldemo-wbench-ospfunnum-chef/debian/DEBIAN/postinst) contained in the package performs these actions:

* Installs and configures Chef server & knife
* Clones this git repo into /home/cumulus/example-ospfunnum-chef
* Install any dependencies using [librarian-chef](https://github.com/applicationsonline/librarian-chef) (from Cheffile)
* Uploads the Cookbooks, Roles & Data Bags & Nodes in this repo

***

![Cumulus icon](http://cumulusnetworks.com/static/cumulus/img/logo_2014.png)

### Cumulus Linux

Cumulus Linux is a software distribution that runs on top of industry standard 
networking hardware. It enables the latest Linux applications and automation 
tools on networking gear while delivering new levels of innovation and 
ﬂexibility to the data center.

For further details please see: [cumulusnetworks.com](http://www.cumulusnetworks.com)
