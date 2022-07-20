
#Ubuntu
file=emp.tar.gz
file_extracted=emp.sql

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
if /usr/bin/mysql -u root -p < $file_extracted
then
    echo "Все готово! Переходьте в MySQL Workbench й перевіряйте"
else
    echo "Спробуйте ще раз. Ви пароль вірно ввели від MySQL сервера?!"
exit 1
fi

