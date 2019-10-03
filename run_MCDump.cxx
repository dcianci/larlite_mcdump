#include <iostream>
#include <string>

#include "Analysis/ana_processor.h"
#include "DataFormat/storage_manager.h"
#include "RecoTool/ShowerReco3D/App/SegmentDump.h"
int main(int argc, char** argv) {


larlite::ana_processor my_proc;

std::string INFILE(argv[1]);
std::string NUM(argv[2]);
std::string OUTFILE("mc_information_");
OUTFILE = OUTFILE + NUM + ".root";

my_proc.add_input_file(INFILE);

my_proc.set_io_mode(larlite::storage_manager::kREAD);
my_proc.set_ana_output_file(OUTFILE);
my_proc.set_output_file("");

larlite::SegmentDump mc_module;
my_proc.add_process(&mc_module);

my_proc.run();

  
  return 0;
}
