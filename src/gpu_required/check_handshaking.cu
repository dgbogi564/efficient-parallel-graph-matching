/*
 **********************************************
 *  CS314 Principles of Programming Languages *
 *  Fall 2021                                 *
 **********************************************
 */
#include <stdio.h>
#include <stdlib.h>

__global__ void check_handshaking_gpu(int * strongNeighbor, int * matches, int numNodes) {
	/** YOUR CODE GOES BELOW **/
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;
    for(int node = tid; node < numNodes; node += numThreads) {
        int strongestNeighbor = strongNeighbor[node];
        if(strongestNeighbor < 0 || matches[node] >= 0) continue;
        if(strongNeighbor[strongestNeighbor] == node) {
            matches[node] = strongestNeighbor;
            matches[strongestNeighbor] = node;
        }
    }
	/** YOUR CODE GOES ABOVE **/
}
