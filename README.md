# Привет!
Это RPC для мода Metrostroi в Garry's Mod! 
RPC выполняет функции показа процесса игры: на каком составе вы едете, какой у вас маршрут, и где вы находитесь! 
RPC **совместим** с Metrostroi Extentions Library

# Куда устанавливать файлы?
Основной скрипт RPC ***"main.py"*** установите в папку C:\(ваша папка или путь). 
Скрипт RPC для Garry's Mod ***"discord_rpc_client.lua"*** установите по пути "(путь до Steam)\GarrysMod\garrysmod\lua\autorun\client\".

# Как запустить?
Через комбинацию win+r открываем командную строку, и вводим команды: 
***"cd C:\(путь до файла)"*** и ***"python main.py"***

# Необходимые компоненты:
Python 3.8+ *(скачать можно с python.org/downloads)*
При установке не забудьте отметить галочку “Add to PATH”. 
Не забудьте установить зависимости, открыть командую строку и выполнить: "pip install pypresence flask requests colorama"

# ВНИМАНИЕ!
Для корректной работы тоннеля для передачи данных из Metrostroi необходимо:
В файле ***main.py*** в строке 37 **изменить** metrostroi123 на любое **СВОЁ** значение (например, metrostroirpc111)
В файле ***discord_rpc_client.lua***  строке 8 local SERVER_PUBLIC_URL = "https://metrostroi123.loca.lt/rpc" изменить metrostroi123 на любое **СВОЁ** значение, которое вписывали в ***main.py***!

# Рекомендации в целях безопасности:
В файле ***main.py*** в строке 38 SECRET = os.environ.get("RPC_SECRET", "super_secret_key_228") и ***discord_rpc_client.lua*** в строке 9 local RPC_SECRET = "super_secret_key_228" измените пароль на **СВОЙ**, он должен везде **совпадать**!

# Спасибо! ❤
Большую помощь оказал мне [Prizmaa]([URL](https://github.com/prizmaa)), спасибо ему большое! ❤

Кто хочет оставить копеечку автору:
https://www.donationalerts.com/r/cim556
