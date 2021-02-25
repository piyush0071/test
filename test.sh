echo "Automation Script";

read -p "Enter domain name seperated by space: " input
for i in ${input[@]}
do

echo "
.
.
.
Scan started for $i
" | notify --silent

mkdir $i

subfinder -d $i | httpx >> $i/subdomains.txt

echo "subdomains saved at $i/subdomains.txt" | notify

echo "Scan for CVES started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/cves/ -o $i/cves.txt | notify
echo "Scan for CVES completed." | notify
echo "Scan for default-login started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/default-logins/ -o $i/default-logins.txt | notify
echo "Scan for default-logins completed." | notify
echo "Scan for exposures started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/exposures/ -o $i/exposures.txt | notify
echo "Scan for exposures completed." | notify
echo "Scan for misconfiguration started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/misconfiguration/ -o $i/misconfiguration.txt | notify
echo "Scan for misconfiguration completed." | notify
echo "Scan for takeovers started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/takeovers/ -o $i/takeovers.txt | notify
echo "Scan for takeovers completed." | notify
echo "Scan for vulnerabilities started." | notify
nuclei -l $i/subdomains.txt -t /root/nuclei-templates/vulnerabilities/ -o $i/vulnerabilities.txt | notify
echo "Scan for vulnerabilities completed." | notify

echo "
.
.
.
Scan finished for $1
" | notify --silent
done
