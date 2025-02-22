<h1>remove docker</h1>

<h2>Auto</h2>

```
wget https://github.com/khendraid/remove-docker/blob/main/remove-docker.sh
```
```
chmod +x remove-docker.sh
```
```
sudo ./remove-docker.sh
```

<h2>Manual</h2>

<h3>stop the Docker service to ensure no processes are running</h3>

```
sudo systemctl stop docker
```
```
sudo systemctl stop docker.socket
```
<h3>Uninstall Docker Packages</h3>

```
sudo apt-get purge -y docker.io docker-ce docker-ce-cli containerd docker-buildx-plugin docker-compose-plugin
```
<h3>Remove Docker Configuration and Data</h3>

```
sudo rm -rf /var/lib/docker
```
```
sudo rm -rf /etc/docker
```
```
sudo rm -rf /var/run/docker.sock
```
If you’ve used Docker Compose standalone, also remove its configuration:
```
sudo rm -rf ~/.docker
```
<h3>Remove Docker User Group</h3>

```
sudo groupdel docker
```
If the group is still in use by any users, you’ll get an error. To check and remove users from the group first:
```
sudo grep -i docker /etc/group
sudo deluser <username> docker
```
Then retry groupdel
<h3>Clean Up Unused Dependencies</h3>

```
sudo apt-get autoremove -y
```
```
sudo apt-get autoclean
```
<h2>(Optional) Remove Docker Repository (if added)</h2>

```
sudo rm -f /etc/apt/sources.list.d/docker.list
```
```
sudo apt-get update
```

