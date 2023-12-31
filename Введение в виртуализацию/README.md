## Домашнее задание "Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения"
_________________________________________________________
### Задача 1:
Опишите кратко, в чём основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.
_________________________________________________________

### Решение 1:
Основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС:

Полная (аппаратная) виртуализация:

    В полной виртуализации используется гипервизор, который создает виртуальные машины (ВМ) и изолирует их от физического оборудования.
    Гипервизор эмулирует аппаратные ресурсы, такие как процессор, память и диски, для каждой виртуальной машины.
    ВМ работают на уровне аппаратуры и не требуют модификации операционной системы гостя.


Паравиртуализация:

    В паравиртуализации также используется гипервизор, но операционные системы гостей модифицированы для взаимодействия с гипервизором.
    Гостевые операционные системы знают о своем виртуальном окружении и могут использовать специальные интерфейсы для взаимодействия с гипервизором.
    Паравиртуализация обеспечивает более эффективное использование ресурсов и более высокую производительность по сравнению с полной виртуализацией.


Виртуализация на основе ОС:

    Виртуализация на основе ОС, также известная как контейнерная виртуализация, использует операционную систему хоста для создания и управления контейнерами.
    Контейнеры являются изолированными средами, в которых запускаются приложения.
    Контейнеры используют общую операционную систему хоста и не требуют эмуляции аппаратных ресурсов.
    Виртуализация на основе ОС обеспечивает высокую плотность размещения приложений и быстрое развертывание контейнеров.


_________________________________________________________
### Задача 2:

Выберите один из вариантов использования организации физических серверов в зависимости от условий использования.

Организация серверов:

    физические сервера,
    паравиртуализация,
    виртуализация уровня ОС.

Условия использования:

    высоконагруженная база данных, чувствительная к отказу;
    различные web-приложения;
    Windows-системы для использования бухгалтерским отделом;
    системы, выполняющие высокопроизводительные расчёты на GPU.

Опишите, почему вы выбрали к каждому целевому использованию такую организацию.
_________________________________________________________


### Решение 2:

Высоконагруженная база данных, чувствительная к отказу:

Для высоконагруженной базы данных, которая является чувствительной к отказу, рекомендуется использовать физические сервера. Это связано с тем, что физические сервера обеспечивают высокую производительность и низкую задержку доступа к данным. Кроме того, физические сервера обеспечивают большую стабильность и надежность, что критически важно для баз данных, которые не могут себе позволить простои или потерю данных. 
Но также возможно использовать паравиртуализированную инфраструктуру обеспечивающаю преимущества виртуализации такие как: кластеризация, живая миграция и так далее.

Различные web-приложения:

Для различных web-приложений можно использовать виртуализацию уровня ОС или паравиртуализацию. Оба варианта обеспечивают изоляцию и безопасность между приложениями, а также позволяют эффективно использовать ресурсы сервера. Однако, если требуется более высокая степень изоляции и независимости между приложениями, то рекомендуется использовать паравиртуализацию. Если же важнее обеспечить более высокую плотность размещения приложений и экономию ресурсов, то можно выбрать виртуализацию уровня ОС.

Windows-системы для использования бухгалтерским отделом:

Для Windows-систем, которые будут использоваться бухгалтерским отделом, рекомендуется использовать виртуализацию уровня ОС. Виртуализация уровня ОС позволяет запускать несколько экземпляров операционной системы на одном физическом сервере, что обеспечивает изоляцию и безопасность между системами. Кроме того, виртуализация уровня ОС обеспечивает хорошую производительность и удобство управления Windows-системами. 
Но в реальных кейсах на практике чаще встречалась паравиртуализация с можностью живой миграции, бекапированием и так далее.

Системы, выполняющие высокопроизводительные расчёты на GPU:

Для систем, выполняющих высокопроизводительные расчеты на GPU, рекомендуется использовать физические сервера. Физические сервера обеспечивают прямой доступ к аппаратным ресурсам, включая GPU, что позволяет достичь максимальной производительности при выполнении вычислений. 
Хотя есть живой кейс внедрения (делали сами руками) vGPU на платформе виртуализации zVirt + протокол доставки тяжелой графики LoudPlay.

_________________________________________________________
### Задача 3

Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

Сценарии:

    100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based-инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
    Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
    Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.
    Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

_________________________________________________________

### Решение 3:

Сценарий 1: 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований.

Для данного сценария рекомендуется использовать гипервизор VMware vSphere. VMware vSphere является одним из наиболее популярных и широко используемых решений для виртуализации. Он обеспечивает высокую производительность, надежность и масштабируемость, а также поддерживает как Linux, так и Windows виртуальные машины. VMware vSphere также предоставляет широкий набор функций, включая программные балансировщики нагрузки, репликацию данных и автоматизированный механизм создания резервных копий.

Сценарий 2: Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.

Для данного сценария рекомендуется использовать гипервизор KVM (Kernel-based Virtual Machine). KVM является частью ядра Linux и предоставляет высокую производительность и надежность. Он также является бесплатным и open source-решением. KVM поддерживает как Linux, так и Windows виртуальные машины и обеспечивает возможность эффективного использования ресурсов сервера.

Сценарий 3: Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.

Для данного сценария рекомендуется использовать гипервизор Microsoft Hyper-V. Hyper-V является бесплатным гипервизором, предоставляемым Microsoft, и предназначен для виртуализации Windows-инфраструктуры. Он обеспечивает высокую производительность и совместимость с Windows-средой. Hyper-V также предоставляет широкий набор функций и инструментов для управления виртуальными машинами и обеспечения безопасности.

Сценарий 4: Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

Для данного сценария рекомендуется использовать гипервизор VirtualBox. VirtualBox является бесплатным и многофункциональным гипервизором, который поддерживает различные операционные системы, включая различные дистрибутивы Linux. Он обеспечивает возможность создания и управления виртуальными машинами на разных операционных системах, что позволяет легко настроить тестовое окружение для программного продукта на разных дистрибутивах Linux.

_________________________________________________________

### Задание 4:
Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.

_________________________________________________________
### Решение 4: 
Гетерогенная среда виртуализации, то есть использование нескольких систем управления виртуализацией одновременно, может иметь следующие проблемы и недостатки:

    Сложность управления: Управление гетерогенной средой требует знания и опыта работы с разными системами виртуализации. Каждая система имеет свои собственные интерфейсы, команды и методы управления, что может привести к сложностям при настройке, мониторинге и управлении виртуальными машинами.

    Необходимость обучения персонала: Работа в гетерогенной среде требует обучения персонала на разных системах виртуализации. Это может потребовать времени и ресурсов для освоения различных интерфейсов и методов работы с каждой системой.

    Совместимость и интеграция: Различные системы виртуализации могут иметь разные стандарты и протоколы, что может затруднить совместимость и интеграцию между ними. Например, возможны проблемы с перемещением виртуальных машин между разными системами или обменом данными между ними.

    Увеличение сложности отказоустойчивости: В гетерогенной среде может быть сложнее обеспечить высокую отказоустойчивость. Различные системы требуют отдельной настройки и конфигурации для обеспечения резервирования и восстановления данных.

    Увеличение расходов на оборудование и лицензии: Каждая система виртуализации может требовать свое собственное оборудование и лицензии. В гетерогенной среде это может привести к увеличению расходов на оборудование и лицензии, поскольку требуется поддержка нескольких систем.


Для минимизации рисков и проблем гетерогенной среды виртуализации можно предпринять следующие шаги:

    Стандартизация и автоматизация: Важно установить стандарты для конфигурации и управления виртуальными машинами в разных системах. Также полезно использовать автоматизацию для упрощения настройки и управления.

    Централизованное управление: Использование централизованного инструмента управления, такого как система управления виртуализацией (VMM) или оркестратор, может помочь упростить управление и мониторинг гетерогенной среды.

    Обучение и сертификация персонала: Обеспечение обучения и сертификации персонала по разным системам виртуализации может помочь повысить их компетенцию и уверенность в работе с гетерогенной средой.

    Выбор совместимых и интегрированных решений: При выборе систем виртуализации стоит обратить внимание на их совместимость и возможность интеграции с другими системами. Это поможет упростить обмен данными и взаимодействие между разными системами.


Относительно создания гетерогенной среды виртуализации, выбор зависит от конкретных потребностей и ограничений организации. В некоторых случаях гетерогенная среда может быть неизбежной, например, когда организация уже использует несколько систем виртуализации и требуется их интеграция. Некоторые примеры, которые могут побуждать к созданию гетерогенной среды виртуализации:

    Различные требования к приложениям: В организации могут быть приложения, которые наилучшим образом работают на определенной системе виртуализации. Например, некоторые приложения могут быть оптимизированы для работы на платформе VMware, в то время как другие могут лучше работать на платформе Hyper-V. В таком случае, гетерогенная среда позволяет выбрать оптимальную платформу для каждого приложения.

    Лучшая цена и производительность: Различные системы виртуализации могут иметь разные цены и производительность. Гетерогенная среда позволяет выбрать наиболее подходящую систему виртуализации для каждого конкретного случая. Например, одна система может быть более экономичной, а другая - более производительной, и использование обеих систем виртуализации может помочь снизить расходы и повысить производительность.

    Расширяемость и гибкость: Гетерогенная среда может быть более гибкой и расширяемой, поскольку она позволяет использовать различные системы виртуализации в зависимости от потребностей. Например, если организация планирует расширить свою инфраструктуру, можно добавить новую систему виртуализации, не ограничиваясь только одной платформой.


В конечном счете, решение о создании гетерогенной среды виртуализации зависит от конкретных потребностей и ограничений организации. Если организация уже использует несколько систем виртуализации и требуется их интеграция, то гетерогенная среда может быть разумным выбором. Однако, при выборе гетерогенной среды необходимо учесть проблемы и риски, описанные ранее, и принять соответствующие меры для их минимизации.
