import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_deriv_sample/core/enums.dart';

/// Interface for blocs that need Deriv Connection status.
abstract class ConnectionEventListener implements BaseEventListener {
  /// On web socket connected event handler.
  void onConnected();

  /// On web socket disconnected event handler.
  void onDisconnect(DisconnectSource source);

  /// On web socket connection error event handler.
  void onConnectionError(String error);
}
