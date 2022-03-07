sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://192.168.38.69:8080/api/ | grep -E 'Requests/sec:|99% in '
sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://192.168.14.95:4000/ | grep -E 'Requests/sec:|99% in '

sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body }}}\",\"variables\":null}" http://192.168.38.69:8080/api/ | grep -E 'Requests/sec:|99% in '
sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body }}}\",\"variables\":null}" http://192.168.14.95:4000/ | grep -E 'Requests/sec:|99% in '

sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email }}\",\"variables\":null}" http://192.168.38.69:8080/api/ | grep -E 'Requests/sec:|99% in '
sudo docker run rcmorano/docker-hey -z 10s -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email }}\",\"variables\":null}" http://192.168.14.95:4000/ | grep -E 'Requests/sec:|99% in '

sudo docker run rcmorano/docker-hey -z 1m -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://192.168.38.69:8080/api/
sudo docker run --name=tyk-gateway --network=tyk --rm -p 8080:8080 -v "/opt/tyk-gateway/tyk.conf:/opt/tyk-gateway/tyk.conf" -v "/opt/tyk-gateway/apps:/opt/tyk-gateway/apps" -e GOGC=1600 --ulimit nofile=80000:80000 tykio/tyk-gateway:v4.0.0-rc28

sudo apt install git wget gcc -y
git clone https://github.com/TykTechnologies/tyk.git
cd tyk
git checkout tags/v4.0.0-rc28
cd ..
wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz
tar -xzf go1.16.linux-amd64.tar.gz
sudo mv go /usr/local
mkdir -p /usr/local/go/src/github.com/TykTechnologies/tyk
mv tyk/* /usr/local/go/src/github.com/TykTechnologies/tyk/
rm go1.16.linux-amd64.tar.gz
cd /usr/local/go/src/github.com/TykTechnologies/tyk
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
go mod tidy
go mod vendor
cp /opt/tyk-gateway/tyk.conf .
rm apps/*
cp /opt/tyk-gateway/apps/* apps/
go run main.go

ansible-playbook playbook.yml -t install -t standup
curl -X POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { name posts { title comments { name }}}}\",\"variables\":null}" http://{gateway_internal_ip}:8080/api/
sudo docker run rcmorano/docker-hey -z 2m -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://{gateway_internal_ip}:8080/api/


curl -X POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { name posts { title comments { name }}}}\",\"variables\":null}" http://192.168.14.227:4000/

sudo docker run rcmorano/docker-hey -z 10s -q 2 -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://192.168.15.158:8080/api/
sudo docker run rcmorano/docker-hey -z 10s -q 2 -m POST -H "Content-Type: application/json" -d "{\"query\":\"query { user(id: 1) { username name email posts { title body comments { name email body }}}}\",\"variables\":null}" http://192.168.14.227:4000/
