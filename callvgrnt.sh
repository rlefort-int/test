#!/bin/bash

#this script removes old Vagrantfile in this directory then sources the new config file, returning a uniquelist of the hosts listed there
#and creates a new Vagrantfile (using mem, cpu, names supplied in config file) and then Vagrant ups so that they all can be
#controlled using the same vagrant command (vagrant up, halt, destroy, reload, provision)

#deletes old Vagrantfile
rm Vagrantfile


numofhosts=$(tail -1 confignew | cut -c 7)
end=$(wc -l confignew | awk '{print $1}')
for i in $(seq 1 $numofhosts);
        do
                host[$i]="$(sed -n "$(($end - $numofhosts - 1  + $i))"p confignew)"
        done

#for each host giving name to config block in vagrantfile
for i in $(seq 1 $numofhosts);
        do
                hosts=${host[$i]}
                hosts=($hosts)
                fqdn=${hosts[0]}
                mem=${hosts[1]}
                cpu=${hosts[2]}
                template=${hosts[3]}
                home=${hosts[4]}
                compute=${hosts[5]}
                machinename=$(sed -e 's/-//g' <<< $fqdn -e 's/\.//g' <<< $fqdn )
                sed -e "s|TEMPLATE|$template|g" -e "s|COMPUTE|$compute|g"  -e "s/rl-hostname-vagrant/$fqdn/g" -e "s/sed!!/$machinename/g" -e "s/HOME/$home/g" -e "s/MEMORY/$mem/g" -e "s/PROCESSORS/$cpu/g" scriptVagrantfile >> Vagrantfile
                #sed -e "s/rl-hostname-vagrant/$fqdn/g" -e "s/sed!!/$" scriptVagrantfile >> Vagrantfile
        done


#adding extra config bits
echo 'Vagrant.configure("2") do |config|
  config.vm.box = "vsphere"
  config.vm.box = "./dummy.box"' | cat - Vagrantfile > temp && mv temp Vagrantfile

echo "end"  >> Vagrantfile
