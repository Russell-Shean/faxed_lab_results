# Some R packages require additional external dependencies when installing on linux
# I'm not going to write a script to install dependencies for whatever mystery linux distribution
# You might be using :D , but I will provide a warning that provides a hint about how to install
# any missing dependencies you may need

if(Sys.info()['sysname'] == "Linux"){
  warning("It looks like you're running on Linux. 
          Some R packages require additional external dependencies when installing on linux. 
          As a result some of the R package installations in the R/config/packages.R may have failed.
          Check the error messages for missing dependencies and install them from the terminal 
          using sudo apt-get PACKAGE NAME or a similiar command. Google may also help if this warning doesn't :D")
}
