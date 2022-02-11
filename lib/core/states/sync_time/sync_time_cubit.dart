import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/common/server_time/server_time.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/connection_event_listener.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/server_time_event_listener.dart';
import 'package:flutter_deriv_sample/core/enums.dart';

part 'sync_time_state.dart';

/// Sync time cubit.
class SyncTimeCubit extends Cubit<SyncTimeState>
    implements ServerTimeEventListener, ConnectionEventListener {
  /// Initializes Sync time cubit.
  SyncTimeCubit() : super(SyncTimeInitialState()) {
    _currentDateTime = now;

    _stopwatch.start();
    _updateDateTime();

    Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        emit(
          SyncTimeUpdatedState(
            _currentDateTime = _currentDateTime
                .add(Duration(milliseconds: _stopwatch.elapsedMilliseconds)),
          ),
        );

        _stopwatch.reset();
      },
    );
  }

  final Stopwatch _stopwatch = Stopwatch();

  late DateTime _currentDateTime;

  /// Gets current date time.
  DateTime get now => state.dateTime;

  /// Updates date time with server.
  Future<void> _updateDateTime([DateTime? serverTime]) async {
    _currentDateTime =
        (serverTime ?? (await ServerTime.fetchTime()).time)!.toUtc();

    _stopwatch.reset();
  }

  @override
  void onFetchingServerTime() {}

  @override
  void onServerTimeFetched({DateTime? serverTime, int? timeDifference}) =>
      _updateDateTime(serverTime);

  @override
  void onServerTimeError(String? error) {}

  @override
  void onConnected() => _updateDateTime();

  @override
  void onDisconnect(DisconnectSource source) {}

  @override
  void onConnectionError(String error) {}
}
