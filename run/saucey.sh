#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
nc='\033[0m' # No Color

# If saucelabs cloud
if [ "$1" = "drunk" ]
then
  # drunk.sh : Use $FUNCNAME
  drunk(){
    vendor/bin/behat --tags "$2" -p "sauce_$3_$4"
  }
  drunk $1 $2 $3 $4 $5
  echo -e "${green}$1 @$2 $3 $4 $5${nc}"
  echo -e "${nc}Go to ${yellow}reports/$2_suite/report.html${nc}"
  echo -e "${nc}See your test @${yellow} https://saucelabs.com/account${nc}"

# If selenium local
elif [ "$1" = "tipsy" ]
then
  # tipsy.sh : Use $FUNCNAME
  tipsy(){
    vendor/bin/behat --tags "$2" -p "local_$3"
  }
  tipsy $1 $2 $3
  echo -e "${green}$1 @$2 $3"
  echo -e "${nc}Go to ${yellow}reports/saucey_report_$2.html${nc}"

# If test
elif [ "$1" = "test" ]
then

  echo -e "Yo, you try'na get saucey?"

else
  echo -e "${red}ERROR: ${red}Check your statement. You can only use drunk [cloud] or sober [local]${nc}"
  echo -e "${yellow}EXAMPLE: ./saucey drunk @check mac safari -or- ./saucey tipsy @check safari -or- ./saucey drunk @check ios tablet_landscape${nc}"
fi
