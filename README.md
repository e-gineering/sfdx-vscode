# sfdx-vscode

This starter is designed to provide an easy way to create new sfdx projects using VS Code dev containers. The install script will create a project folder at the specified path, and copy the .devcontainer folder and contents into the project folder. From there, VS Code can be used to open the folder, and should prompt the user to build and open the container.

Once the container is up and running, the dx-tools scripts are available from the terminal inside the container. These are designed to provide simple quality of life improvements when working with the sfdx toolset.

## Initial Setup

Execute the appropriate install script. This will prompt you for:

1. The project folder
1. The project folder's location

Once the folder is created, open the folder using VS Code. VS Code may ask if you trust the authors of the parent folder, and should also tell you the folder contains a development container and ask if you would like to open the container. At this point you should say yes. The container will start up, and load into the folder as a dev container. VS Code will take some time installing the extensions.

## SFDX Project Setup

Once the extensions have been installed, the `SFDX: Create Project` command can be run from the command bar. Enter the type of project and project name, and wait for the project to be created.

## Connecting SFDX to a SF org

The list of currently connected orgs can be viewed using the terminal command `dx-list`. In order to connect to a dev hub, the command `SFDX: Authorize a Dev Hub` can be used from the command bar.

In order to connect to a sandbox, from the terminal, use the `sfdx org login device` command and follow the prompts to set up the sandbox connection.

## Opening a SF org using dx-open

One drawback of using the dev container is that you cannot directly open orgs in the browser using `sf org open` (or `dx-open`). Instead, you will get a warning that you are in a headless environment, and there will be a link to the org at the end of the message. You should be able to ctrl/cmd + click the link to open in your default browser.
