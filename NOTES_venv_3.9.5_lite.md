# Create Python VENV
Y. Lu \
v2023-1106 Trimmed for cmichack

(assuming the current path is the home directory, i.e. /home/user_name) 

This script will setup python-3.9.5, torch 1.9.1, and cuda 11.1.


## LOAD PATH and LIBRARIES
~~~
export PATH=/share/apps/python-3.9.5-shared/bin:${PATH}
export LD_LIBRARY_PATH=/share/apps/python-3.9.5-shared/lib:${LD_LIBRARY_PATH}
~~~

Run the following to check if the correct python3 binary is loaded:

~~~
which python3
~~~

The output should be the same as the path we exported above \
(i.e. /share/apps/python-3.9.5-shared/bin/python3)

## Setup virtual environement
The <b>system-site-package</b> option gives the virtual environment [Nobiko] \
access to the libraries in the <b>LD_LIBRARY_PATH</b> \
[PYVE/Nobiko] is the customisable path to the venv. The absolute path is: <b>/home/user_name/PYVE/Nobiko</b>\
The last portion is the venv name, i.e. Nobiko.


~~~
python3 -m venv PYVE/Nobiko --system-site-packages
~~~

> **INFO**
> The venv will be in /home/user_name/PYVE/Nobiko/ \
> The total size will be in the range of 10 - 20 MBs. 

## To Activate /Deactivate
~~~
source PYVE/Nobiko/bin/activate
deactivate
~~~

## (venv activated) To check available packages
~~~
pip list
~~~

## (venv activated) To install using pip
This goes into the venv

~~~
pip install some_package_not_availeble_through_LD_LIBRARY_PATH=X.X.X
~~~


<!-- > **Warning**
> Only use the option below when absolutely necessary

This function forces pip to ingore the system package already installed and get a local one.
~~~
pip install numpy==X.X.X --ignore-installed
~~~ -->


## To use in a SGE script
~~~
#$ SGE config flags

# Load binaries and libraries
export PATH=/share/apps/python-3.9.5-shared/bin:${PATH}
export LD_LIBRARY_PATH=/share/apps/python-3.9.5-shared/lib:${LD_LIBRARY_PATH}
source /home/user_name/PYVE/Nobiko/bin/activate

# Execution
python3 path_to_script/dumb_neural_network_v_final_final.py
~~~
