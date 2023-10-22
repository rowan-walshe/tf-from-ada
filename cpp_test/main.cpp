// #include "tensorflow/c/c_api.h"
#include "tensorflow/cc/saved_model/loader.h"
#include "ai.h"
#include <iostream>

// using namespace std::chrono;

int main() {
  int input[256] = {2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3, 2, 2, 2, 49, 2, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 3, 2, 2, 2, 2, 2, 2, 80, 101, 101, 101, 2, 2, 2, 2, 98, 2, 52, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 97, 3, 2, 2, 2, 2, 2, 2, 2, 101, 101, 101, 101, 101, 101, 2, 98, 2, 2, 2, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3, 2, 2, 2, 49, 2, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 3, 2, 2, 2, 2, 2, 2, 80, 101, 101, 101, 2, 2, 2, 2, 98, 2, 52, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 97, 3, 2, 2, 2, 2, 2, 2, 2, 101, 101, 101, 101, 101, 101, 2, 98, 2, 2, 2, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3};

  // Load model
  // auto start = high_resolution_clock::now();
  void* bundle = loadModel();
  // auto stop = high_resolution_clock::now();
  // auto duration = duration_cast<microseconds>(stop - start);
  // std::cout << "Load time: " << duration.count() << std::endl;

  // Run model
  // start = high_resolution_clock::now();
  int indent = runModel(bundle, input);
  // stop = high_resolution_clock::now();
  // duration = duration_cast<microseconds>(stop - start);

  // std::cout << "Run time: " << duration.count() << std::endl;
  std::cout << "Indent by: " << indent << std::endl;
}