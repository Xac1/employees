
#Windows
$file = "emp.zip"
$file_extracted = "emp.sql"

cd ~/Downloads
if (-not(Test-Path -Path $file -PathType Leaf))
       {
    powershell -command "& { iwr https://github.com/Xac1/employees/raw/main/emp.zip -OutFile $file }"
} 

if (-not(Test-Path -Path $file_extracted -PathType Leaf))
    { 
    Expand-Archive -Path emp.zip -DestinationPath . -Verbose
}


echo ----------------------------------------------------------------
echo "Введіть пароль, який ви вказали при встановленні MySQL сервера"
echo "й натисніть Enter"
echo "Після вводу чекайте декілька хвилин, поки пройде імпорт"
echo ----------------------------------------------------------------

& 'C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe' -u root -p -e "source emp.sql"

