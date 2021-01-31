#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz 
					sudo tar -xvf go1.15.2.linux-amd64.tar.gz 
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.profile
					echo 'export GOPATH=$HOME/go'	>> ~/.profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile	
					source ~/.
					profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx

GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx

GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

go get -u github.com/tomnomnom/httprobe

go get github.com/tomnomnom/waybackurls

go get -u github.com/ffuf/ffuf

GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
