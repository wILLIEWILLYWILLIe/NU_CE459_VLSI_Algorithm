#include "matmul.h"

#pragma hls_design top
void matrix_mul(
    fp_t A[MAT_DIM][MAT_DIM],
    fp_t B[MAT_DIM][MAT_DIM],
    fp_t C[MAT_DIM][MAT_DIM]
) {
  // C[i][j] = sum_{k=0..31} A[i][k] * B[k][j]
  for (int i = 0; i < MAT_DIM; ++i) {
    for (int j = 0; j < MAT_DIM; ++j) {

      fp_t sum = 0;  

      for (int k = 0; k < MAT_DIM; ++k) {
        sum += A[i][k] * B[k][j];
      }

      C[i][j] = sum;
    }
  }
}
