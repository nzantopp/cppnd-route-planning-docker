# cppnd-route-planning-docker

## Introduction

This repository contains the Docker build file facilitates the first project "Build an OpenStreetMap Route Planner" of the Udacity C++ Nanodegree.

## Quick Start

Pull and run the image with:
```bash
docker pull nzantopp/cppnd-route-planning:latest
```

## Prerequisites

- Docker installed on the host machine.
- For GUI applications, platform-specific configurations are needed (as detailed below).

## Displaying GUI from the Container

The project's application, `OSM_A_star_search`, requires graphical display capabilities. 

### Linux:
1. Allow your X11 server to accept connections:
    ```
    xhost +
    ```

2. Start the Docker container with X11 socket sharing:
    ```
    docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro nzantopp/cppnd-route-planning:latest
    ```

### macOS:
1. Install and set up XQuartz:
    - Download from [XQuartz's official site](https://www.xquartz.org/) or use Homebrew:
        ```
        brew install --cask xquartz
        ```
    - Launch XQuartz and enable "Allow connections from network clients" in **Preferences** → **Security**.
      ```
      xquartz
      ```

2. Permit connections and get the IP:
    ```
    xhost +
    IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    ```

3. Start the Docker container with the DISPLAY variable:
    ```
    docker run -e DISPLAY=$IP:0 nzantopp/cppnd-route-planning:latest
    ```

## Configuration

Default configurations are set for typical use. To override configurations or provide additional settings, please refer to the application's documentation.

## Networking

No additional ports are exposed by default. If specific networking requirements are needed, please refer to the project's documentation.

## Building from Source

For users interested in building from the source or contributing, the source code and Dockerfile can be found at [GitHub Repository Link](https://github.com/nzantopp/cppnd-route-planning-docker).

## Versioning

Always check the tags available for different versions. The `latest` tag provides the most recent stable version.

## Support & Contribution

Feedback and contributions are always welcome. For issues or collaboration, refer to the GitHub repository or contact the maintainer.


## License

This Docker image is based on base image [gcc](https://hub.docker.com/_/gcc) that is licensed under the GNU General Public License (GPL). Consequently, this Docker image is also distributed under the GPL. The source code, Dockerfile, and all relevant files for building this image are made available in the provided GitHub repository. Any modifications to the original GPL-licensed software are stated in the repository.

For the complete terms and conditions of the GPL, refer to the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html).


## Acknowledgments & References

- Credit to the Udacity C++ Nanodegree program.
- Further details can be found in the official [https://github.com/udacity/CppND-Route-Planning-Project].

