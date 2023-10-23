# AI Model from Ada

Tests calling TensorFlow (TF) model from Ada (using bindings to C++).

This "worked", though there is still lots to do:
1. Load and execute in different steps
1. Add function to tokenise text
1. Use this function and remove currently hardcoded example
1. Figure out how to link to TF statically, to make distribution easier
1. Create devcontainer that contains pre-built TF, protobuf and other deps
1. Test inference time on various GPUs and CPUs

## Rough build steps

1. Open in dev container (currently this is just using tensorflow/build:2.14-python3.11)
1. Grab TF sources from GitHub (tested with 2.14 https://github.com/tensorflow/tensorflow/releases/tag/v2.14.0)
1. Build TF using bazel (and some args I can't remember)
1. Go for a walk while your computer spends the next hour building TF...
1. Install built libraries (I moved things to /usr/local/(lib|include))
1. Grab protobuf v3.21.9 from GitHub (https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.21.9.tar.gz)
1. Build and install protobuf
1. Train TF model (done using https://github.com/rowan-walshe/ai-indent/tree/feature/Train-model)
1. Move saved trained model into the model dir in this project
1. Grab alr binary (because I haven't made a devcontainer that contains it yet)
1. Run alr build/alr run
1. Watch how using the magic of AI, it is able to predict that the hard coded example should have a indentation of 3 on the next line

## Steps to build tensorflow
1. Grab TF sources from GitHub (tested with 2.14 https://github.com/tensorflow/tensorflow/releases/tag/v2.14.0)
1. `cd tensorflow`
1. `./configure` (and select sensible options)
1. `bazel build //tensorflow:libtensorflow.so //tensorflow:libtensorflow_cc.so //tensorflow:install_headers`
1. `cp -d bazel-bin/tensorflow/*.so* /usr/local/lib/`
1. `cp -r bazel-bin/tensorflow/include /usr/local/include`
1. `cp -r /usr/local/include/src/* /usr/local/include`
1. `export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH`

## Notes

It currently takes about 300ms to load the model, but inference takes (some different small amount of time that I haven't measured). My hope is that by splitting the loading and inference functions, inference will take a negligible amount of time. Though I'm not sure if this is a pipe dream when running on a CPU though...

To enable it to find libstdc++:
`export LD_LIBRARY_PATH=/home/rowan/.cache/alire/dependencies/gnat_native_13.2.1_788a01f9/lib64:$LD_LIBRARY_PATH`

To disable TF debug info:
`export TF_CPP_MIN_LOG_LEVEL=3`

## Useful links
https://iq.opengenus.org/build-tensorflow-cpp-library/