#!/bin/bash
#
# Install POCI onto Oracle Linux for the 'opc' user
# Copyright (c) 2021, Pebble IT Services Pty Ltd, Australia. All rights reserved.
# This file is licensed to you under the 'The Unlicense' available at <https://unlicense.org>
#
# This file is publicly available by the command --
# wget https://raw.githubusercontent.com/PebbleIT-Australia/poci-install/master/install-poci.sh
#
# It is designed to run on an Oracle Linux 7/8 instance from the 'opc' user $HOME with '/bin/bash install-poci.sh'
#
#
if [ "$USER" != "opc" ]; then
  printf "This version of POCI is configured to operate under user 'opc' on Oracle Linux in OCI\n\n\n"
  exit 1
fi
cd ~
if [ -d "/home/opc/poci" ]; then
  /bin/bash ~/poci/install.sh "readme"
else
  sudo timedatectl set-timezone Australia/Sydney
  sudo yum install python3-devel
  sudo yum update
  # sudo yum -y install git  --> already installed on OL8
  git clone https://github.com/PebbleIT-Australia/poci.git
  cd poci
  git remote set-url --push origin no-pushing-allowed
  /bin/bash ~/poci/install.sh
fi
