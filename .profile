# check if RPM/YUM are installed
if [ -d "/QOpenSys/pkgs/bin" ] ; then
    # add RPM/YUM packages directory to PATH
    PATH=/QOpenSys/pkgs/bin:$PATH
    export PATH

    # enter BASH terminal via pkgs directory
    exec /QOpenSys/pkgs/bin/bash
else
    echo "Run the SQL at the following URL to install BASH/RPM/YUM"
    echo "ftp://public.dhe.ibm.com/software/ibmi/products/pase/rpms/README.md"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    export PATH
fi
