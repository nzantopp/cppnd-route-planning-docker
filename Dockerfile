# Use the base GCC image
FROM gcc:7.4.0

# Metadata
LABEL maintainer="nzantopp@googlemail.com" \
      description="Docker image for CppND-Route-Planning-Project https://github.com/udacity/CppND-Route-Planning-Project"

# Install dependencies as defined in the io2d BUILDING.md file (https://github.com/cpp-io2d/P0267_RefImpl/blob/master/BUILDING.md)
RUN apt-get update && apt-get install -y \
    cmake \
    libcairo2-dev \
    libgraphicsmagick1-dev \
    libpng-dev \
    git \ 
    && rm -rf /var/lib/apt/lists/* 

# Set the working directory
WORKDIR /workspace

# Clone the repository with submodules
RUN git clone --recurse-submodules https://github.com/cpp-io2d/P0267_RefImpl

# Change to the project directory for building
WORKDIR /workspace/P0267_RefImpl

# Build and install io2d
RUN mkdir -p Debug && \
    cd Debug && \
    cmake --config Debug "-DCMAKE_BUILD_TYPE=Debug" .. && \
    cmake --build . --target install

WORKDIR /workspace

# Set default command to bash for interaction
CMD ["/bin/bash"]