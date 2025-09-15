#!/bin/bash
# Copyright (c) 2022-2025, NVIDIA CORPORATION.
set -ex

CUDA_HOME="/usr/local/cuda"

git clone https://github.com/openucx/ucx.git

cd ucx
git checkout "$1"
./autogen.sh
mkdir build-linux && cd build-linux
../contrib/configure-release --prefix="${CONDA_PREFIX}" --with-sysroot --enable-cma \
    --enable-mt --with-gnu-ld --with-rdmacm --with-verbs \
    --with-cuda="${CUDA_HOME}"
make -j install
