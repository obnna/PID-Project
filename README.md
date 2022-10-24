# Linux-PID-Project

![pidproject](https://user-images.githubusercontent.com/22532702/33189538-977a43ca-d071-11e7-96b3-b153b09f5638.PNG)

This program will take in a process ID as an argument and print out the command name associated with the process ID.

IF YOU ARE RUNNING WINDOWS, PLEASE FOLLOW THESE STEPS:

This project is running off a virtual machine based on ubuntu 16. To access the virtual machine, you must do the following:

Download vagrant from https://www.vagrantup.com/. I used vagrant 1.9.5 for windows.

Download the oracle virtual box from https://www.virtualbox.org/wiki/Downloads. Don't worry about the extension packs, as those are not necessary for this project.

Clone this repo using git or any terminal of your choice. Or you can download the project as a zip file from Github. Download git from https://git-scm.com/.

Next, open git bash or git cmd, or even Powershell. You can find this using the search option on windows OS. Navigate to your directory of choice where you want this project cloned using cd (directory name).

In your chosen directory, type "git clone," followed by the URL of the project. For this project, type git clone https://github.com/oobixyz/pid-project.

Now that the files are cloned on the computer, you will use vagrant to access Ubuntu. To do this, open the command prompt and navigate to the repo you just cloned. For example, if you cloned the repo into your documents directory, type cd documents/PID-project.

Navigate to Linux-Project >> vagrant ". Then type "vagrant up" This command will download the configured virtual machine onto your PC. Beware, you may have issues getting past this stage. I had to go into BIOS and enable Intel Virtualization for the VM to install correctly. 

Once everything is set up, type "vagrant ssh."

Then type "cd /vagrant" This is where the files are stored.

For people on Linux:
Copy and paste the contents of the script -> go to  https://github.com/obnna/PID-Project/blob/master/Vagrant_VM/Linux%20Project/vagrant/PID_project/PID2.sh

On Linux, navigate to user directory. 

nano PID.sh

copy and paste content of script. 

ctrl O + ctrl X to save. 
ls -ltr *PID*
-rw-r--r-- 1 Obi users 3771 Oct 24 21:48 PID.sh

Make the file executable 
sudo chmod +x PID.sh
$ ls -ltr *PID*
-rwxr-xr-x 1 Obi users 3771 Oct 24 21:48 PID.sh

execute the script. 
./PID.sh (PID #)

