# Dev Containers
The [Visual Studio Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
extension lets you use a Docker container as a full-featured development environment.

Steps to [install](https://code.visualstudio.com/docs/devcontainers/containers#_installation)
and use dev Containers - 

## 1. Install docker
**Windows / macOs**
* If you are using windows, ensure [WSL 2](https://aka.ms/vscode-remote/containers/docker-wsl2) 
back-end is enabled. Steps to install WSL2 - 
[https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

* Install [Docker Desktop for Windows/Mac](https://www.docker.com/products/docker-desktop).

**Linux**
* Install [docker](https://docs.docker.com/desktop/install/linux-install/)

## 2. Install Visual Studio Code
* Download and install [vscode](https://code.visualstudio.com/)
* Install [Dev Container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension for vscode.

--------------------------------------------------

**Clone the repo and open it in vscode**
- Follow [this](../submission-instructions.md) to clone the repo

```bash
cd web-bootcamp-2024
code .
```
## 3. Open the folder in dev container
* Open the repo in VS code and press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>p</kbd> to bring up the Command Palette,
and search for command **Dev Containers: Reopen in Container** and execute it. This uses the dev 
container [config file](../.devcontainer/devcontainer.json) 
inside `.devcontainer` folder to create a new dev container.

![image](https://github.com/user-attachments/assets/a6d5989e-f035-4f31-998c-69669942f4ac)


* The VS Code window will reload and start building the dev container. A progress notification provides status updates.
* After the build completes, VS Code will automatically connect to the container.

-------------------------------------------------

The folder will be reopened inside a Debian container.
The container has `rvm`, `node`, `ruby` and `yarn` preinstalled so you can get started off working with rails.

![image](https://github.com/user-attachments/assets/fcb8907d-d65f-4826-96f9-5b54e9fefaf7)

--------------------------------------------------

Once done head over [here](./README.md#rvm), to learn about RVM and gemsets.
