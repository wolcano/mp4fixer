@echo off
rem compiled modified cmd.py into exe in a conda environment
rem uses python 3.7, assumes you have git and sed available
rem conda create python=3.7 pyinstaller --yes --prefix aacrepair

rem assume we are in the conda env folder
rem add pyinstaller to conda environment
rem conda install pyinstaller

rem get the code for aacRepair
git clone https://github.com/44xtc44/aacRepair.git

rem aacrepair is an external package
pip install aacrepair

rem enter the git repo subfolder
pushd aacRepair
	rem modify cmd.py so it automatically runs fixing the file passed as first argument
	sed -i -e "s,menu_main(),repair_write_one_file(sys.argv[1])," aacrepair\cmd.py
	pushd aacrepair
		pyinstaller --onefile cmd.py
	popd

	rem fetch the built binary
	copy aacrepair\dist\cmd.exe aacrepair_cmd.exe
popd
