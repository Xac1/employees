
file=emp.tar.gz
file_unzipped=emp.sql

cd ~/Downloads
if [[ ! -a $file ]]
then
    wget https://github.com/Xac1/employees/raw/main/$file
fi

if [[ ! -a $file_unzipped ]]
then
    tar zxfv $file
fi

if /usr/local/mysql/bin/mysql -u root -p < $file_unzipped
then
    echo "All done!"
else
    echo "Command failed, try gain! Wrong password to your MySQL Server?!"
exit 1
fi


#MacOS
#cd ~/Downloads/
#git clone 
#sudo tar zxfv emp.tar.gz && sudo /usr/local/mysql/bin/mysql -u root -p < emp.sql
