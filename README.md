# ESP32 HTTP example
## Get the code
Git clone to directory of choice.

## Developing on local host
If all else fails, the following extensions can be installed in your local vscode instance to start developing outside of a devcontainer.

If you want to avoid manual configuration when updates are made to settings/extensions, see [Developing in a dev container](#developing-in-dev-container)

### Installing and configuring the development tools
1. Install [VSCode](https://code.visualstudio.com/download) on host.
2. Install the following extensions in vscode.
    ```bash
    code --install-extension platformio.platformio-ide \
        --install-extension ms-vscode.cpptools
    ```

## Developing in dev container
Running a devcontainer avoids manually installing and configuring the extensions necessary to develop for embedded devices.
As extensions are added or re-configured and those changes are pushed to the main branch in github, when the main branch is fetched and the dev container started, a new container with updated extensions and configuration will be built.

This helps to provide a consistent development experience across development machines.

If devcontainers don't work or you prefer to develop directly on the host, see [Developing on local host](#developing-on-local-host).

### Installing and configuring the development tools
1. Install [Docker](https://www.docker.com/get-started/) on host: See docker install documentation for your OS of choice. [Linux install](https://docs.docker.com/desktop/install/linux-install/)
2. User is added to the appropriate groups to control docker. For Linux, run command `usermod -aG docker ${USER}`. Reboot may be required after.
3. Install [VSCode](https://code.visualstudio.com/download) on host.
4. Install "devcontainer" extension in vscode `code --install-extension ms-vscode-remote.remote-containers`.

### Start the dev container
1. Open the project folder in VSCode. In bash navigate to the folder what is the root of the project (where is the README.md) and run `code .`.
2. With the devcontainer extension installed, clicking on the devcontainer button in lower left corner of vscode should open menu at top of screen where you can choose to "Open in a dev container".![Alt text](images/image.png)
3. After some time, vscode should reload and start initializing the PlatformIO extension.
4. Once PlatformIO is initialized, it should prompt to reload vscode.  Reload vscode.
5. Subsequent runs of the container will be much faster once the container is built, unless changes have been pushed to github to update the container or extensions, and those changes have been fetched.

## Configuring sensitive information such as WIFI secrets

## Building the code

## Uploading the code to the device

## Connecting to serial output of the device

## Installing additional libraries
