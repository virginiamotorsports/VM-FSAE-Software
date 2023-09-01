
sudo apt-get install curl zip unzip tar -y
if [ -d "~/Downloads" ] 
then
    echo "Downloads dir exists." 
else
    mkdir ~/Downloads
    echo "Error: Downloads dir does not exists; creating one now."
fi
cd ~/Downloads

git clone https://github.com/microsoft/vcpkg.git

cd vcpkg

./bootstrap-vcpkg.sh

./vcpkg install protobuf
