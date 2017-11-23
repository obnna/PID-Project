# Linux-PID-Project


This program will take in a process ID as an argument
and will print out the command name associated with 
the process ID. 


IF YOU ARE RUNNING WINDOWS, PLEASE FOLLOW THESE STEPS:

This project is running off a virtual machine based on ubuntu 16. In order to access the virtual machine you must do the following:

1. Download vagrant from https://www.vagrantup.com/. I used vagrant 1.9.5 for windows.

2. Download oracle virtual box from https://www.virtualbox.org/wiki/Downloads. Don't worry about the extention packs as those are not neccessary for this project.

3. clone this repo using git or any terminal of your choice. Or you have the option of downloading the project as a zip file from Github. Download git from https://git-scm.com/. 

4. Open git bash or git cmd or even powershell which I highly recommend. You can find this using the search option on windows OS. Navigate to your directory of choice where you want this project cloned using cd (directory name).

5. In your chosen directory, type "git clone", followed by the url of the project. For this project, type git clone https://github.com/oobixyz/pid-project.

6. Now that the files have been cloned onto your computer, you will use vagrant to access Ubuntu. To do this, open command prompt and navigate to the repo you just cloned. For example, if you cloned the repo into your documents directory, type cd documents/pid-project.

7. Navigate to Linux-Project >> vagrant ". Then type "vagrant up" This command will download the configured virtual machine unto your PC. Beware, you may have issues getting past this stage. I had to go into BIOS and enable Intel Virtualization for the VM to install properly. To get into BIOS, click f12 or f2 repeatedly as you start up your PC.

8. Once everything is setup, type "vagrant ssh."

9. Then type "cd /vagrant" This is where the files are stored. 



For people on Linux:

Just take the script from the PID-project folder and place in any folder of your choice.