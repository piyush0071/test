echo "Automation Script";

echo "Scan for CVES started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/cves/ -o /root/data/dod/cves.txt | notify
echo "Scan for CVES completed." | notify
echo "Scan for default-login started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/default-logins/ -o /root/data/dod/default-logins.txt | notify
echo "Scan for default-logins completed." | notify
echo "Scan for exposures started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/exposures/ -o /root/data/dod/exposures.txt | notify
echo "Scan for exposures completed." | notify
echo "Scan for misconfiguration started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/misconfiguration/ -o /root/data/dod/misconfiguration.txt | notify
echo "Scan for misconfiguration completed." | notify
echo "Scan for takeovers started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/takeovers/ -o /root/data/dod/takeovers.txt | notify
echo "Scan for takeovers completed." | notify
echo "Scan for vulnerabilities started." | notify
nuclei -l /root/data/dod/subdomains.txt -t /root/nuclei-templates/vulnerabilities/ -o /root/data/dod/vulnerabilities.txt | notify
echo "Scan for vulnerabilities completed." | notify

echo "
.
.
.
Scan finished 
" | notify --silent
done
