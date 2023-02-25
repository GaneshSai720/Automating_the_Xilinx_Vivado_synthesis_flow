# Automating_the_Xilinx_Vivado_synthesis_flow
Before running this framework we have to install all the requirements.
Requirements:
1. Linux OS 
2. Xilinx Vivado 2018.1 or later
3. Python 3 or later

After the basic requirements are installed it is advised to download the Jupyter lab environment with some of the useful libraries: numpy,pandas,matplotlib,datetime,time into your system. You can install previous mentioned libraries with pip install commands.

Defining the folders present in the system or code:
1. Modules -> All of the verilog(.v) and system verilog(.sv) files which are intended to implement and synthesize.  
2. Automation -> This is the project folder contains of Test.xpr we have created with the automated framework where each .v and .sv there in Modules folder will be added to Test.xpr file. 
3. Impl -> All results will be stored in this folder in which there will be sub folders named with the modules we have runned. Opening these sub folders we can see power.txt, timing.txt, utilization.txt.

User Interface:

If you haven't add .v and .sv files into the project folder (Test.xpr) it would be better start running the code cells in order wise without jumping in between the cells.

1. After importing the libraries and checking what all present in the Modules folder. We have to make sure that all of the required .v and .sv files are there in the Modules folder. 

2. Then, User can run the cells which are present below the "Adding the .v files and .sv files" markdown. User need not to give input in this cells he can directly run these lines of code then the .v files and .sv files will be loaded into project folder.

3. Then, User can run the cells which are present below the "Running the synthesis and implementation" markdown. Here User will be asked to delete the previous existed Impl folder (If they already exists) where the txt files will be stored in respective sub folders. If response of user is "y" then new Impl folder will be created after deleting all of these previously existing files. In the new Impl folder the data(txt files) will be stored.
  
If there is no Impl folder previously existed then it will create the new Impl folder and store the required txt files

4. Then, User can run the cells which are present below the "Formatting the data and storing the data we want into .csv file" markdown. While running the below code lines the user will be asked to replace the previous results.csv file if it is already present. If it is not present it will create new csv file and store the formatted data.

Tips:
1. We can start running the cells which are present below the "Adding the .v files and .sv files" markdown. If the files were already added before hand into the project file. But, don't forget to import the libraries.
2. We can see the errors or what is happening in the the vivado in the runme.log file present in the project(Automation) folder, with the suffix named as .runs folder. Opening .runs suffix folder we can see impl_1 and synth_1 opening them we can search runme.log file.
