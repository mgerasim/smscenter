hg add
hg remove -A
hg commit -m "deploy"
hg push -f
echo "Изменение отправлены в репозиторий..."
pause
cd D:\kirill\Projects\
hg pull
hg update
cd SMScenterMVC\CR
echo "Каталог главного репозитория обновлен..."
pause
cr.exe db DEVELOPMENT
cr.exe migrate
cr.exe compile
echo "Изменения в БД внесены..."
pause
cd ..
cd ..
build_debug.bat
cd SMScenterMVC\CR
cr.exe db DEVELOPMENT
cd ..
cd ..
hg commit -m "SMSCENTER_DEBUG"
hg push
