import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/active_symbols_event_listener.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';

/// Active symbols state emitter.
class ActiveSymbolsStateEmitter
    extends BaseStateEmitter<ActiveSymbolsEventListener, ActiveSymbolCubit> {
  /// Initializes Active symbols state emitter.
  ActiveSymbolsStateEmitter(BaseBlocManager blocManager) : super(blocManager);

  @override
  void handleStates({
    required ActiveSymbolsEventListener eventListener,
    required Object state,
  }) {
    if (state is ActiveSymbolLoadedState) {
      eventListener.onActiveSymbolsLoaded(
          state.activeSymbols, state.selectedSymbol);
    } else if (state is ActiveSymbolLoadingState) {
      eventListener.onActiveSymbolsLoading();
    } else if (state is ActiveSymbolErrorState) {
      eventListener.onActiveSymbolsError(state.errorMessage);
    }
  }
}
