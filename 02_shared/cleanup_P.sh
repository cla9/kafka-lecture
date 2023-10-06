#! /bin/sh


#remove all variables from `.bashrc`
if grep -q "NICK_NAME" ~/.bashrc ; then
    sed -i "/$(grep -P "NICK_NAME" ~/.bashrc)/d" ~/.bashrc
    
fi          
if grep -q "SERVER_IP" ~/.bashrc ; then
    sed -i "/$(grep -P "SERVER_IP" ~/.bashrc)/d" ~/.bashrc
    
fi
if grep -q "KAFKA_HOME" ~/.bashrc ; then    
    sed -i "/KAFKA_HOME/d" ~/.bashrc    
fi

#unset all environments
unset NICK_NAME
unset SERVER_IP
unset KAFKA_HOME

#apply the changes
source ~/.bashrc
