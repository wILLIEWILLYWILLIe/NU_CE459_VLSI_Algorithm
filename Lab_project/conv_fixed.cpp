#include "conv_fixed.h"

void conv_fixed (pixel_type input[9], pixel_type *output, pixel_type filter[9]){
    pixel_type temp[9];

    sum : for(int i = 0; i!=9; i++){
        temp[i] = filter[i] * input[i];
    }

    *output = temp[0]+temp[1]+temp[2]
            +temp[3]+temp[4]+temp[5]
            +temp[6]+temp[7]+temp[8];
}

