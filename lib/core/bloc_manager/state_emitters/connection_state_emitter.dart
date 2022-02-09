import 'package:flutter_deriv_api/services/connection/connection_service.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/connection_event_listener.dart';
import 'package:flutter_deriv_sample/core/enums.dart';

/// Connection state emitter.
class ConnectionStateEmitter
    extends BaseStateEmitter<ConnectionEventListener, ConnectionCubit> {
  /// Initializes connection state emitter.
  ConnectionStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required ConnectionEventListener eventListener,
    required Object state,
  }) {
    if (state is ConnectionConnectedState) {
      eventListener.onConnected();
    } else if (state is ConnectionDisconnectedState) {
      ConnectionService().isConnectedToInternet.then(
          (bool isConnectedToInternet) => eventListener.onDisconnect(
              isConnectedToInternet
                  ? DisconnectSource.websocket
                  : DisconnectSource.internet));
    } else if (state is ConnectionErrorState) {
      eventListener.onConnectionError(state.error);
    }
  }
}
