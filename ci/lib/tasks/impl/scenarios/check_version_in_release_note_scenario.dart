import 'package:ci/domain/command.dart';
import 'package:ci/domain/element.dart';
import 'package:ci/exceptions/exceptions.dart';
import 'package:ci/exceptions/exceptions_strings.dart';
import 'package:ci/services/parsers/command_parser.dart';
import 'package:ci/services/parsers/pubspec_parser.dart';
import 'package:ci/tasks/checks.dart';
import 'package:ci/tasks/core/task.dart';

/// Сценарий для команды check_version_in_release_note.
///
/// Пример вызова:
/// dart ci check_version_in_release_note --name=anyName
class CheckVersionInReleaseNoteScenario extends OneElementScenario {
  static const String commandName = 'check_version_in_release_note';
  static const String nameOption = CommandParser.defaultNameOption;

  @override
  String get formatExceptionText => getCommandFormatExceptionText(
        commandName,
        'ожидалось check_version_in_release_note --name=anyName',
      );

  CheckVersionInReleaseNoteScenario(
      Command command, PubspecParser pubspecParser)
      : super(command, pubspecParser);

  @override
  Future<void> handleElement(Element element) async {
    try {
      await checkVersionInReleaseNote(element);
    } on BaseCiException {
      rethrow;
    }
  }
}