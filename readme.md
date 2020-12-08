# Drill4J example integration with Report Portal UI service

## Jobs в Jenkins

- Запуск РП сервисов - stage-start-rp-with-js-agent

- Остановка РП сервисов - stage-stop-rp-5

## Сетап

0. Открываем Jenkins, STAGE

1. Запускаем сервисы Drill с job stage-renew-admin

2. Дождаться старта, проверить, что Admin UI открывается

3. Запускаем сервисы РП stage-start-rp-with-js-agent

4. Дождаться появления сервис группы "test", в ней должно быть 2 агента: `rp-service-ui`, `rp-api`

5. **Отдельно** регистрируем `rp-service-ui` и `rp-api`

6. Регистрация `rp-api`: устанавливаем **Project packages** в:

    ```shell
      com/epam/ta/reportportal
    ```

7. Регистрация `rp-service-ui`: в поле **target host** устанавливаем protocol://host:port на котором запущен UI

**Важно**: вводить target host без path (например, не `http://ecse005009ba.epam.com:8080/ui/#login` а `http://ecse005009ba.epam.com:8080` )

>Tip: чтобы узнать адрес можно открыть portainer, найти rp-5-gateway, посмотреть в колонку **Published Ports**, и кликнуть на `8080:8080`. Откроется нужный адрес

## Установка extension и сбор coverage

1. Установить распакованный extension

2. Открыть попап, увидеть ошибку, перейти в **Widget Settings**

3. Ввести Admin API URL

    >Tip: важно указать протокол https и порт 8443, например: `https://ecse005009ba.epam.com:8443`

4. После установки API URL подождать пока в popup на странице Report Portal не появится агент

5. Когда агент появится - перезагрузить страницу приложения Report Portal

6. Можно открыть попап, нажать Open Widget и приступать к тестированию

    >Tip: ReportPortal: логин: **superadmin**, пароль: **erebus**

## Original readme

[![Build Status](https://semaphoreci.com/api/v1/lexecon/rp_service-ui/branches/develop/badge.svg)](http://reportportal.io/service-ui/index.html)

1. Install nodejs (minimum required version 10)

2. Open console from the project root

3. Run the command `cd app`

4. Run the command `npm install`

5. Create file `.env` in `app` folder

    ```shell
    PROXY_PATH='' // http://you_server:port/
    ```

6. Run command `npm run dev`

7. Open `http://localhost:3000/` in browser
