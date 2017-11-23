#!/bin/sh

# This program will take in a process ID as an argument
# and will print out the command name associated with 
#the process ID.

# Condition to check if argument ran successfully without errors.
# It will also check to see if the command results in a empty
#string. If arguemt is valid, it will show the command name for
#the ID.

pid=$1
cond1=`echo $(ps -ef|awk '$2 == "'$ID'"'|awk '{print $2}')`
cond2='^[0-9]+$'
bold=$(tput bold)
cond3=`echo $(ps -ef|awk '$2 == "'$1'"'|awk '{print $3}')`


#This condition will check if the PID value is a null value
if [[ -z ${pid} ]]
then
        echo 'You have entered a value that is not an integer. Using current process ID'
        echo
        pid=$$
#check if arg is a number
elif ! [[ ${pid} =~ $cond2 ]]
then
        echo 'ERROR: You did not enter a number'>&2
		sleep 1
		echo 'Please enter a process ID which can be found typing ps -ef'
		sleep 1
		echo 'Or enter "$$" for current process ID'
        exit 1
#if arg is a number, check if it is a valid pid
elif [ -z "` ps -eo pid | grep -w ${pid}`" ]
then
        echo 'ERROR: NOT A VALID PID'>&2
        exit 1
fi

#This will list all processes with the argument ID and print out its corresponding value from the cmd column
function pidName {
        ps -p $1 -o comm=;
}

#CmdNetwork will bolden and display command name text when caled, and will check if there
#is a nework IP associated with the process ID.
function cmdNetwork {
        echo ${bold}Process Name: $(pidName ${1}). 

        #if network connection exists, display that info
        if [[ -n `sudo netstat -anp | grep ${1} | grep 'tcp\|udp'` ]]
        then
                echo Network info ${1}
                sudo netstat -anp| grep 'tcp\|upd'| grep ${1} -w| awk '{printf "%s , ", $4}'  
        fi
}

#This section will show the parent associated with the ID a.k.a PPID along with 3 ancestors.
#This is done by showing all processes associated with the ID and then
#grabbing PPID for each string.
function forefather {
        ancestor=${1}

        if [ -n ${1} ] && [ ${1} -gt 0 ];
		
        then
 #PPID is obtained from the PID and must be valid. This condition if the value of PPID has an output with valid strings
 
                if [ "`ps -p ${2} -o ppid=`" -le 0 ]
                then
                        echo $(cmdNetwork ${2}) $pid, Cannot find your parent.
                elif [ -n "`ps -p ${2} -o ppid=`" ]
                then
 # If parent process is found it will run the cmdNetwork function, which will list all network conections for the PPID
 #if available, and get the command name for that process.
 
                        parID=$(ps -p ${2} -o ppid=)
                        echo ${2}, your parent is ${parID}, `cmdNetwork ${parID}`
                        
                        echo

                        #call parent function for ancestor of given pid
                        forefather $((--ancestor)) ${parID}
                fi
        fi
}


echo ${bold} PID$pid :`cmdNetwork ${pid}`

echo
echo

echo ${bold}Forefathers of ${pid}: `forefather 3 ${pid}`


echo

echo ${bold}All Children of PID# $pid


for child in `pgrep -P ${pid}`
do
        echo Child of ${pid} is ${child},`cmdNetwork ${child}`.
        
        echo

        for grandkid in `pgrep -P ${child}`
        do
                echo ${pid} has a grandchild
                echo ${grandkid} is a child of ${child}, `cmdNetwork ${grandkid}`.
                echo

                for greatkid in `pgrep -P ${grandkid}`
                do
                        echo ${pid} also has a grandchild
                        echo ${greatkid}, `cmdNetwork ${greatkid}`, is a child of ${grandkid}, whose parents are ${child}
                        
                done
        done
done


       




