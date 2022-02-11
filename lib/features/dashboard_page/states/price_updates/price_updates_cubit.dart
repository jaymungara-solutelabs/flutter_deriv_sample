import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/common/tick/exceptions/tick_exception.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_send.dart';
import 'package:flutter_deriv_sample/core/bloc_manager/event_listeners/active_symbols_event_listener.dart';

part 'price_updates_state.dart';

/// Price updates cubit for managing price update state.
class PriceUpdatesCubit extends Cubit<PriceUpdatesState>
    implements ActiveSymbolsEventListener {
  /// Initializes price updates state.
  PriceUpdatesCubit() : super(PriceUpdatesInitialState());

  /// fetch tick price updates based on selected symbol
  Future<void> subscribeToPriceUpdates(ActiveSymbol selectedSymbol) async {
    try {
      emit(PriceUpdatesLoadingState());
      await _unsubscribeTick();

      _subscribeTick(selectedSymbol)
          .handleError((dynamic error) => error is TickException
              ? emit(PriceUpdatesErrorState(error.message ?? ''))
              : emit(PriceUpdatesErrorState(error.toString())))
          .listen((Tick? tick) => emit(PriceUpdatesLoadedState(tick: tick)));
    } on Exception catch (e) {
      dev.log('$PriceUpdatesCubit subscribeToPriceUpdates() error: $e');

      emit(PriceUpdatesErrorState('$e'));
    }
  }

  Stream<Tick?> _subscribeTick(ActiveSymbol selectedSymbol) =>
      Tick.subscribeTick(TicksRequest(ticks: selectedSymbol.symbol));

  Future<ForgetAll> _unsubscribeTick() => Tick.unsubscribeAllTicks();

  @override
  Future<void> close() async {
    await _unsubscribeTick();

    await super.close();
  }

  @override
  void onActiveSymbolsError(String error) {}

  @override
  void onActiveSymbolsLoaded(
      List<ActiveSymbol>? activeSymbols, ActiveSymbol? selectedSymbol) {
    if (selectedSymbol != null) {
      subscribeToPriceUpdates(selectedSymbol);
    }
  }

  @override
  void onActiveSymbolsLoading() {}
}
