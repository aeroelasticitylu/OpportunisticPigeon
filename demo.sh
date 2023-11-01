#!/bin/bash

#$ -N cmichack
#$ -wd /home/dummy_user/cmichack
# change to your real user name and path

#$ -l h_rt=0:29:00
# Runtime in hours:min:sec
# Minimise this to reduce queuing time

####################################################### DO NOT MODIFY BELOW THIS LINE #######################################################################
#$ -S /bin/bash
#$ -j y
#$ -l gpu=true
#$ -l gpu_type=a6000
#$ -l tmem=48G
####################################################### DO NOT MODIFY ABOVE THIS LINE #######################################################################

# load libraries - through - python virtual environment
export PATH=/share/apps/python-3.9.5-shared/bin:${PATH}
export LD_LIBRARY_PATH=/share/apps/python-3.9.5-shared/lib:${LD_LIBRARY_PATH}
source /home/dummy_user/PYVE/venv_name/bin/activate


# run the python script
python3 /home/dummy_user/cmichack/torch_demo.py


