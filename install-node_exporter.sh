#!/bin/bash

# Download and extract node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar -xf node_exporter-1.7.0.linux-amd64.tar.gz

# Move node_exporter to /usr/local/bin
sudo mv node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin

# Remove downloaded files
rm -r node_exporter-1.7.0.linux-amd64*
 
# Create user for node_exporter
sudo useradd -rs /bin/false node_exporter

# Create systemd service file
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOL
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd and enable/start node_exporter
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

# Display node_exporter status
sudo systemctl status node_exporter
