netsh interface portproxy add v4tov4 listenport=25 listenaddress=127.0.0.1 connectport=25 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=110 listenaddress=127.0.0.1 connectport=110 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=143 listenaddress=127.0.0.1 connectport=143 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=465 listenaddress=127.0.0.1 connectport=465 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=587 listenaddress=127.0.0.1 connectport=587 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=993 listenaddress=127.0.0.1 connectport=993 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=995 listenaddress=127.0.0.1 connectport=995 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=8889 listenaddress=127.0.0.1 connectport=8889 connectaddress=127.0.0.2
netsh interface portproxy add v4tov4 listenport=9998 listenaddress=127.0.0.1 connectport=9998 connectaddress=127.0.0.2

netsh interface portproxy show all

REM Look to see if other ports such as 443 993 etc

REM The following can be used to delete the redirect if needed
REM netsh interface portproxy delete v4tov4 listenport=9998 listenaddress=127.0.0.2