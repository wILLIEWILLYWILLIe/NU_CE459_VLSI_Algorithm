#ifndef MATRIX_MUL_H_
#define MATRIX_MUL_H_

#include <ac_fixed.h>

// 32-bit fixed-point: <W=32, I=18, signed, AC_RND_CONV, AC_WRAP>
typedef ac_fixed<32,18,true,AC_RND_CONV,AC_WRAP> fp_t;

const int MAT_DIM = 32;

// C = A * B, where each is 32x32
void matrix_mul(
    fp_t A[MAT_DIM][MAT_DIM],
    fp_t B[MAT_DIM][MAT_DIM],
    fp_t C[MAT_DIM][MAT_DIM]
);

#endif // MATRIX_MUL_H_
