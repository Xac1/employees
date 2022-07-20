
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
echo ----------------------------------------------------------------
echo "Введіть пароль, який ви вказали при встановленні MySQL сервера"
echo "й натисніть Enter"
echo "Після вводу чекайте декілька хвилин, поки пройде імпорт бази"
echo ----------------------------------------------------------------
if /usr/local/mysql/bin/mysql -u root -p < $file_extracted
then
    echo "Все готово! Переходьте в MySQL Workbench й перевіряйте"
else
    echo "Command failed, try gain! Wrong password to your MySQL Server?!"
exit 1
fi


#cd ~/Downloads/
#git clone https://github.com/Xac1/employees 
#sudo tar zxfv emp.tar.gz && sudo /usr/local/mysql/bin/mysql -u root -p < emp.sql
