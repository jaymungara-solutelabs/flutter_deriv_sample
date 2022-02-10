part of 'price_updates_cubit.dart';

/// Base state for price updates
abstract class PriceUpdatesState {}

/// price updates initial state
class PriceUpdatesInitialState extends PriceUpdatesState {}

/// price updates loading state
class PriceUpdatesLoadingState extends PriceUpdatesState {}

/// price updates loaded state
class PriceUpdatesLoadedState extends PriceUpdatesState {
  /// Initializes
  PriceUpdatesLoadedState({required this.tick});

  final Tick? tick;
}

/// price updates error state
class PriceUpdatesErrorState extends PriceUpdatesState {
  /// Initializes
  PriceUpdatesErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
