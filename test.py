#!/usr/bin/env python3
from ftplib import FTP_TLS
import sys

sync = 'Start123456789012345678'
print(sync)
host = 'ftp2.atxedi.com'
user = 'TAOS-CG'
passwd = 'keTYNW'
port = 21

try:
    ftp = FTP_TLS(host)
    # ftp.prot_p()
    ftp.login(user, passwd)
    ftp.sendcmd('OPTS UTF8 ON')
    ftp.sendcmd('TYPE I')
    ftp.sendcmd('PWD')
    ftp.sendcmd('CWD /OUT')
    # ftp.set_pasv(True)

except:
    print('Error connecting to FTP server')
    sys.exit()

try:
    # ftp.sendcmd('PWD')
    # ftp.sendcmd('CWD //OUT//')
    ftp.retrlines('LIST')
except:
    print('Error fetching file listing')
    ftp.quit()
    sys.exit()

ftp.quit()
