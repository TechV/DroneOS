<h1><b>DroneOS<p>
=======</h1></b>

An opensource Raspberry Pi OS for Drones.

<b>Features:<p>
=========</b>

* WiFi controlled
* Client / Server based
* Supports streaming controlls wirelessly from a PS3 controller
* Wireless on-board video streaming
* Modular design
* Optional (testing) web UI
* Flight controlled by the Raspberry Pi alone
* SSH control console
* WiFi access point on boot
* 3rd Party package install on first boot
* After first boot, boots in ~15s
* An ongoing opensource project from Eastern Michigan University's 
  Information Assurance Program.

<b>History:<p>
========</b>

<b>Who Started this project?</b>
This project was started by Ryan Scott [techv] as part of an independent
study at Eastern Michigan University.

<b>Where does this code and its updates come from?</b>
This project utilizes many opensource projects. The primary project is
buildroot which offers a very nice platform to build custom linux system
in a streamlined fashion. Much of the code that is unique to this project
comes in the form of patches for the default configuration of buildroot.
Further code comes in the form of buildroot packages. This gives the 
platform modularity.

<b>Whats the current state of the project?</b>
There is definitely work to be done. Right now much of the pairing and 
testing is is pretty losely connected. The overall user experience needs
some polish before end user releases. Furthermore there are still bugs in
the controller system. The goal of opensourcing this code base is to bring
together the various Raspberry Pi drone projects under a uniform standard
so that multiple flight control systems can be available for various control
and hardware setups.

<b>What's the best way to contact the developers?</b>
If it is a feature request, bug report, etc. use the built in bug tracking
system on here. If it is a job offer or other type of inquiry, you can email
me directly at Ryan@TechVendetta.com, include a non spamy interesting subject
line please. 

<b>About:<p>
======</b>

The code in this repository utilizes multiple opensource technologies to
assist in the creation of a highly customized and optimized operating
system image for use on a Raspberry Pi powered drone.

This project is two part, the first part is creating a hardware set that
complies with the project guidelines and standards (coming soon). This is 
the second part which consists of the OS, connectivity systems, configs,
and flight control systems.

<b>The Raspberry Pi system image is built using buildroot:<p>
=======================================================</b>

To build and use the buildroot stuff, do the following:
<p>
<p>1) run 'make ARCH=arm menuconfig'
<p>2) select the packages you wish to compile
<p>3) run 'make ARCH=arm'
<p>4) wait while it compiles
<p>5) After compiling, you will be offered to choose a dev to dd the image to.

<p>You do not need to be root to build or run buildroot.  Have fun!

<b>Offline build:<p>
==============</b>

In order to do an offline-build (not connected to the net), fetch all
selected source by issuing a:
<p>$ make source

before you disconnect.
If your build-host is never connected, then you have to copy buildroot
and your toplevel .config to a machine that has an internet-connection
and issue "make source" there, then copy the content of your dl/ dir to
the build-host.
