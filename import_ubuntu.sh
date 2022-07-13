
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
echo ----------------------------------------------------------------
if /usr/bin/mysql -u root -p < $file_extracted
then
    echo "All done!"
else
    echo "Спробуйте ще раз. Ви пароль вірно ввели від MySQL сервера?!"
exit 1
fi

