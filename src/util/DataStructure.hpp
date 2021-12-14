/*
 **********************************************
 *  CS314 Principles of Programming Languages *
 *  Fall 2021                                 *
 **********************************************
 */
#ifndef DATASTRUCTURE_H
#define DATASTRUCTURE_H

typedef struct GraphData
{
    int numNodes;
    int numEdges;
    int *src;
    int *dst;
    int *weight;
} GraphData;

#endif
