# Описание решения.
### Создание кастомного образа. 
_Задание: создайте свой кастомный образ nginx на базе alpine. После запуска nginx должен отдавать кастомную страницу (достаточно изменить дефолтную страницу nginx)._
  
__Проверка__:
1. docker pull ribentrop/ngotus:1.0
2. docker run --publish 8001:80 --detach --name ngotus ribentrop/ngotus:1.0
3. curl http://localhost:8001


### Вопросы-ответы
__Q1__: Определите разницу между контейнером и образом  
__A1__: Мне близки следующие понятия:
- __image__  - read-only сущность, содержащая в себе файловую систему плюс конфигурацию. 
- __container__  - Удобно думать об container  как об инстансе image. Используя метафору близкую к программированию, можно сказать  image это класс, а container это инстанс класса (объект).  

  
__Q2__: Можно ли в контейнере собрать ядро?  
__A2__: Да, можно, с помощью использования среды исполнения __katacontainers__.  
Далее то, как я понял суть __katacontainers__.  
В "традиционных" контейнерах безопасность обеспечивается за счет использование механизмов _cgroups_ и _namespaces_.  В "традиционных" контейнерах используется общее ядро с хостовой машиной.  Есть уязвимости, которые позволяют выполнить атаку хостовой системы из образа в случае использования общего ядра.   
Возможно и дальше было бы развивать направление безопасности с использованием "_capabilities, using read-only mount points, mandatory access controls (MAC) security measures like those in SELinux and AppArmor*, dropping syscalls using SECCOMP, etc_". Однако это слишком бы усложнило использование такой контейнеризации.   
Разработчики __katacontainers__ сделали акцент на безопасности, однако пошли по пути создания слоя виртуализации железа. При этом  контейнера работает на своем  ядре, вследствие чего доступа к хостовому ядру более нет. Таки образом, достигается безопасность "уровня VM", и реализация механизм безопасности не является столь сложной, какой она бы быть при использовании множества вышеперечисленных механизмов.  

Источники:  
* [medium.com](https://medium.com/kata-containers/why-kata-containers-doesnt-replace-kubernetes-75e484679727) - Medium.
* [https://katacontainers.io/](https://katacontainers.io/) - основной сайт __katacontainers__.



