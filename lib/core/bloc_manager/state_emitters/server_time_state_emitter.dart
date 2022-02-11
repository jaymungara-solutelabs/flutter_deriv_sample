import 'package:flutter_deriv_api/state/server_time/server_time_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/server_time_event_listener.dart';

/// Server time state emitter.
class ServerTimeStateEmitter
    extends BaseStateEmitter<ServerTimeEventListener, ServerTimeBloc> {
  /// Initializes server time state emitter.
  ServerTimeStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required ServerTimeEventListener eventListener,
    required Object state,
  }) {
    if (state is FetchingServerTime) {
      eventListener.onFetchingServerTime();
    } else if (state is ServerTimeFetched) {
      eventListener.onServerTimeFetched(
        serverTime: state.serverTime,
        timeDifference: state.timeDifference,
      );
    } else if (state is ServerTimeError) {
      eventListener.onServerTimeError(state.error);
    }
  }
}
