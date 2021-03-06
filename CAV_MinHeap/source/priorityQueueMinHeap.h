#include <limits>
#include <vector>
#include <algorithm>

#define STORAGE_SIZE 200

typedef struct QueueData{
	int priority;
	int data;
} QueueData;

void queue(bool isPush, QueueData inData, QueueData *outData);
bool runQueue();
