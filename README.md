# Julieanne
The server for our Community Project, this will be where all the development for our lovely lady happens.

## Development

Based as much in Swift as possible, Julieanne is a small cog in a Community Project with a single purpose: To create the best chat application as possible in Swift. This includes multi platform support, robust back end support, and the ability to scale.

## How to Get Started

1) Install [Homebrew](https://brew.sh)
    - Open Terminal and run `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2) Install [Vapor](https://docs.vapor.codes/2.0/getting-started/install-on-macos/). (not all steps will work on all systems, but SHOULD install fine)
    - Open Terminal and run the following:
        - `brew update && brew tap vapor/homebrew-tap`
        - `brew install vapor`
3) Install [Docker Desktop](https://hub.docker.com)
    - Click the link above
    - Sign up or sign in
    - Click "Get Started with Docker Desktop"
    - Click "Download Docker Desktop for Mac" (or your platform)
    - You can optionally continue with the rest of the steps, but it is not required
4) Setup Docker
    - Open Terminal and run the following while INSIDE the project folder: 
        - `docker run --name postgres -e POSTGRES_DB=vapor \
        -e POSTGRES_USER=vapor -e POSTGRES_PASSWORD=password \
        -p 5432:5432 -d postgres` (copy as one command)
        - If you receive an error with the above command, ensure you copied it as one command unedited, you have docker open and running (it is green and says Docker is Running in the top bar), and that you do not already have a container called postgres (you can check by running `docker ps`)
5) Download and setup the repository
    - Download or cloan the project by clicking in the top right
    - In Terminal, run the following (if you would like to run in Xcode, also see [here](https://docs.vapor.codes/2.0/getting-started/xcode/):
        - `vapor xcode -y`

## Roadmap

[ X ] Create a basic server (Vapor)</br>
[ ] Basic webpage/site to replace the github landing page (Leaf)</br>
[ ] Starter for Juli API interaction</br>
[ ] Starter website for web-platform support (Leaf)
