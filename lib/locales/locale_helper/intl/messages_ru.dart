// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(teamName) =>
      "Команда ${teamName} будет удалена.\n¿Вы уверены?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "buttonCancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "buttonDelete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "buttonNewMatch": MessageLookupByLibrary.simpleMessage("Новый матч"),
        "buttonNewParameter":
            MessageLookupByLibrary.simpleMessage("Новый параметр"),
        "buttonNewSet": MessageLookupByLibrary.simpleMessage("Новый набор"),
        "buttonNewTeam": MessageLookupByLibrary.simpleMessage("Новая команда"),
        "buttonSave": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "deleteDialogMessage": m0,
        "errorFieldMustBeFilled":
            MessageLookupByLibrary.simpleMessage("Поле должно быть заполнено!"),
        "errorWhileLoadingConfigurations": MessageLookupByLibrary.simpleMessage(
            "Ошибка при загрузке конфигурации"),
        "errorWhileLoadingMatch":
            MessageLookupByLibrary.simpleMessage("Ошибка при загрузке матч"),
        "errorWhileLoadingParameter": MessageLookupByLibrary.simpleMessage(
            "Ошибка при загрузке параметра"),
        "errorWhileLoadingTeam":
            MessageLookupByLibrary.simpleMessage("Ошибка при загрузке команды"),
        "hintEnterCity": MessageLookupByLibrary.simpleMessage("Введите город"),
        "hintEnterName":
            MessageLookupByLibrary.simpleMessage("Введите название"),
        "hintEnterSport":
            MessageLookupByLibrary.simpleMessage("Выберите спорт"),
        "hintName": MessageLookupByLibrary.simpleMessage("Название"),
        "hintParameterName":
            MessageLookupByLibrary.simpleMessage("Название параметра"),
        "messageNoConfigurations": MessageLookupByLibrary.simpleMessage(
            "У Вас пока нет добавленных конфигураций"),
        "messageNoMatches": MessageLookupByLibrary.simpleMessage(
            "У Вас пока нет добавленных матчей"),
        "messageNoParameters": MessageLookupByLibrary.simpleMessage(
            "У Вас пока нет добавленных параметров"),
        "messageNoTeams": MessageLookupByLibrary.simpleMessage(
            "У Вас пока нет добавленных команд"),
        "sportBaseball": MessageLookupByLibrary.simpleMessage("Бейсбол"),
        "sportBasketball": MessageLookupByLibrary.simpleMessage("Баскетбол"),
        "sportCricket": MessageLookupByLibrary.simpleMessage("Крикет"),
        "sportFieldHockey":
            MessageLookupByLibrary.simpleMessage("Хоккей на траве"),
        "sportFootball": MessageLookupByLibrary.simpleMessage("Футбол"),
        "sportIceHockey": MessageLookupByLibrary.simpleMessage("Хоккей"),
        "sportOther": MessageLookupByLibrary.simpleMessage("Другое"),
        "sportRugby": MessageLookupByLibrary.simpleMessage("Регби"),
        "sportVolleyball": MessageLookupByLibrary.simpleMessage("Волейбол"),
        "statusCancelled": MessageLookupByLibrary.simpleMessage("отменен"),
        "statusFinished": MessageLookupByLibrary.simpleMessage("закончен"),
        "statusInProgress": MessageLookupByLibrary.simpleMessage("матч идет"),
        "statusNotStarted": MessageLookupByLibrary.simpleMessage("не начат"),
        "titleApp": MessageLookupByLibrary.simpleMessage("Save Sport Stats!"),
        "titleChooseColor":
            MessageLookupByLibrary.simpleMessage("Выберите цвет"),
        "titleChooseLogo":
            MessageLookupByLibrary.simpleMessage("Выберите эмблему"),
        "titleCity": MessageLookupByLibrary.simpleMessage("Город"),
        "titleColor": MessageLookupByLibrary.simpleMessage("Цвет"),
        "titleDarkTheme": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "titleLogo": MessageLookupByLibrary.simpleMessage("Эмблема"),
        "titleMatches": MessageLookupByLibrary.simpleMessage("Матчи"),
        "titleName": MessageLookupByLibrary.simpleMessage("Название"),
        "titleNewConfiguration":
            MessageLookupByLibrary.simpleMessage("Новый набор"),
        "titleNewMatch": MessageLookupByLibrary.simpleMessage("Новый матч"),
        "titleNewParameter":
            MessageLookupByLibrary.simpleMessage("Новый параметр"),
        "titleNewTeam": MessageLookupByLibrary.simpleMessage("Новая команда"),
        "titleParameters": MessageLookupByLibrary.simpleMessage("Параметры"),
        "titleSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "titleSport": MessageLookupByLibrary.simpleMessage("Вид спорта"),
        "titleTeams": MessageLookupByLibrary.simpleMessage("Команды")
      };
}
