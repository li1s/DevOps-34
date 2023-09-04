## Домашнее задание к занятию «Инструменты Git»
### Цель задания

В результате выполнения задания вы:

    научитесь работать с утилитами Git;
    потренируетесь решать типовые задачи, возникающие при работе в команде.

Инструкция к заданию

    Склонируйте репозиторий с исходным кодом Terraform.
    Создайте файл для ответов на задания в своём репозитории, после выполнения прикрепите ссылку на .md-файл с ответами в личном кабинете.
    Любые вопросы по решению задач задавайте в чате учебной группы.

Задание

В клонированном репозитории:

    Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.
    Ответьте на вопросы.

    Какому тегу соответствует коммит 85024d3?
    Сколько родителей у коммита b8d720? Напишите их хеши.
    Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
    Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).
    Найдите все коммиты, в которых была изменена функция globalPluginDirs.
    Кто автор функции synchronizedWriters?

В качестве решения ответьте на вопросы и опишите, как были получены эти ответы.
Правила приёма домашнего задания

В личном кабинете отправлена ссылка на .md-файл в вашем репозитории.
Критерии оценки

Зачёт:

    выполнены все задания;
    ответы даны в развёрнутой форме;
    приложены соответствующие скриншоты и файлы проекта;
    в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

    задание выполнено частично или не выполнено вообще;
    в логике выполнения заданий есть противоречия и существенные недостатки.


Решение 1.
### Склонировать репозиторий Terraform 
git  clone https://github.com/hashicorp/terraform.git|

### Задания: 
#### В клонированном репозитории:

    ### Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.
_________________________________________________________  
    Полный хеш с комментарием можем посмотреть командой 
    ```git show aefea```
    Результат выполнения команды: 
    ```
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400

    Update CHANGELOG.md

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 86d70e3e0d..588d807b17 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -27,6 +27,7 @@ BUG FIXES:
 * backend/s3: Prefer AWS shared configuration over EC2 metadata credentials by default ([#25134](https://github.com/hashicorp/terraform/issues/25134))
 * backend/s3: Prefer ECS credentials over EC2 metadata credentials by default ([#25134](https://github.com/hashicorp/terraform/issues/25134))
 * backend/s3: Remove hardcoded AWS Provider messaging ([#25134](https://github.com/hashicorp/terraform/issues/25134))
+* command: Fix bug with global `-v`/`-version`/`--version` flags introduced in 0.13.0beta2 [GH-25277]
 * command/0.13upgrade: Fix `0.13upgrade` usage help text to include options ([#25127](https://github.com/hashicorp/terraform/issues/25127))
 * command/0.13upgrade: Do not add source for builtin provider ([#25215](https://github.com/hashicorp/terraform/issues/25215))
 * command/apply: Fix bug which caused Terraform to silently exit on Windows when using absolute plan path ([#25233](https://github.com/hashicorp/terraform/issues/25233))
 ```
_________________________________________________________
    Ответьте на вопросы.

    1: Какому тегу соответствует коммит 85024d3?
    Коммиту ```85024d3``` соответсвует tag: : v0.12.23
    Команда ```git show 85024d3```
_________________________________________________________   
    2: Сколько родителей у коммита b8d720? Напишите их хеши.
Проверяем командой ```git log --pretty=%P -n 1 b8d720```
Результат: 2 родителя.
```56cd7859e05c36c06b56d013b55a252d0bb7e158``` 
```9ea88f22fc6269854151c571162c5bcf958bee2b```
_________________________________________________________
    3: Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
Проверяем командой ```git log v0.12.23...v0.12.24```
```
commit 33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24)
Author: tf-release-bot <terraform@hashicorp.com>
Date:   Thu Mar 19 15:04:05 2020 +0000

    v0.12.24

commit b14b74c4939dcab573326f4e3ee2a62e23e12f89
Author: Chris Griggs <cgriggs@hashicorp.com>
Date:   Tue Mar 10 08:59:20 2020 -0700

    [Website] vmc provider links

commit 3f235065b9347a758efadc92295b540ee0a5e26e
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Mar 19 10:39:31 2020 -0400

    Update CHANGELOG.md

commit 6ae64e247b332925b872447e9ce869657281c2bf
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Mar 19 10:20:10 2020 -0400

    registry: Fix panic when server is unreachable
    
    Non-HTTP errors previously resulted in a panic due to dereferencing the
    resp pointer while it was nil, as part of rendering the error message.
    This commit changes the error message formatting to cope with a nil
    response, and extends test coverage.
    
    Fixes #24384

commit 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353
Author: Nick Fagerlund <nick.fagerlund@gmail.com>
Date:   Wed Mar 18 12:30:20 2020 -0700

    website: Remove links to the getting started guide's old location
    
    Since these links were in the soon-to-be-deprecated 0.11 language section, I
    think we can just remove them without needing to find an equivalent link.

commit 06275647e2b53d97d4f0a19a0fec11f6d69820b5
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Wed Mar 18 10:57:06 2020 -0400

    Update CHANGELOG.md

commit d5f9411f5108260320064349b757f55c09bc4b80
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Tue Mar 17 13:21:35 2020 -0400

    command: Fix bug when using terraform login on Windows

commit 4b6d06cc5dcb78af637bbb19c198faff37a066ed
Author: Pam Selle <pam@hashicorp.com>
Date:   Tue Mar 10 12:04:50 2020 -0400

    Update CHANGELOG.md

commit dd01a35078f040ca984cdd349f18d0b67e486c35
Author: Kristin Laemmert <mildwonkey@users.noreply.github.com>
Date:   Thu Mar 5 16:32:43 2020 -0500

    Update CHANGELOG.md

commit 225466bc3e5f35baa5d07197bbc079345b77525e
Author: tf-release-bot <terraform@hashicorp.com>
Date:   Thu Mar 5 21:12:06 2020 +0000

    Cleanup after v0.12.23 release

```

_________________________________________________________
    4: Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).
Проверяем командой: ```git log -S"func providerSource"```
Результат следующий:
``` 
commit 5af1e6234ab6da412fb8637393c5a17a1b293663
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Tue Apr 21 16:28:59 2020 -0700

    main: Honor explicit provider_installation CLI config when present
    
    If the CLI configuration contains a provider_installation block then we'll
    use the source configuration it describes instead of the implied one we'd
    build otherwise.

commit 8c928e83589d90a031f811fae52a81be7153e82f
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Thu Apr 2 18:04:39 2020 -0700
```

Коммит в котором функция была создана
```
commit 8c928e83589d90a031f811fae52a81be7153e82f
```
Исходя из даты создания 2 Апреля 2020 года.
_________________________________________________________
    5: Найдите все коммиты, в которых была изменена функция globalPluginDirs.
Проверяем командой: ``` git log -S globalPluginDirs --oneline ```
Результат: 
```
65c4ba7363 Remove terraform binary
125eb51dc4 Remove accidentally-committed binary
22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
7c7e5d8f0a Don't show data while input if sensitive
35a058fb3d main: configure credentials from the CLI config file
c0b1761096 prevent log output during init
8364383c35 Push plugin discovery down into command package
```
_________________________________________________________
    6: Кто автор функции synchronizedWriters?
_________________________________________________________
Проверяем командой: ``` git log -S synchronizedWriters ```
Результат: 
```
commit bdfea50cc85161dea41be0fe3381fd98731ff786
Author: James Bardin <j.bardin@gmail.com>
Date:   Mon Nov 30 18:02:04 2020 -0500

    remove unused

commit fd4f7eb0b935e5a838810564fd549afe710ae19a
Author: James Bardin <j.bardin@gmail.com>
Date:   Wed Oct 21 13:06:23 2020 -0400

    remove prefixed io
    
    The main process is now handling what output to print, so it doesn't do
    any good to try and run it through prefixedio, which is only adding
    extra coordination to echo the same data.

commit 5ac311e2a91e381e2f52234668b49ba670aa0fe5
Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Wed May 3 16:25:41 2017 -0700
```

Получается автор: Martin Atkins <mart@degeneration.co.uk>