#include "tensorflow/c/c_api.h"
#include "tensorflow/cc/saved_model/loader.h"
#include <iostream>



// int loadIndentModel(tensorflow::SavedModelBundle bundle) {
//   tensorflow::SessionOptions session_options;
//   tensorflow::RunOptions run_options;

//   tensorflow::Status status = tensorflow::LoadSavedModel(
//       session_options, run_options, "/workspaces/ai_model_from_ada/model", {"serve"}, &bundle);

//   if (!status.ok()) {
//     std::cerr << "Failed to load model: " << status << "\n";
//     return 1;
//   }
//   return 0;
// }

int loadAndRun() {
    std::cout << "TF_Version: " << TF_Version() << "\n";


    // tensorflow::SavedModelBundle bundle;
    // loadIndentModel(&bundle);

    tensorflow::SessionOptions session_options;
    tensorflow::RunOptions run_options;
    tensorflow::SavedModelBundle bundle;

    tensorflow::Status status = tensorflow::LoadSavedModel(
        session_options, run_options, "/workspaces/ai_model_from_ada/model", {"serve"}, &bundle);

    if (!status.ok()) {
      std::cerr << "Failed to load model: " << status << "\n";
      return -1;
    }


    auto sig_map = bundle.GetSignatures();
    auto model_def = sig_map.at("serving_default");


    auto input_name = model_def.inputs().at("input_1").name();
    auto output_name = model_def.outputs().at("output_1").name();
    
    std::cout << "input_name: " << input_name << std::endl;
    std::cout << "output_name: " << output_name << std::endl;
  
    tensorflow::Tensor input_tensor(tensorflow::DT_UINT8, tensorflow::TensorShape({1, 256}));
    auto data = input_tensor.flat<uint8_t>().data();
    data[0]= 2;
    data[1]= 31;
    data[2]= 2;
    data[3]= 101;
    data[4]= 101;
    data[5]= 101;
    data[6]= 101;
    data[7]= 101;
    data[8]= 101;
    data[9]= 101;
    data[10]= 81;
    data[11]= 97;
    data[12]= 3;
    data[13]= 2;
    data[14]= 2;
    data[15]= 2;
    data[16]= 4;
    data[17]= 3;
    data[18]= 2;
    data[19]= 2;
    data[20]= 2;
    data[21]= 4;
    data[22]= 3;
    data[23]= 2;
    data[24]= 2;
    data[25]= 2;
    data[26]= 4;
    data[27]= 3;
    data[28]= 2;
    data[29]= 2;
    data[30]= 2;
    data[31]= 4;
    data[32]= 3;
    data[33]= 2;
    data[34]= 2;
    data[35]= 2;
    data[36]= 35;
    data[37]= 3;
    data[38]= 2;
    data[39]= 2;
    data[40]= 2;
    data[41]= 49;
    data[42]= 2;
    data[43]= 101;
    data[44]= 101;
    data[45]= 101;
    data[46]= 101;
    data[47]= 101;
    data[48]= 101;
    data[49]= 101;
    data[50]= 101;
    data[51]= 101;
    data[52]= 101;
    data[53]= 101;
    data[54]= 101;
    data[55]= 101;
    data[56]= 101;
    data[57]= 101;
    data[58]= 101;
    data[59]= 3;
    data[60]= 2;
    data[61]= 2;
    data[62]= 2;
    data[63]= 2;
    data[64]= 2;
    data[65]= 2;
    data[66]= 80;
    data[67]= 101;
    data[68]= 101;
    data[69]= 101;
    data[70]= 2;
    data[71]= 2;
    data[72]= 2;
    data[73]= 2;
    data[74]= 98;
    data[75]= 2;
    data[76]= 52;
    data[77]= 2;
    data[78]= 31;
    data[79]= 2;
    data[80]= 101;
    data[81]= 101;
    data[82]= 101;
    data[83]= 101;
    data[84]= 101;
    data[85]= 101;
    data[86]= 101;
    data[87]= 97;
    data[88]= 3;
    data[89]= 2;
    data[90]= 2;
    data[91]= 2;
    data[92]= 2;
    data[93]= 2;
    data[94]= 2;
    data[95]= 2;
    data[96]= 101;
    data[97]= 101;
    data[98]= 101;
    data[99]= 101;
    data[100]= 101;
    data[101]= 101;
    data[102]= 2;
    data[103]= 98;
    data[104]= 2;
    data[105]= 2;
    data[106]= 2;
    data[107]= 2;
    data[108]= 31;
    data[109]= 2;
    data[110]= 101;
    data[111]= 101;
    data[112]= 101;
    data[113]= 101;
    data[114]= 101;
    data[115]= 101;
    data[116]= 101;
    data[117]= 81;
    data[118]= 97;
    data[119]= 3;
    data[120]= 2;
    data[121]= 2;
    data[122]= 2;
    data[123]= 4;
    data[124]= 3;
    data[125]= 2;
    data[126]= 2;
    data[127]= 2;
    data[128]= 4;
    data[129]= 3;
    data[130]= 2;
    data[131]= 2;
    data[132]= 2;
    data[133]= 4;
    data[134]= 3;
    data[135]= 2;
    data[136]= 2;
    data[137]= 2;
    data[138]= 4;
    data[139]= 3;
    data[140]= 2;
    data[141]= 2;
    data[142]= 2;
    data[143]= 35;
    data[144]= 3;
    data[145]= 2;
    data[146]= 2;
    data[147]= 2;
    data[148]= 49;
    data[149]= 2;
    data[150]= 101;
    data[151]= 101;
    data[152]= 101;
    data[153]= 101;
    data[154]= 101;
    data[155]= 101;
    data[156]= 101;
    data[157]= 101;
    data[158]= 101;
    data[159]= 101;
    data[160]= 101;
    data[161]= 101;
    data[162]= 101;
    data[163]= 101;
    data[164]= 101;
    data[165]= 101;
    data[166]= 101;
    data[167]= 101;
    data[168]= 101;
    data[169]= 101;
    data[170]= 3;
    data[171]= 2;
    data[172]= 2;
    data[173]= 2;
    data[174]= 2;
    data[175]= 2;
    data[176]= 2;
    data[177]= 80;
    data[178]= 101;
    data[179]= 101;
    data[180]= 101;
    data[181]= 2;
    data[182]= 2;
    data[183]= 2;
    data[184]= 2;
    data[185]= 98;
    data[186]= 2;
    data[187]= 52;
    data[188]= 2;
    data[189]= 31;
    data[190]= 2;
    data[191]= 101;
    data[192]= 101;
    data[193]= 101;
    data[194]= 101;
    data[195]= 101;
    data[196]= 101;
    data[197]= 101;
    data[198]= 97;
    data[199]= 3;
    data[200]= 2;
    data[201]= 2;
    data[202]= 2;
    data[203]= 2;
    data[204]= 2;
    data[205]= 2;
    data[206]= 2;
    data[207]= 101;
    data[208]= 101;
    data[209]= 101;
    data[210]= 101;
    data[211]= 101;
    data[212]= 101;
    data[213]= 2;
    data[214]= 98;
    data[215]= 2;
    data[216]= 2;
    data[217]= 2;
    data[218]= 2;
    data[219]= 31;
    data[220]= 2;
    data[221]= 101;
    data[222]= 101;
    data[223]= 101;
    data[224]= 101;
    data[225]= 101;
    data[226]= 101;
    data[227]= 101;
    data[228]= 81;
    data[229]= 97;
    data[230]= 3;
    data[231]= 2;
    data[232]= 2;
    data[233]= 2;
    data[234]= 4;
    data[235]= 3;
    data[236]= 2;
    data[237]= 2;
    data[238]= 2;
    data[239]= 4;
    data[240]= 3;
    data[241]= 2;
    data[242]= 2;
    data[243]= 2;
    data[244]= 4;
    data[245]= 3;
    data[246]= 2;
    data[247]= 2;
    data[248]= 2;
    data[249]= 4;
    data[250]= 3;
    data[251]= 2;
    data[252]= 2;
    data[253]= 2;
    data[254]= 35;
    data[255]= 3;
    

    std::vector<tensorflow::Tensor> output_tensor;
    status = bundle.session->Run({{input_name, input_tensor}},
                                  {output_name}, {}, &output_tensor);

    std::cout << "input  " << input_tensor.DebugString() << std::endl;
    std::cout << "output " << output_tensor[0].DebugString() << std::endl;
    std::cout << "output " << output_tensor[0] << std::endl;

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
