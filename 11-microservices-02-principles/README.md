# Домашнее задание к занятию «Микросервисы: принципы»

Вы работаете в крупной компании, которая строит систему на основе микросервисной архитектуры.
Вам как DevOps-специалисту необходимо выдвинуть предложение по организации инфраструктуры для разработки и эксплуатации.

## Задача 1: API Gateway

Предложите решение для обеспечения реализации API Gateway. Составьте сравнительную таблицу возможностей различных программных решений. На основе таблицы сделайте выбор решения.

Решение должно соответствовать следующим требованиям:

- маршрутизация запросов к нужному сервису на основе конфигурации,
- возможность проверки аутентификационной информации в запросах,
- обеспечение терминации HTTPS.

Обоснуйте свой выбор.

---

### Решение

| Решение            | Маршрутизация | Аутентификация | Терминация HTTPS | Бесплатно/Открыто?                                               |
|--------------------|---------------|----------------|------------------|------------------------------------------------------------------|
| Kong Gateway       | +             | +              | +                | Бесплатно, Apache 2.0                                            |
| Tyk.io             | +             | +              | +                | Бесплатно, MPL                                                   |
| HAProxy            | +             | +              | +                | Бесплатно                                                        |
| Yandex API Gateway | +             | +              | +                | Платно                                                           |
| Azure API Gateway  | +             | +              | +                | Платно                                                           |
| Nginx              | +             | +              | +                | Бесплатно                                                        |
| KrakenD            | +             | +              | +                | Двойное лицензирование, нужные функции частично в платной версии |

Выбор конкретного решения зависит от нескольких факторов, на мой взгляд:
- Если мы выбираем облачные решение - допустим у нас инфрастуктура в целом находится и разворачивается в облаке, то логичнее выбирать облачные решения, допустим Yandex.
- Если мы говорим про bare metal вариации - то можно выбрать nginx / HAproxy. Поплуярные решения с большим сообществом и достаточной документацией.

## Задача 2: Брокер сообщений

Составьте таблицу возможностей различных брокеров сообщений. На основе таблицы сделайте обоснованный выбор решения.

Решение должно соответствовать следующим требованиям:

- поддержка кластеризации для обеспечения надёжности,
- хранение сообщений на диске в процессе доставки,
- высокая скорость работы,
- поддержка различных форматов сообщений,
- разделение прав доступа к различным потокам сообщений,
- простота эксплуатации.

Обоснуйте свой выбор.

---

### Решение

| Характеристика                                        | Kafka   | Redis    | RabbitMQ | ActiveMQ | NATS   |
|-------------------------------------------------------|---------|---------|----------|----------|---------|
| Поддержка кластеризации для обеспечения надежности    | +       | +       | +        | +        | +       |
| Хранение сообщений на диске в процессе доставки       | +       | -       | +        | +        | -       |
| Высокая скорость работы                               | Высокая | Высокая | Средняя  | Средняя  | Высокая |
| Поддержка различных форматов сообщений                | +       | +       | +        | +        | +       |
| Разделение прав доступа к различным потокам сообщений | +       | +       | +        | +        | +       |
| Простота эксплуатации                                 | +       | +       | +        | +        | +       |

`Apache Kafka` обеспечивает высокую скорость работы, поддерживает различные форматы сообщений, обеспечивает разделение прав доступа к различным потокам сообщений и поддерживает хранение сообщений на диске в процессе доставки. Однако, стоит отметить, что Kafka может быть сложнее в эксплуатации по сравнению с некоторыми другими брокерами сообщений.
`RabbitMQ` — давно известный, популярный брокер со множеством функций и возможностей, поддерживающих сложную маршрутизацию. Он способен обеспечивать такую маршрутизацию сообщений при незначительном трафике (несколько десятков тысяч сообщений в секунду).

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---