#include "device_launch_parameters.h"
#include <iostream>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    for(int i = 0; i < deviceCount; ++i) {
        cudaDeviceProp devProp;

        cudaGetDeviceProperties(&devProp, i);
        std::cout << "using GPU device" << i << ":" << devProp.name << std::endl;
        std::cout << "设备全局内存总量:   " << devProp.totalGlobalMem / 1024 / 1024 << "MB" << std::endl;
        std::cout << "SM的数量:" << devProp.multiProcessorCount << std::endl;
        std::cout << "每个线程块的共享内存大小: " << devProp.sharedMemPerBlock / 1024.0 << "KB" << std::endl;
        std::cout << "每个线程块的最大线程数：" << devProp.maxThreadPerBlock << std::endl;
        std::cout << "设备上一个线程块（Block）中可用的32位寄存器的数量: " << devProp.regsPerBlock << std::endl;
        std::cout << "每个EM的最大线程数： " << devProp.maxThreadPerMultiProcessor << std::endl;
        std::cout << "每个EM的最大线程束数： " << devProp.maxThreadPerMultiProcessor / 32 << std::endl;
        std::cout << "设备上多处理器的数量： " << devProp.multiProcessorCount << std::endl;

    }
    return 0;
}