# Работа с API TimeWeb

## Для начала работы с API:
1. Создаём коррекнтый __.env__ файл;
2. Указывем в нём наш домен вместо __XXX__, APIkey вместо __XXXXX__, IP адрес вместо __X.X.X.X__ (можно заменить переменные на $2 и $3, чтобы вводить их командой при выполнении скрипта, если они различны, чтобы каждый раз не менять .env).

### Создание поддомена
1. Запустить скрипт subdom_make.sh с переменной __subdomain__, например:
```sh
bash subdom_make.sh testsubdom
```
Будет создан поддомен testsubdom.XXX с добавлением A DNS записи с IP X.X.X.X.

### Удаление поддомена
1. Запустить скрипт subdom_del.sh с переменной __версия площадки__, выполнив:
```sh
bash subdom_del.sh testsubdom
```
Будет удалён поддомен testsubdom.XXX со всеми DNS записями.


<h3 align="right"><b><a  href="https://github.com/nikitazykov">®By nikitazykov</a></b></h3>