 #! /bin/bash
 
# Get nickname from the user
read -p "Enter your nick name: " NAME

# Get the IP address from the user
read -p "Enter an IP address: " IP_ADDRESS

# Check if the IP address is valid
if [[ ! $IP_ADDRESS =~ ^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]; then
   echo "Please insert valid IP."
else
   if ! grep -q "NICK_NAME" ~/.bashrc ; then
      # Export the value to `.bashrc`
      echo "export NICK_NAME=$NAME" >> ~/.bashrc
      echo "export SERVER_IP=$IP_ADDRESS" >> ~/.bashrc      
      echo "export KAFKA_HOME=$HOME/kafka_2.13-3.5.0" >> ~/.bashrc
   else 
      echo "Already registered values. Change the variables"

      #Change variables
      sed -i "s/$(grep -P "NICK_NAME" ~/.bashrc)/export NICK_NAME=$NAME/g" ~/.bashrc      
      sed -i "s/$(grep -P "SERVER_IP" ~/.bashrc)/export SERVER_IP=$IP_ADDRESS/g" ~/.bashrc
   fi
   # Source `.bashrc` to apply the changes
   source ~/.bashrc   
fi