    #include <iostream>
    #include <vector>
    #include "rapidcsv.h"
    #include <stdio.h>
    #include <stdlib.h>

    int main(int argc, char **argv)
    {
      if (argc < 2) return 1;
      rapidcsv::Document doc(argv[1], rapidcsv::LabelParams(0, 0));
      return 0;
   //   if (!doc) {
//	return 1;
  //    } else {
//	printf("fine");
//	return 0;
  //    }
   //   std::vector<float> close = doc.GetRow<float>("2017-02-22");
     // std::cout << "Read " << close.size() << " values." << std::endl;

     // long long volume = doc.GetCell<long long>("Volume", "2017-02-22");
     // std::cout << "Volume " << volume << " on 2017-02-22." << std::endl;
    }
