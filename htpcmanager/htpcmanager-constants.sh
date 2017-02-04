#!/bin/bash
APPNAME='htpcmanager'
APPSHORTNAME='hm'
APPPATH='/opt/htpcmanager'
APPTITLE='HTPC Manager'
APPPIDFILE='/var/run/htpcmanager/htpcmanager.pid'
APPDEPS='build-essential git python-imaging python-dev python-setuptools python-pip python-cherrypy vnstat python-cheetah python-pyasn1 smartmontools'
APPPIPS='psutil'
APPGIT='https://github.com/Hellowlol/HTPC-Manager'
APPDPORT='8085'
APPSETTINGS='NA'
ACCESSHOST='NA'
PORTSEARCH='NA'
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='htpcmanager.service'
APPSYSTEMDLOC=$APPPATH'/initscripts/systemd.ubuntu1510'
APPINITDLOC=$APPPATH'/initscripts/initd'
