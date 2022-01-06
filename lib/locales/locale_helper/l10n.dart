// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class HelperLocale {
  HelperLocale();

  static HelperLocale? _current;

  static HelperLocale get current {
    assert(_current != null,
        'No instance of HelperLocale was loaded. Try to initialize the HelperLocale delegate before accessing HelperLocale.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<HelperLocale> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = HelperLocale();
      HelperLocale._current = instance;

      return instance;
    });
  }

  static HelperLocale of(BuildContext context) {
    final instance = HelperLocale.maybeOf(context);
    assert(instance != null,
        'No instance of HelperLocale present in the widget tree. Did you add HelperLocale.delegate in localizationsDelegates?');
    return instance!;
  }

  static HelperLocale? maybeOf(BuildContext context) {
    return Localizations.of<HelperLocale>(context, HelperLocale);
  }

  /// `Футбол`
  String get sportFootball {
    return Intl.message(
      'Футбол',
      name: 'sportFootball',
      desc: '',
      args: [],
    );
  }

  /// `Волейбол`
  String get sportVolleyball {
    return Intl.message(
      'Волейбол',
      name: 'sportVolleyball',
      desc: '',
      args: [],
    );
  }

  /// `Баскетбол`
  String get sportBasketball {
    return Intl.message(
      'Баскетбол',
      name: 'sportBasketball',
      desc: '',
      args: [],
    );
  }

  /// `Регби`
  String get sportRugby {
    return Intl.message(
      'Регби',
      name: 'sportRugby',
      desc: '',
      args: [],
    );
  }

  /// `Крикет`
  String get sportCricket {
    return Intl.message(
      'Крикет',
      name: 'sportCricket',
      desc: '',
      args: [],
    );
  }

  /// `Хоккей`
  String get sportIceHockey {
    return Intl.message(
      'Хоккей',
      name: 'sportIceHockey',
      desc: '',
      args: [],
    );
  }

  /// `Хоккей на траве`
  String get sportFieldHockey {
    return Intl.message(
      'Хоккей на траве',
      name: 'sportFieldHockey',
      desc: '',
      args: [],
    );
  }

  /// `Бейсбол`
  String get sportBaseball {
    return Intl.message(
      'Бейсбол',
      name: 'sportBaseball',
      desc: '',
      args: [],
    );
  }

  /// `Другое`
  String get sportOther {
    return Intl.message(
      'Другое',
      name: 'sportOther',
      desc: '',
      args: [],
    );
  }

  /// `Матчи`
  String get titleMatches {
    return Intl.message(
      'Матчи',
      name: 'titleMatches',
      desc: '',
      args: [],
    );
  }

  /// `Команды`
  String get titleTeams {
    return Intl.message(
      'Команды',
      name: 'titleTeams',
      desc: '',
      args: [],
    );
  }

  /// `Параметры`
  String get titleParameters {
    return Intl.message(
      'Параметры',
      name: 'titleParameters',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get titleSettings {
    return Intl.message(
      'Настройки',
      name: 'titleSettings',
      desc: '',
      args: [],
    );
  }

  /// `Новая команда`
  String get buttonNewTeam {
    return Intl.message(
      'Новая команда',
      name: 'buttonNewTeam',
      desc: '',
      args: [],
    );
  }

  /// `Новый матч`
  String get buttonNewMatch {
    return Intl.message(
      'Новый матч',
      name: 'buttonNewMatch',
      desc: '',
      args: [],
    );
  }

  /// `Новый параметр`
  String get buttonNewParameter {
    return Intl.message(
      'Новый параметр',
      name: 'buttonNewParameter',
      desc: '',
      args: [],
    );
  }

  /// `Новый набор`
  String get buttonNewSet {
    return Intl.message(
      'Новый набор',
      name: 'buttonNewSet',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get buttonSave {
    return Intl.message(
      'Сохранить',
      name: 'buttonSave',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get buttonCancel {
    return Intl.message(
      'Отмена',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get buttonDelete {
    return Intl.message(
      'Удалить',
      name: 'buttonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Вид спорта`
  String get titleSport {
    return Intl.message(
      'Вид спорта',
      name: 'titleSport',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get titleName {
    return Intl.message(
      'Название',
      name: 'titleName',
      desc: '',
      args: [],
    );
  }

  /// `Город`
  String get titleCity {
    return Intl.message(
      'Город',
      name: 'titleCity',
      desc: '',
      args: [],
    );
  }

  /// `Эмблема`
  String get titleLogo {
    return Intl.message(
      'Эмблема',
      name: 'titleLogo',
      desc: '',
      args: [],
    );
  }

  /// `Цвет`
  String get titleColor {
    return Intl.message(
      'Цвет',
      name: 'titleColor',
      desc: '',
      args: [],
    );
  }

  /// `Выберите цвет`
  String get titleChooseColor {
    return Intl.message(
      'Выберите цвет',
      name: 'titleChooseColor',
      desc: '',
      args: [],
    );
  }

  /// `Выберите эмблему`
  String get titleChooseLogo {
    return Intl.message(
      'Выберите эмблему',
      name: 'titleChooseLogo',
      desc: '',
      args: [],
    );
  }

  /// `Save Sport Stats!`
  String get titleApp {
    return Intl.message(
      'Save Sport Stats!',
      name: 'titleApp',
      desc: '',
      args: [],
    );
  }

  /// `Темная тема`
  String get titleDarkTheme {
    return Intl.message(
      'Темная тема',
      name: 'titleDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Введите название`
  String get hintEnterName {
    return Intl.message(
      'Введите название',
      name: 'hintEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Введите город`
  String get hintEnterCity {
    return Intl.message(
      'Введите город',
      name: 'hintEnterCity',
      desc: '',
      args: [],
    );
  }

  /// `Выберите спорт`
  String get hintEnterSport {
    return Intl.message(
      'Выберите спорт',
      name: 'hintEnterSport',
      desc: '',
      args: [],
    );
  }

  /// `матч идет`
  String get statusInProgress {
    return Intl.message(
      'матч идет',
      name: 'statusInProgress',
      desc: '',
      args: [],
    );
  }

  /// `закончен`
  String get statusFinished {
    return Intl.message(
      'закончен',
      name: 'statusFinished',
      desc: '',
      args: [],
    );
  }

  /// `отменен`
  String get statusCancelled {
    return Intl.message(
      'отменен',
      name: 'statusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `не начат`
  String get statusNotStarted {
    return Intl.message(
      'не начат',
      name: 'statusNotStarted',
      desc: '',
      args: [],
    );
  }

  /// `Новая команда`
  String get titleNewTeam {
    return Intl.message(
      'Новая команда',
      name: 'titleNewTeam',
      desc: '',
      args: [],
    );
  }

  /// `Новый параметр`
  String get titleNewParameter {
    return Intl.message(
      'Новый параметр',
      name: 'titleNewParameter',
      desc: '',
      args: [],
    );
  }

  /// `Новый набор`
  String get titleNewConfiguration {
    return Intl.message(
      'Новый набор',
      name: 'titleNewConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Новый матч`
  String get titleNewMatch {
    return Intl.message(
      'Новый матч',
      name: 'titleNewMatch',
      desc: '',
      args: [],
    );
  }

  /// `Поле должно быть заполнено!`
  String get errorFieldMustBeFilled {
    return Intl.message(
      'Поле должно быть заполнено!',
      name: 'errorFieldMustBeFilled',
      desc: '',
      args: [],
    );
  }

  /// `У Вас пока нет добавленных команд`
  String get messageNoTeams {
    return Intl.message(
      'У Вас пока нет добавленных команд',
      name: 'messageNoTeams',
      desc: '',
      args: [],
    );
  }

  /// `У Вас пока нет добавленных матчей`
  String get messageNoMatches {
    return Intl.message(
      'У Вас пока нет добавленных матчей',
      name: 'messageNoMatches',
      desc: '',
      args: [],
    );
  }

  /// `У Вас пока нет добавленных параметров`
  String get messageNoParameters {
    return Intl.message(
      'У Вас пока нет добавленных параметров',
      name: 'messageNoParameters',
      desc: '',
      args: [],
    );
  }

  /// `У Вас пока нет добавленных конфигураций`
  String get messageNoConfigurations {
    return Intl.message(
      'У Вас пока нет добавленных конфигураций',
      name: 'messageNoConfigurations',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при загрузке параметра`
  String get errorWhileLoadingParameter {
    return Intl.message(
      'Ошибка при загрузке параметра',
      name: 'errorWhileLoadingParameter',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при загрузке конфигурации`
  String get errorWhileLoadingConfigurations {
    return Intl.message(
      'Ошибка при загрузке конфигурации',
      name: 'errorWhileLoadingConfigurations',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при загрузке команды`
  String get errorWhileLoadingTeam {
    return Intl.message(
      'Ошибка при загрузке команды',
      name: 'errorWhileLoadingTeam',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка при загрузке матч`
  String get errorWhileLoadingMatch {
    return Intl.message(
      'Ошибка при загрузке матч',
      name: 'errorWhileLoadingMatch',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get hintName {
    return Intl.message(
      'Название',
      name: 'hintName',
      desc: '',
      args: [],
    );
  }

  /// `Название параметра`
  String get hintParameterName {
    return Intl.message(
      'Название параметра',
      name: 'hintParameterName',
      desc: '',
      args: [],
    );
  }

  /// `Команда {teamName} будет удалена.\n¿Вы уверены?`
  String deleteDialogMessage(Object teamName) {
    return Intl.message(
      'Команда $teamName будет удалена.\n¿Вы уверены?',
      name: 'deleteDialogMessage',
      desc: '',
      args: [teamName],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<HelperLocale> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<HelperLocale> load(Locale locale) => HelperLocale.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
