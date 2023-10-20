#!/bin/bash

DOCKER_BUILDKIT=1 docker build -t rowanw/ai-from-ada:latest -f Dockerfile ../..

# docker push rowanw/ai-from-ada:latest
