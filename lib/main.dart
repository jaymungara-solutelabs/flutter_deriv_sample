import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/base_bloc_manager.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_bloc_manager/bloc_observer.dart';
import 'package:flutter_deriv_bloc_manager/event_dispatcher.dart';
import 'dart:developer' as logger;

import 'package:flutter_deriv_sample/app.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/state_emitters/active_symbols_state_emitter.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/state_emitters/connection_state_emitter.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark));

  // Force a portrait orientation
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  Bloc.observer = CubitObserver();

  runZonedGuarded(() async {
    // registerCoreBlocs();
    // initializeEventDispatcher();

    runApp(const App());
  }, (Object error, StackTrace stackTrace) {
    logger.log('Error: ', error: error, stackTrace: stackTrace);
  });
}

/// Registers common bloc and cubit to BlocManager
void registerCoreBlocs() {
  BlocManager.instance
    ..register(ConnectionCubit(ConnectionInformation(
        appId: '1089', brand: 'binary', endpoint: 'frontend.binaryws.com')))
    ..register(ActiveSymbolCubit());
}

/// Initializes event dispatcher.
void initializeEventDispatcher() => EventDispatcher(BlocManager.instance)
  ..register<ConnectionCubit, ConnectionStateEmitter>(
      (BaseBlocManager blocManager) => ConnectionStateEmitter(blocManager))
  ..register<ActiveSymbolCubit, ActiveSymbolsStateEmitter>(
      (BaseBlocManager blocManager) => ActiveSymbolsStateEmitter(blocManager));
