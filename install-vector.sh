#!/bin/sh

# add netflix key to apt
curl 'https://bintray.com/user/downloadSubjectPublicKey?username=netflixoss' | sudo apt-key add -

# add netflix repository to apt (trusty need be changed if the os is not trusty)
echo "deb https://dl.bintray.com/netflixoss/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update

sudo apt-get install pcp pcp-webapi

# check if pcp processes are running
# at least pmcd, pmwebd should running
ps -ef | grep pm

# check if pcp ports are opened
# at lease 44321 44323 need be open and listen
netstat -l | grep 443

sudo apt-get install nodejs-legacy nodejs npm

git clone https://github.com/Netflix/vector.git
cd vectors
git checkout stable

npm install --global bower

# might need use  npm install --global gulp@3.8.11
npm install --global gulp

# might not need remove and install
npm rm browser-sync && npm install browser-sync

# install missing modules in order to run `gulp build`
npm install immutable
npm install socket.io
npm install socket.io-client
npm install raw-body
npm install iconv-lite
npm install on-finished
npm install through2
npm install jshint
npm install rcloader
npm install esprima
npm install estraverse
npm install sugar
npm install source-map
npm install simple-fmt
npm install simple-is
npm install alter
npm install ordered-ast-traverse
npm install convert-source-map
npm install stable
npm install stringmap
npm install stringset
npm install acorn
npm install csso

gulp build

cd dist
python -m SimpleHTTPServer 8880

# open chrome (there one js load issue if using firefox)
# http://localhost:8880/#/?host=localhost&hostspec=localhost


