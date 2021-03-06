### Private Comparison Script ###
### Sumeet Kumar Sinha, November, 2017 ##

### remove the log files
rm -rf *.log
python compare_HDF5_ALL.py Original_SFS_Surface_Load.feioutput Soil_Foundation_System_Surface_Load.h5.feioutput
python compare_HDF5_ALL.py Original_SFS_Consolidation.feioutput Soil_Foundation_System_Consolidation.h5.feioutput

printf "generating plots"
python Plot_Current.py 2> /dev/null
python Plot_Original.py 2> /dev/null
printf " ------------------------ completed !\n"
