import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Interface for getting ServerTimeBloc states.
abstract class ServerTimeEventListener extends BaseEventListener {
  /// On fetching server time event handler.
  void onFetchingServerTime();

  /// On server time fetched event handler.
  void onServerTimeFetched({
    DateTime? serverTime,
    int? timeDifference,
  });

  /// On server time error event handler.
  ///
  /// [error] contains the reason of the problem.
  void onServerTimeError(String? error);
}
