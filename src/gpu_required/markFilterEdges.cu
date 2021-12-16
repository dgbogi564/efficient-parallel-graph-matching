/*
 **********************************************
 *  CS314 Principles of Programming Languages *
 *  Fall 2021                                 *
 **********************************************
 */
#include <stdio.h>
#include <stdlib.h>

__global__ void markFilterEdges_gpu(int * src, int * dst, int * matches, int * keepEdges, int numEdges) {
	/** YOUR CODE GOES BELOW **/
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;
    for(int edge = tid; edge < numEdges; edge += numThreads) {
        keepEdges[edge] = matches[src[edge]] < 0 && matches[dst[edge]] < 0;
    }
	/** YOUR CODE GOES ABOVE **/
}
