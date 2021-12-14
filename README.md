# Efficient Parallel Graph Matching

---

### Brainstorming

#### [onewaywrapper.cu](src/onewaywrapper.cu)

1. Allocate GPU memory, and copy from CPU to GPU as appropriate.
2. Free GPU arrays.

#### [check_handshaking.cu](src/gpu_required/check_handshaking.cu) 

1. Thread id equal blockDim.x * blockIdx.x + threadIdx.x
   - We're given a 1-D grid and 1-D blocks.

2. Account for uneven thread to node count.
   - If there are more threads than nodes:
     - Check if the thread's id is less than the number of nodes.
   - If there are fewer threads than nodes:
     - Create a for loop:
       - Starting index equals the thread's id.
       - Increment the index by blockDim.x * gridDim.x.
         - blockDim.x * gridDim.x = the number of total threads.
       - Continue loop if the index is less than the number of nodes.
     - Wouldn't for loop handle both cases? YES!

3. Find the strongest neighbors.
   - Inside for loop:
     - Nodes that don't have strong neighbors are set to the UNMATCHED indicator.
     - If the nodes aren't already set:
       - nodes that are strong neighbors are set to their strongest neighbor.
     - A pair of nodes are strong neighbors if:
       - The strongestNeighbor of both nodes match each other.


#### [exclusive_prefix_sum.cu](src/gpu_required/exclusive_prefix_sum.cu)

#### [markFilterEdges.cu](src/gpu_required/markFilterEdges.cu)

---

### GPU iLab Servers
```
ilab1.cs.rutgers.edu
ilab2.cs.rutgers.edu
ilab3.cs.rutgers.edu
ilab4.cs.rutgers.edu
```

---

### Warnings

**DO NOT** change any files except:
- [onewaywrapper.cu](src/onewaywrapper.cu)
- the files in the directory [gpu_required ](src/gpu_required)
- the files in the directory [gpu_extra_credit](src/gpu_extra_credit)

No other code files will be considered when we grade your submission.
