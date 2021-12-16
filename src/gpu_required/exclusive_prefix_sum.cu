/*
 **********************************************
 *  CS314 Principles of Programming Languages *
 *  Fall 2021                                 *
 **********************************************
 */
#include <stdio.h>
#include <stdlib.h>
#include <utils.hpp>

__global__ void exclusive_prefix_sum_gpu(int * oldSum, int * newSum, int distance, int numElements) {
	/** YOUR CODE GOES BELOW **/
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;
    int x = 0;
    if(!distance) {
        for(int element = tid; element < numElements-1; element += numThreads) {
            newSum[element+1] = oldSum[element];
        }
        if(tid == 0) {
            oldSum[0] = 0;
            newSum[0] = 0;
        }
    } else {
        for(int element = tid; element < numElements; element += numThreads) {
            if(element < distance) newSum[element] = oldSum[element];
            else newSum[element] = oldSum[element-distance] + oldSum[element];
        }
    }
    /** YOUR CODE GOES ABOVE **/
}
