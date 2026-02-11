#ifndef CONV_FIXED_H
#define CONV_FIXED_H

#include <ac_fixed.h>

// Define pixel_type using ac_fixed
// W=16 (total width), I=8 (integer bits), S=true (signed)
typedef ac_fixed<16, 8, true> pixel_type;

void conv_fixed (pixel_type input[9], pixel_type *output, pixel_type filter[9]);

#endif

