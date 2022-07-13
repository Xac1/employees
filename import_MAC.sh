
#MacOS
file=emp.tar.gz
file_extracted=emp.sql

cd ~/Downloads
if [[ ! -a $file ]]
then
    curl -LJO https://github.com/Xac1/employees/raw/main/$file
fi

if [[ ! -a $file_extracted ]]
then
    tar zxfv $file
fi

if /usr/local/mysql/bin/mysql -u root -p < $file_extracted
then
    echo "All done!"
else
    echo "Command failed, try gain! Wrong password to your MySQL Server?!"
exit 1
fi


#cd ~/Downloads/
#git clone https://github.com/Xac1/employees 
#sudo tar zxfv emp.tar.gz && sudo /usr/local/mysql/bin/mysql -u root -p < emp.sql
