# Metrostroi-rpc
Куда класть файлы?
Файл main.py кладём в папку C:\metrostroi_rpc (или другую, как захотите)

Файл discord_rpc_client.lua кладём в папку GarrysMod/garrysmod/lua/autorun/client/

Как запускать?
Всё очень просто! Заходим в командую строку и пишем:

cd C:\ПАПКА_В_КОТОРУЮ_ВЫ_ПОЛОЖИЛИ_ФАЙЛ
python main.py
Вот и всё!

Необходимые компоненты:
Python 3.8+
Скачать с python.org/downloads

При установке отметить галочку “Add to PATH”

Установить зависимости
Открыть командую строку и выполнить:

pip install pypresence flask requests colorama

ВНИМАНИЕ!!!
Для корректной работы тоннеля для передачи данных из мс вам нужно:

В файле main.py
В строке 37 SUBDOMAIN = os.environ.get("RPC_SUBDOMAIN", "metrostroi123")
Поменять metrostroi123 на любое своё значение (например, metrostroirpc111)

В файле discord_rpc_client.lua
В строке 8 local SERVER_PUBLIC_URL = "https://metrostroi123.loca.lt/rpc"
Поменять metrostroi123 на любое своё значение, которое вписывали в main.py!!!

Также я вам рекомендую в целях безопасности и стабильности работы

В файле main.py в строке 38 SECRET = os.environ.get("RPC_SECRET", "super_secret_key_228")
И в файле discord_rpc_client.lua в строке 9 local RPC_SECRET = "super_secret_key_228"
Поменять пароль на свой и он должен везде совпадать!
С MEL всё работает не переживайте (и без него тоже)

Большую помощь оказал мне [Призма]([URL](https://github.com/prizmaa)) Спасибо ему большое!❤

Кто хочет оставить копеечку автору https://www.donationalerts.com/r/cim556
