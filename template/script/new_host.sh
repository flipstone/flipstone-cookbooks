#!/bin/bash

NAME=""
SIZE="<Yyour size, e.g. m1.small>"
AMI="<Your ami, e.g. ami-f0e20899>"
ZONE="<Your zone, e.g. us-east-1a>"
EC2_SSH_KEY_ID="<Your SSH key id>"
SSH_IDENTITY="<Your SSH identity, e.g. -i ~/.ssh/<private-key-file> -x <username>>"
SECURITY_GROUPS="<Your security groups. e.g. webserver,public>"
RUN_LIST="<Your default runlist. e.g. role[host]>"

# BEGIN SECTION TO REMOVE ONCE CONFIGURED
echo "****"
echo "**** new_host.sh needs to be configured."
echo "**** Edit this file and set the variables at top,"
echo "**** then remove these lines."
echo "****"
exit 1
# END SECTION TO REMOVE ONCE CONFIGURED

while getopts "n:s:i:r:" OPTION
do
  case $OPTION in
    n)
      NAME="-N $OPTARG"
      ;;
    s)
      SIZE=$OPTARG
      ;;
    i)
      AMI=$OPTARG
      ;;
    r)
      RUN_LIST=$OPTARG
      ;;
    ?)
      exit
      ;;
  esac
done


COMMAND="knife ec2 server create -r '$RUN_LIST' --groups $SECURITY_GROUPS $NAME --flavor $SIZE -I $AMI -Z $ZONE -S $EC2_SSH_KEY_ID $SSH_IDENTITY"
echo $COMMAND
$COMMAND

