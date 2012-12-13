hg add
hg remove -A
hg commit -m "deploy"
hg pull
hg update --check
hg push -f
echo "Изменение отправлены в репозиторий..."
pause
cd D:\Projects\
hg commit -m "deploy"
hg pull
hg update --check
cd SMScenterMVC\CR
echo "Каталог главного репозитория обновлен..."
pause
cr.exe db PRODACTION
cr.exe migrate
cr.exe compile
hg commit -m "deploy"
echo "Изменения в БД внесены..."
pause
cd ..
cd ..
build.bat
