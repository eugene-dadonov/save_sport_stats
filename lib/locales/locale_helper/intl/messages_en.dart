// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(teamName) =>
      "Team ${teamName} will be deleted.\nAre you sure?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "buttonCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "buttonDelete": MessageLookupByLibrary.simpleMessage("Delete"),
        "buttonNewMatch": MessageLookupByLibrary.simpleMessage("New match"),
        "buttonNewParameter":
            MessageLookupByLibrary.simpleMessage("New Parameter"),
        "buttonNewSet":
            MessageLookupByLibrary.simpleMessage("New Configuration "),
        "buttonNewTeam": MessageLookupByLibrary.simpleMessage("New team"),
        "buttonSave": MessageLookupByLibrary.simpleMessage("Save"),
        "deleteDialogMessage": m0,
        "errorFieldMustBeFilled":
            MessageLookupByLibrary.simpleMessage("This field must be filled!"),
        "errorWhileLoadingConfigurations": MessageLookupByLibrary.simpleMessage(
            "Error occurred while loading configuration"),
        "errorWhileLoadingMatch": MessageLookupByLibrary.simpleMessage(
            "Error occurred while loading match"),
        "errorWhileLoadingParameter": MessageLookupByLibrary.simpleMessage(
            "Error occurred while loading parameter"),
        "errorWhileLoadingTeam": MessageLookupByLibrary.simpleMessage(
            "Error occurred while loading team"),
        "hintEnterCity": MessageLookupByLibrary.simpleMessage("Enter city"),
        "hintEnterName": MessageLookupByLibrary.simpleMessage("Enter name"),
        "hintEnterSport": MessageLookupByLibrary.simpleMessage("Enter sport"),
        "hintName": MessageLookupByLibrary.simpleMessage("Name"),
        "hintParameterName":
            MessageLookupByLibrary.simpleMessage("Parameter name"),
        "messageNoConfigurations": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any configurations"),
        "messageNoMatches": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any matches"),
        "messageNoParameters": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any parameters"),
        "messageNoTeams": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any teams"),
        "sportBaseball": MessageLookupByLibrary.simpleMessage("Baseball"),
        "sportBasketball": MessageLookupByLibrary.simpleMessage("Basketball"),
        "sportCricket": MessageLookupByLibrary.simpleMessage("Cricket"),
        "sportFieldHockey":
            MessageLookupByLibrary.simpleMessage("Field Hockey"),
        "sportFootball": MessageLookupByLibrary.simpleMessage("Football"),
        "sportIceHockey": MessageLookupByLibrary.simpleMessage("Ice Hockey"),
        "sportOther": MessageLookupByLibrary.simpleMessage("Other"),
        "sportRugby": MessageLookupByLibrary.simpleMessage("Rugby"),
        "sportVolleyball": MessageLookupByLibrary.simpleMessage("Volleyball"),
        "statusCancelled": MessageLookupByLibrary.simpleMessage("cancelled"),
        "statusFinished": MessageLookupByLibrary.simpleMessage("finished"),
        "statusInProgress": MessageLookupByLibrary.simpleMessage("in progress"),
        "statusNotStarted": MessageLookupByLibrary.simpleMessage("not started"),
        "titleApp": MessageLookupByLibrary.simpleMessage("Save Sport Stats!"),
        "titleChooseColor":
            MessageLookupByLibrary.simpleMessage("Choose color"),
        "titleChooseLogo": MessageLookupByLibrary.simpleMessage("Choose logo"),
        "titleCity": MessageLookupByLibrary.simpleMessage("City"),
        "titleColor": MessageLookupByLibrary.simpleMessage("Color"),
        "titleDarkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "titleLogo": MessageLookupByLibrary.simpleMessage("Logo"),
        "titleMatches": MessageLookupByLibrary.simpleMessage("Matches"),
        "titleName": MessageLookupByLibrary.simpleMessage("Name"),
        "titleNewConfiguration":
            MessageLookupByLibrary.simpleMessage("New configuration"),
        "titleNewMatch": MessageLookupByLibrary.simpleMessage("New match"),
        "titleNewParameter":
            MessageLookupByLibrary.simpleMessage("New parameter"),
        "titleNewTeam": MessageLookupByLibrary.simpleMessage("New team"),
        "titleParameters": MessageLookupByLibrary.simpleMessage("Parameters"),
        "titleSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "titleSport": MessageLookupByLibrary.simpleMessage("Sport"),
        "titleTeams": MessageLookupByLibrary.simpleMessage("Teams")
      };
}
