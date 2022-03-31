# CloudDevOpsCourse2-Project

# Overview

The aim of this project to demonstrate an end-to-end CI / CD flow. 

* We will be using Github actions to demonstrate Continuous Integration to keep our code in a working state and continuously assess the quality of our code. 
* For the Continuous Deployment aspect of it - we will be using Azure Pipelines to assess our code quality and continuously deploy our changes to production on Microsoft Azure using its webapp service.


## Project Plan
<TODO: Project Plan

* A link to a Trello board for the project
* A link to a spreadsheet that includes the original and final project plan>

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

The project is designed to be ran on Azure App Service as a simple Flask webapp. The simple ways to get this project up and running is to simply clone this repository in Azure Cloud Shell or any environment where you have Azure  CLI available. 

<IMAGE OF REPOSITORY CLONED IN AZURE CLOUD SHELL>
![alt text](https://github.com/SyedFurqan1/CloudDevOpsCourse2-Project/blob/main/misc_images/project_cloned_in_azure_cloud_shell.png?raw=true)

Once you have the repository cloned - you can first try to run the flask webapp by these simple commands;

```pip -m venv ~/.flaskenv```  (this is going to create a virtual environment in your home directory through which you can smartly manage your python packages.

Run ``` source ~/.flaskenv/bin/activate ``` to acticate your virtual environment locally. 
In order to setup the dependencies and do a test lint we can run ``` make all ```. (this will install all the required python packages and do some additional linting and tests. Have a look at Makefile for additional information, here is how it's going to look;

<ADD IMAGE OF MAKE ALL COMMAND OUTPUT>
![alt text]()


The following commands can be run in order to then test and start the application;

1. ``` export FLASK_APP=app.py ```
2. ``` flask run ```

You should be able to see the following with your application running on port 5000 (port is specified in app.py).

<ADD IMAGE HERE FOR APP RUNNING LOCALLY>
![alt text]()

Now we can proceed to host our Webapp on Azure Web Apps using Azure CLI tool. (You should have Azure CLI logged in to your account, if that is not the case then you can run ``` az account login ```).

Our webapp can be deployed to Azure using a simple command:  ``` az webapp up --sku F1 -n <name_of_your_webapp> ```.

In the above command, F1 specifies free tier and -n is a shorthand flag to pass the name of your webapp, for the sake of this ReadMe and tutorial I have used the name "course2cdproject".

This may take a minute or two - but after that you should be able to see your webapp up and running in your Azure Portal. For example;

<ADD IMAGE OF RUNNING WEBAPP IN PORTAL>
![alt text]()

Now that we have our Webapp deployed - We can do a test check of our running application through the cloud shell and check the application logs to see how the request is looking on the application end.

We can use the script ``` make_predict_azure_app.sh ``` (we need to update the URL in this bash script for our webapp. We essentially need to add the name of our webapp hosted on Azure in the URL);

<ADD IMAGE OF USING THE SCRIPT TO TEST THE APPLICATION>
![alt text]()


We can see the logs of our application on the Azure Portal or using the URL ``` https://<app-name>.scm.azurewebsites.net/api/logs/docker ```. In the following image we are checking the logs of our application on the Azure portal;

<ADD IMAGE OF APPLICATION LEVEL LOGS>
![alt text]()

And you are done! The application is up and running. 


We have also implemented CI (using Github Actions) and CD (Using Azure Pipelines).

Github actions is essentially configured to utilize the Makefile to perform some linting and testing steps, and these steps are configured in the ``` main.yml `` in this repository. Here is a screenshot of passing tests which indicates that the code is in a working state;

<IMAGE OF PASSING GITHUB ACTIONS>
![alt text]()

We have also integrated CD using Azure Pipelines - the flow has been defined in the file ``` azure-pipelines.yml ``` (to configure this we need to create an Azure Pipeline in a project which has a service integration with Azure and Github. We are using a default template for Linux App on Azure Webapp. Here is an image which shows Azure Pipelines in action;

<IMAGE OF AZURE DEVOPS PIPELINE DEPLOYMENT IN ACTION>
![alt text]()



## Enhancements

To further improve this project in the future - we will be adding further testing steps to have a more robust control over what is being deployed to the Webapp contitnuously to ensure that the live service is safe and running bug-free!

## Demo 

<TODO: Add link Screencast on YouTube>


