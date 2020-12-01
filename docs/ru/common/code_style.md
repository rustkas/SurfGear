[Главная](../main.md)

# Стиль кода

## Основные положения

Этот документ описывает соглашения по стилю кода. Мы придерживаемся рекомендаций,
описанных в [Effective Dart](https://www.dartlang.org/guides/language/effective-dart),
и перед началом разработки очень рекомендуем ознакомиться с ними.

Перед каждым пулл реквестом необходимо отформатировать код с помощью dartfmt
(Ctrl+Alt+L для Android Studio, Ctrl+Alt+F для VS Code, должен быть установлен плагин для Flutter).

## Документация, комментарии

см. [Docs](https://www.dartlang.org/guides/language/effective-dart/documentation)

## Именование

### Именование файлов

Файлы именуются в **snake_case**.

Файлы основных компонентов экрана должны заканчиваться следующими суффиксами:

- *screen* — файл с виджетом экрана

- *wm* — файл с WidgetModel экрана

- *route* - файл c Route экрана

### Именование ресурсов

 Ресурсы (строки, названия файлов ассетов) объявляются с помощью модификатора const,
 чтобы в конструкторах виджетов их можно было использовать в качестве значения по умолчанию.

### Именование переменных и методов

 Константы именуются в lowerCamelCase (как написано в [Effective Dart](https://dart.dev/guides/language/effective-dart/style#prefer-using-lowercamelcase-for-constant-names)):
```dart
    const String keyAlias = "KEY_ALIAS"
```

 Булевы переменные должны начинаться со вспомогательных глаголов is/was/has.
 
 Для полей виджетов и виджет моделей существуют следующие суффиксы:

   - *State* — объект класса StreamedState
   
   - *Action* — объект класса Action
   
   - *Controller* — различные контроллеры (AnimationController, TextEditingController, etc.)
   
 Имена методов и функций должны содержать глагол, который отражает исполняемую логику. Следует избегать союзов **And/Or** в названиях методов,
 наличие таковых — явный признак для рефакторинга кода.
 
 Для именования методов рекомендуется использовать следующие префиксы:
 
 - *build* — для методов, возвращающих часть дерева виджетов (используются для упрощения вёрстки)
 
 - *reload* — методы загрузки/перезагрузки данных
 
### Именование классов

Следует использовать следующие постфиксы для сущностей:

- *Widget/Screen* — отдельный виджет или вёрстка целого экрана

- *WidgetModel* — модель виджета

- *Component* — компонент для конфигурации зависимостей

- *Interactor* — интеракторы для бизнес-логики

- *Repository* — репозитории

## Организация кода

### Файловая структура

Dart позволяет хранить в одном файле несколько классов, поэтому рекомендуется объединять несколько смежных по функционалу классов в один файл.

Типичная структура файлов файлов и папок описана [здесь](./structure.md).

Дополнительно:

  - Директория экрана должна содержать папку с настройками di-компонента
  
  - Глобальные функции следует собирать в файлы с суффиксом utils
    
### Структура класса

Внутри класса следует использовать следующий порядок метод и полей:
1. static const поля

1. static поля

1. final поля

1. приватные поля (get/set)

1. публичные поля (get/set)

1. конструкторы класса

1. @override

1. публичные методы (static также здесь)

1. @protected методы

1. приватные методы

## Форматирование

**ВАЖНО**: Для лучшей читаемости рекомендуется вставлять запятую после последнего аргумента в вызовах методов и конструкторов, а так же в описании их параметров, если они не помещаются в одну строчку (trailing comma).

Плохо:
```dart
  func(
      "foobar",
      "barfoo",
      "asdf1234",
      "orange",
      "apple",
      "banana",
      "foobar",
      "barfoo",
      "asdf1234",
      "orange",
      "apple",
      "banana");
```
Хорошо:
```dart
  func(
      "foobar",
      "barfoo",
      "asdf1234",
      "orange",
      "apple",
      "banana",
      "foobar",
      "barfoo",
      "asdf1234",
      "orange",
      "apple",
      "banana", //Это и есть trailing comma
  );
```


## Рекомендации

При разработке следует пользоваться правилами и подходами описанными [здесь](https://www.dartlang.org/guides/language/effective-dart/design)

