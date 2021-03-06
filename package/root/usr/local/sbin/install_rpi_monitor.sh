#!/bin/bash

# Install rpimonitor on a pine64 running ubuntu or debian
#
# Original code lifted from http://kaiser-edv.de/tmp/4U4tkD/install-rpi-monitor-for-a64.sh
# Original code written by tkaiser, as well as assuggestions for a deriverative work
#
# This modification written by pfeerick

if [ "$(id -u)" != "0" ]; then
        echo "This script must be executed as root. Exiting" >&2
        exit 1
fi

useEncodedPublicKey()
{
    echo -e "\nUsing backup copy of public key for Armbian package list"
    cd /tmp && echo "LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tClZlcnNpb246IFNLUyAxLjEuNgpD
b21tZW50OiBIb3N0bmFtZToga2V5cy5mc3Bwcm9kdWN0aW9ucy5iaXoKCm1RSU5CRlVHOHA0QkVB
REdsc2VHRm1kampmbW9YdEhwWnhxZ1lIR3dlQ25HWjA1TGlHZ0VWZ2J2NVNyVHNKc3lPOEg4UnlC
UAp4Z2JwS0VZK0pDVjFJbFlRUGFFM1RpbDEra3FtUjRYTktidWZqRXVxQVY0VkpXMzI2N3RZUnVK
MzA4RTcwcTdrcFFTc0VBV0wKVlkreFYvbDVzdEF1cHA0L3dGNUJQZEFqVzdnTHVpY1BucW9LSzBq
Y2ZyanV2ZDQ1V0ZocGpMMVNkZDBQbklMZWh6MHRvNlIyCkg5TXNXK1ZZWVBGenRkakJNLzc4VUQ4
Z3JNY0NtLzdNejhFTlJLQ25US3JnajRicFdBMGtQRUhOQmZhb1FRVWs1ZkNKWU5NTAp2TE1JR1pj
V2VHT1BvK3lGbmw0QzZxVEVnczBnNy8wRTU2eWNhUURKK2dCQ0g5WU5hOGozZUgvdDF2TU4wRVJY
aU9RZjZXWGcKUmloT0QxZmNuWkZtY3pRRlQzR0dodjN5Ky9jVXBzVWxtaGhKNnRldGl1WE51VGZy
bDNNKzk5cVVxNS84aWlxMjkyTUNtbjVzCjBCRU9peWZRMmwydVptanlEVU8rNGxMOW8zTVgwVzVY
cDFwdUUycDQyYit3NDU4YURLdXVGdkJ6Vk1pVTUxSnM2RFpuYWh4dQoycytORHp0RGd1dDdwK1A2
MFVCQ2JsdFhFQjBaSXlXVEFrS0N3SWxhcFo5eURpSHFYaU5sdVRkQmlGV0d5VTN4bGI0ZnVRencK
bHd2bVMzeXo0QWs1R0NkRHBpTG1Kb0hPS1Y2cTg1VmFJNFQzZ2l4eDRKd0VmZGluY09HZmVwU1dG
bWJFc0R1Vng1dmJEVjVECndiM29BZzgwenAzVy91TnlYN0c0MXVJR0ROelpMODJwMlh0Z0d6a2po
RWJLQW5OYXZ3QVJBUUFCdEQxSloyOXlJRkJsWTI5MgpibWxySUNoTWFuVmliR3BoYm1Fc0lGTnNi
M1psYm1saEtTQThhV2R2Y2k1d1pXTnZkbTVwYTBCbmJXRnBiQzVqYjIwK2lRSTQKQkJNQkFnQWlC
UUpWQnZLZUFoc0RCZ3NKQ0FjREFnWVZDQUlKQ2dzRUZnSURBUUllQVFJWGdBQUtDUkNUMW9pZm53
NTQxVDZXCkQvMFgrTEQ5R20xTlZnWmhySDM1b1EzenN0RU5yVGpENkxGK2tUK3poZTZRUjliQWRP
bWViN0plNDIzeS9VWTNuU2FKbFMvTwpXc0pzODl0WFV5RTJqYnh0TEFwTjZPTVRac0l4amd5ZzNm
amJIVi9sdy94R3ArY3FIalgrQXk1UVp1ZEpWeEdKTjdXSmFSR3gKeW1qb3A3RVg0Q0hpaWRHWlBa
b0RUMjNXQXJMaWE3RThNTEIvb0szd1c2azlRbGMyU3JobGR6cHVTbU93SFFYOXB4bXk5ZGdmClph
MmE5dzFjRXZrdERucml6UG1meHdZYUMzOEZLUnF6MUk4Q25QTUVTVkorNm1MRVl4V0p2SkFOdVZ2
cmhxT3Rqa1k2eUkwdQpTT0ZIc21nY2krM1gyYzdXV2hsb0t1Yi9QZjdUdE02dGw2UkNIZkt2bnNy
VFpQdnhQMS9DZ3pRaUFJVFdwcEJsb2xuU1JIWHAKM25vdENGMXJWYmdJbndWdUNaQ3VXUEp2SEM2
UjN0OS9VZ0VTYW8wdEV3cjRtdzdqTnd0c3pXb3U0cll6akVBTUUvTy9rQkJXClBiRFVSbS80Ujhs
MFhTbkcwemhlUEt2NWlDemVRYkl6VWVBRDFEY3ZrN2ZhbGdubDlGWDkvTFpDWTFrRXdGTWYyREcw
M2x3Rwo3YzRJQ1NWQXowcE5FUFpkcXB5Q2w4MlZLa0RuZThQQTBSYi91UElPUVkzYUR1OGJnY1BR
dW9rbVJSTDRyd2RuUkNWcjBBRkQKWmhWUW5VamNkeThBdkVQZXllMmZOZExodGUrS1VXaXlGTldw
MnZXMkxiSjlHeFBzdGFGaWhYWkJjQ0VwR1dzTkhlYkRkMUttCk5HeVBLY3F6YUlmekhQTFA4K2Vl
MmRlS0E5NVBWelYzaVRMK09ia0NEUVJWQnZLZUFSQUF2R2FLQ0hER2wwZUM3ZkZvazVzUApxMVdh
dHRwcVE5UUwwQmdaOTVWUUxuKzcvMW5YbUtzRGZDd0N2bkJHcUxYelBReXZXaENiQ1ROOW9Za3Fv
a0JYMkNoMXpPSUEKQnludytVQ00rS3laY21jaVlaSUYyMU9zdFdNTTBuUTA2am5vNUhxMXZTSGxn
VGthYVlXWllvcVhvY01DUzlsbHZJMk5WRzM0CmJjYWsxaEFoOUVrZm1UaFZ0dERlR1pQK29zcXQy
bWVmcENBVklUUDFlUVdVM1JVQnBPS05wdGhwTHhNaHkrbDdtOHRta0xIMwpGdXF3WnZWalkyNDF3
MW80QVdWcEpEL0pkT3VBZkh0ZjcvVURQY2hTWkxlOUVhOFkrYm5raVp4Z1NST3RGclJ6YlZ3UDFJ
ZDQKUktUNDRCd0tNclh1OEdpWkFQdlFxNUN2SU5xWkRNcWlxcTQrakZKUE1Wb3J0dXhYc2tSaDFk
VllPaW9IMW11emVIZjU2MC9CCkxXK21CdUVkK3hFMGdkNlNYUmdQaWZsUk95bHBKQ2I5UXhpOE9m
cTZGRUhCZko4bUh6NDlkNjBxeVhaTmRObHhMaEEzZGZPdgphYWhGQmdYd05Td2phazB6ZjZScHVm
QWtoOFNpNWpjM1FoN2xwdXdzQmVseU51N3RCYkwyeThXblVlei8rYWVYOXNCU3FzNzgKbWZwRGRM
QUduSWxUOVljamtIbDVXMzg1ampoQkFocEFnaUxJc2RTUktjYzJDSTM0VmY3NzVjTExJWXJjQnJq
Vk1MWUJ3RWlaCkhPUE85MExuaXpneDFsNXQxd0cyQWE1T2FyVFRVUElnTWlUVXRLUFE4Qm1jakdN
WmlhdmRKd3FHVXppREQraE1LY3hQVU1qeQpZaXUrbmdrSDFST3VDeE1BRVFFQUFZa0NId1FZQVFJ
QUNRVUNWUWJ5bmdJYkRBQUtDUkNUMW9pZm53NTQxV203RC9zRzBvdU0KNzFjNW1UK2VnZmYrUXhm
RXh5K0pCNC92TDFwTFNIYk1SOEF0QUpMTitZaDZFemVHbVcydGdhMEJrOUF4RWVrUXJhWHJNRmha
ClNwVDk4cUpubkRwZG96ZmVJQXlUd3ppdzlLOW9wQjBkVS8rTTNzVmlka0o1bXY0TFc2Q0phYVkz
cnNvbTBUSWpheEJ2WHFTZQphZEpGNFdHVUh6ZzNldys4YWgwWkc4U0RadTE5a2V0TjJjblRNQXRn
Tys1M0VwanFwazN1TUY1aE5hRUh0OXdWajJ0cS9hbkwKRXNsNFQ1VS9la1FuZHhjVEVzVjJLSVZT
b3llMzV5ZTRhYW0xZ1doVzlKSUZ0U2hoRXRYRC81T3Z0ajcwNllMVFA4NFU4eUhTCnR6TTZMTEdw
cU04YmIxUXNCVVdSVWhJS2lkbHRtTzlLalg2ckpadWh3a2NWSkpZUmRiZXRFWGJpU0l5ZU5aeTdi
QmU0RW4rZgpWY04wZWtCRDM2TGhNY1ZMOEYxTW50cjFMNXhmMGNGRXBGcEVvZFFVdmNheU5ncEky
eTdFSVBqS21LaFZ3VzVkeDM2UTBDc0MKbndjQytLZzZCTnpsaUk5SXMrb0EyQVZJYW5GUHZqdlN3
Zkc5cEgrMi91K0tCNEhUMlV4MUZCYkJpNUdBd28rY3UxZDRYQWM1CmJaSGRQbkFWdG5JTjlkS1J1
c1o4SUdIV0VkOFB3MGtSZXB1TmhTbVNOQUxRa1M2QitwcFFadG1vR3NCQ3FKZU1QeFF4ait5SQov
YkwzZG1BMlVYeG5HSjN2czJ5YkZ5SEczYW9vdktKZldWeXR4T0pmRzdxajFBQ3JPWU9YZWtXbGN3
NWxFaVlGY2NrdWtOcXEKRnYvQ1hoK0JaRmxRVDRERHZKbFkwL0tRRkZLb2dRPT0KPUkvUDgKLS0t
LS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=" | base64 --decode > keyfile

    if [ -f /tmp/keyfile ]; then
        apt-key add /tmp/keyfile
        local keyAddState=$?

        rm /tmp/keyfile

        if [ $keyAddState -ne 0 ]; then
            echo -e "\033[0;31m\nUnable to add backup public key... exiting\033[0m"

            if [ -f /etc/apt/sources.list.d/armbian.list ]; then
               #remove if not Armbian
               if [ ! -f /etc/armbian-release ]; then rm /etc/apt/sources.list.d/armbian.list; fi
            fi

            exit 2
        fi
    else
        echo -e "\033[0;31m\nUnable to use provided backup public key... exiting\033[0m"

        if [ -f /etc/apt/sources.list.d/armbian.list ]; then
           #remove if not Armbian
           if [ ! -f /etc/armbian-release ]; then rm /etc/apt/sources.list.d/armbian.list; fi
        fi

        exit 1
    fi
} #useEncodedPublicKey

PatchRPiMonitor_for_sun50iw1p1()
{
    echo -e "\nNow patching RPi-Monitor to deal correctly with A64"
    cd /etc/rpimonitor/ && echo "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
+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
vbbX9tpe22t7ba/t1XT9L9Ege4cAeAAA" | base64 --decode | tar xzf - 

	systemctl restart rpimonitor >/dev/null 2>&1
} # PatchRPiMonitor_for_sun50iw1p1

cleanupPackageLists()
{
    echo -e "\nCleaning up package lists"

    if [ -f /etc/apt/sources.list.d/armbian.list ]; then
        #remove if not Armbian
        if [ ! -f /etc/armbian-release ]; then 
            rm /etc/apt/sources.list.d/armbian.list
            apt-key del 9F0E78D5 >/dev/null 2>&1
            apt-get update
       fi
    fi
} # cleanupPackageLists

echo -e "$(date) Start RPi-Monitor installation\n"

echo -e "Checking for dpkg lock\c"
while true ; do
    fuser /var/lib/dpkg/lock >/dev/null 2>&1 || break
    sleep 3
    echo -e ".\c"
done

echo -e "\nAdding Armbian package list"
if [ ! -f /etc/apt/sources.list.d/armbian.list ]; then
    echo 'deb http://apt.armbian.com xenial main utils xenial-desktop' > \
    /etc/apt/sources.list.d/armbian.list

    apt-key adv --keyserver keys.gnupg.net --recv-keys 0x93D6889F9F0E78D5 >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        useEncodedPublicKey
    fi
fi

echo -e "\nUpdating package lists"
apt-get update

echo -e "\nInstalling rpimonitor (this may take several minutes)..."
apt-get -f -qq -y install rpimonitor
/usr/share/rpimonitor/scripts/updatePackagesStatus.pl &

cleanupPackageLists

PatchRPiMonitor_for_sun50iw1p1

echo -e "\n$(date) Finished RPi-Monitor installation"
echo -e " \nNow you're able to enjoy RPi-Monitor at http://$((ifconfig -a) | sed -n '/inet addr/s/.*addr.\([^ ]*\) .*/\1/p' | grep -v '127.0.0.1' | head -1):8888"
