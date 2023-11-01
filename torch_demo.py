#!/usr/bin/env python3
"""
Y.Lu 
Copied from Nobiko/Mikeneko.py

Modified for cmichack 
"""

import torch

def get_compute_device():
    # setting device on GPU if available, else CPU
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    if device.type == 'cuda':
        gpu_memory = round(torch.cuda.get_device_properties(0).total_memory/1024**3, 1)
        print('Running on GPU. Memory: [ {:.1f} GB]\n'.format(gpu_memory), flush=True)
    else:
        print('Running on CPU. Check submission script flags.', flush=True)

    return device

if __name__ == '__main__':
    device=get_compute_device()