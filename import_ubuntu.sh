
#Ubuntu
file=emp.tar.gz
file_unzipped=emp.sql

if [[ ! -a $file ]]
then
    wget https://github.com/Xac1/employees/raw/main/$file
fi

if [[ ! -a $file_unzipped ]]
then
    tar zxfv $file
fi

if /usr/bin/mysql -u root -p < $file_unzipped
then
    echo "All done!"
else
    echo "Command failed, try gain! Wrong password to your MySQL Server?!"    
exit 1
fi

