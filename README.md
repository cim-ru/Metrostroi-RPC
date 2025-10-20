# Привет!
Это RPC для мода Metrostroi в Garry's Mod! 

RPC выполняет функции показа процесса игры: на каком составе вы едете, какой у вас маршрут, и где вы находитесь!
Работает **в одиночке и на вашем выделенном сервере**. Работоспособность будем дорабатывать.
> [!NOTE]
>RPC **совместим** с Metrostroi Extentions Library

> [!IMPORTANT] 
># Куда устанавливать файлы?
>Основной скрипт RPC ***"main.py"*** установите в папку C:\(ваша папка или путь). 
>
>Скрипт RPC для Garry's Mod ***"discord_rpc_client.lua"*** установите по пути "(путь до Steam)\GarrysMod\garrysmod\lua\autorun\client\".

> [!NOTE]
># Как запустить?
>Через комбинацию win+r открываем командную строку (пишем cmd), и вводим команды: 
>
>***"cd C:\(путь до файла)"*** и ***"python main.py"***

> [!TIP]
># Гайд по установке компонентов и запуску PRC: [https://www.youtube.com/watch?v=bmhTqA4F1AM](https://www.youtube.com/watch?v=32FWzQyKvxA)

> [!IMPORTANT]
> # Необходимые компоненты:
> **Node.js** https://nodejs.org/download
>
> **Python 3.8+** *(скачать можно с python.org/downloads)*
>
> При установке не забудьте ***отметить галочку “Add to PATH”. ***
>
> **Аддон Metrostroi Scoreboard PRO** (https://steamcommunity.com/sharedfiles/filedetails/?id=1910844812)
> 
>Не забудьте ***установить зависимости,*** открыть командую строку и выполнить: **"pip install pypresence flask requests colorama"**
>### И не забудьте установить локальный тоннель! В командой строке выполняем: **npm i -g localtunnel**

>[!WARNING]
># ВНИМАНИЕ!
>Для корректной работы тоннеля для передачи данных из Metrostroi необходимо:
>
>В файле ***main.py*** в строке 37 **изменить** metrostroi123 на любое **СВОЁ** значение (например, metrostroirpc111)
>
>В файле ***discord_rpc_client.lua***  строке 8 local SERVER_PUBLIC_URL = "https://metrostroi123.loca.lt/rpc" изменить metrostroi123 на любое **СВОЁ** значение, которое вписывали в ***main.py***!

> [!CAUTION]
># Рекомендации в целях безопасности:
>В файле ***main.py*** в строке 38 SECRET = os.environ.get("RPC_SECRET", "super_secret_key_228") и ***discord_rpc_client.lua*** в строке 9 local RPC_SECRET = "super_secret_key_228" измените пароль (super_secret_key_228) на **СВОЙ**, он должен везде **совпадать**!

> [!NOTE]
>**Все редактирования кода я рекомендую выполнять в Visual Studio Code https://code.visualstudio.com/**

>[!WARNING]
>**По всем багам пишите в** https://github.com/cim-ru/Metrostroi-RPC/issues
>
>***По всем вопросам и предложениям пишите в*** https://github.com/cim-ru/Metrostroi-RPC/discussions

# Спасибо! ❤

Большую помощь оказал мне  **[Prizmaa](https://github.com/prizmaa)**, спасибо ему большое! ❤

Кто хочет оставить копеечку автору:

https://www.donationalerts.com/r/cim556
