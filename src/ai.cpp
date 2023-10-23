#include "tensorflow/c/c_api.h"
#include "tensorflow/cc/saved_model/loader.h"
#include <iostream>

void* loadModel() {
    TF_Version();  // Program segfaults without this ¯\_(ツ)_/¯
    tensorflow::SavedModelBundle* bundle = new tensorflow::SavedModelBundle;

    tensorflow::SessionOptions session_options;
    tensorflow::RunOptions run_options;
    tensorflow::Status status = tensorflow::LoadSavedModel(
        session_options, run_options, "/home/rowan/model", {"serve"}, bundle);

    if (!status.ok()) {
        std::cerr << "Failed to load model: " << status << "\n";
        return bundle;
    }
    return bundle;
}

int runModel(void* bundle, int tokens[]) {
    tensorflow::SavedModelBundle* actualBundle = (tensorflow::SavedModelBundle*) bundle;

    auto sig_map = actualBundle->GetSignatures();
    auto model_def = sig_map.at("serving_default");


    auto input_name = model_def.inputs().at("input_1").name();
    auto output_name = model_def.outputs().at("output_1").name();
    
    // std::cout << "input_name: " << input_name << std::endl;
    // std::cout << "output_name: " << output_name << std::endl;
  
    tensorflow::Tensor input_tensor(tensorflow::DT_UINT8, tensorflow::TensorShape({1, 256}));
    auto data = input_tensor.flat<uint8_t>().data();

    for (int i=0; i<256; i++) {
      data[i] = tokens[i];
    }

    std::vector<tensorflow::Tensor> output_tensor;
    tensorflow::Status status = actualBundle->session->Run({{input_name, input_tensor}},
                                  {output_name}, {}, &output_tensor);

    // std::cout << "input  " << input_tensor.DebugString() << std::endl;
    // std::cout << "output " << output_tensor[0].DebugString() << std::endl;
    // std::cout << "output " << output_tensor[0] << std::endl;

    auto output_data = output_tensor[0].flat<float>().data();

    unsigned int max = 0;
    float max_value = output_data[0];
    for(unsigned int i = 1; i < 256; i++) {
      if (output_data[i] > max_value) {
        max_value = output_data[i];
        max = i;
      }
    }

    if (!status.ok()) {
      std::cerr << "Failed to run model: " << status << "\n";
      return -1;
    }

    return max;
}
