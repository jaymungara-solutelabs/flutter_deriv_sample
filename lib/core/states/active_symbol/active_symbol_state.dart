part of 'active_symbol_cubit.dart';

/// Base state for active symbol
abstract class ActiveSymbolState {}

/// Active symbol initial state
class ActiveSymbolInitialState extends ActiveSymbolState {}

/// Active symbol loading state
class ActiveSymbolLoadingState extends ActiveSymbolState {}

/// Active symbol loaded state
class ActiveSymbolLoadedState extends ActiveSymbolState {
  /// Initializes
  ActiveSymbolLoadedState({
    required this.activeSymbols,
    ActiveSymbol? selectedSymbol,
  }) : _selectedSymbol = selectedSymbol ?? activeSymbols?.first;

  /// Active symbols
  final List<ActiveSymbol>? activeSymbols;

  final ActiveSymbol? _selectedSymbol;

  /// Selected symbol
  ActiveSymbol? get selectedSymbol => _selectedSymbol;
}

/// Active symbol error state
class ActiveSymbolErrorState extends ActiveSymbolState {
  /// Initializes
  ActiveSymbolErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
