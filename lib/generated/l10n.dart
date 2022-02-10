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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mobile Test`
  String get appName {
    return Intl.message(
      'Mobile Test',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard Title`
  String get dashboard_title {
    return Intl.message(
      'Dashboard Title',
      name: 'dashboard_title',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get connecting {
    return Intl.message(
      'Connecting...',
      name: 'connecting',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error\n${error}`
  String connection_error(Object error) {
    return Intl.message(
      'Connection Error\\n\$$error',
      name: 'connection_error',
      desc: '',
      args: [error],
    );
  }

  /// `Connection is down, trying to reconnect...`
  String get connection_down {
    return Intl.message(
      'Connection is down, trying to reconnect...',
      name: 'connection_down',
      desc: '',
      args: [],
    );
  }

  /// `Active Symbols`
  String get active_symbols {
    return Intl.message(
      'Active Symbols',
      name: 'active_symbols',
      desc: '',
      args: [],
    );
  }

  /// `Select an active symbol`
  String get select_active_symbol {
    return Intl.message(
      'Select an active symbol',
      name: 'select_active_symbol',
      desc: '',
      args: [],
    );
  }

  /// `Available Contracts`
  String get available_contracts {
    return Intl.message(
      'Available Contracts',
      name: 'available_contracts',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get market {
    return Intl.message(
      'Market',
      name: 'market',
      desc: '',
      args: [],
    );
  }

  /// `Submarket`
  String get submarket {
    return Intl.message(
      'Submarket',
      name: 'submarket',
      desc: '',
      args: [],
    );
  }

  /// `Symbol Name`
  String get symbol_name {
    return Intl.message(
      'Symbol Name',
      name: 'symbol_name',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
