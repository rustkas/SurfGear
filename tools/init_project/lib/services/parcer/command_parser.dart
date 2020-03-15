import 'dart:io';

import 'package:args/args.dart';
import 'package:init_project/domain/command.dart';
import 'package:init_project/services/utils/print_message_console.dart';
import 'package:path/path.dart' as p;

/// Путь до репозитория, по умолчанию - ссылка https.
const String _remoteUrl = 'https://osipov-e-surf@bitbucket.org/surfstudio/flutter-standard.git';

/// Парсер команд.
class CommandParser {
  final ArgParser _argParser = ArgParser();

  /// Опция для указания дирректории шаблонного проекта.
  static const String _path = 'out';
  static const String _pathAbbr = 'o';

  /// Опция для имени проекта, я влячется обязательным.
  static const String _nameProject = 'name';
  static const String _nameProjectAbbr = 'n';

  /// Флаг для вызова help.
  static const String _helpFlag = 'help';
  static const String _helpAbbr = 'h';

  /// Опция для указания своего пути до репозитория с template.
  static const String _remote = 'remote';
  static const String _remoteAbbr = 'r';

  /// Опция для указания ветки для зависимостей flutter-standard
  static const String _branch = 'branch';
  static const String _branchAbbr = 'b';

  CommandParser() {
    _init_parser();
  }

  /// Выполняет парсинг переданных аргументов и возвращает команду на исполнение.
  ///
  ///  [sleep] необходим в случаи неправильно введённых комманд/опций/флагов,
  ///  в редких случаях вывод ошибки смешавается с help.
  Future<Command> parser(List<String> arguments) async {
    try {
      final parsed = _argParser.parse(arguments);

      return _getCommandByArgs(parsed);
    } catch (e) {
      printMessageConsole(_argParser.usage);
      sleep(Duration(microseconds: 10));
      rethrow;
    }
  }

  /// В данном методе необходимо провести инициализацию
  /// у парсера всевозможных опций.
  void _init_parser() {
    _argParser

      /// Путь до проекта.
      ..addOption(
        CommandParser._path,
        abbr: CommandParser._pathAbbr,
        help: 'Way to the project',
        valueHelp: 'path',
        defaultsTo: p.current,
      )

      /// Имя проекта.
      ..addOption(
        CommandParser._nameProject,
        abbr: CommandParser._nameProjectAbbr,
        help: 'Name project',
        valueHelp: 'nameProject',
      )

      /// Ветка зависимостей.
      ..addOption(
        CommandParser._branch,
        abbr: CommandParser._branchAbbr,
        help: 'Dependency branch',
        valueHelp: 'branch',
        defaultsTo: 'dev',
      )

      /// Путь до репозитория
      ..addOption(
        CommandParser._remote,
        abbr: CommandParser._remoteAbbr,
        help: 'Path to repository https',
        valueHelp: 'url',
        defaultsTo: _remoteUrl,
      )

      /// Help.
      ..addFlag(CommandParser._helpFlag, abbr: CommandParser._helpAbbr, negatable: false, help: 'Help');
  }

  /// Если опции введены верно, парсим их в [Command], иначе возвращаем help.
  Future<Command> _getCommandByArgs(ArgResults parsed) async {
    final isShowHelp = parsed[CommandParser._helpFlag] as bool;

    if (isShowHelp) {
      printMessageConsole(_argParser.usage);
      return null;
    }

    if (parsed[CommandParser._nameProject] == null) {
      return Future.error(Exception('Enter project name'));
    }

    return Command(
      parsed[CommandParser._nameProject],
      path: parsed[CommandParser._path],
      remoteUrl: parsed[CommandParser._remote],
      branch: parsed[CommandParser._branch],
    );
  }
}
