// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(error) => "Connection Error\\n\$${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "active_symbols":
            MessageLookupByLibrary.simpleMessage("Active Symbols"),
        "appName": MessageLookupByLibrary.simpleMessage("Mobile Test"),
        "available_contracts":
            MessageLookupByLibrary.simpleMessage("Available Contracts"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "connecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
        "connection_down": MessageLookupByLibrary.simpleMessage(
            "Connection is down, trying to reconnect..."),
        "connection_error": m0,
        "dashboard_title":
            MessageLookupByLibrary.simpleMessage("Dashboard Title"),
        "market": MessageLookupByLibrary.simpleMessage("Market"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "select_active_symbol":
            MessageLookupByLibrary.simpleMessage("Select an active symbol"),
        "submarket": MessageLookupByLibrary.simpleMessage("Submarket"),
        "symbol_name": MessageLookupByLibrary.simpleMessage("Symbol Name")
      };
}
