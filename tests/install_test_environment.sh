sudo apt-get update
sudo apt-get -y install bridge-utils python3 python-is-python3 python3-venv python3-virtualenv
sudo brctl addbr br0
sudo ip addr add 10.0.0.10/24 dev br0
sudo ip link add dummy1 type dummy
sudo ip link set dev dummy1 master br0
sudo ip link set dummy1 up
sudo ip link set br0 up
#!/bin/bash

cd ~
git clone https://github.com/mangdangroboticsclub/mini_pupper_bsp.git

virtualenv mini_pupper_venv
source  mini_pupper_venv/bin/activate
pip install -e ~/mini_pupper_bsp/mock_api
# test installation of mock API
cd ~/mini_pupper_bsp/mock_api/tests
pytest

cd ~
git clone https://github.com/stanfordroboticsclub/UDPComms.git
pip install -e ~/UDPComms/
pip install msgpack

cd ~
git clone https://github.com/mangdangroboticsclub/mini_pupper_web_controller.git
pip install -e mini_pupper_web_controller/joystick_sim