#!/bin/bash

echo "Enter the name of virtual environment you want to create:"
read virtual_env
echo "Enter the name of Azure App Service name you want to deploy:"
read app_service

echo "The URL of your Azure App Service would be; https://${app_service}.azurewebsites.net"

python3 -m venv ~/.$virtual_env
source ~/.$virtual_env/bin/activate
make install
export FLASK_APP=app.py
echo "az webapp --sku F1 -n $app_service"

