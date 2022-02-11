part of 'available_contracts_cubit.dart';

/// Base state for available contracts
abstract class AvailableContractsState {}

/// available contracts initial state
class AvailableContractsInitialState extends AvailableContractsState {}

/// available contracts loading state
class AvailableContractsLoadingState extends AvailableContractsState {}

/// available contracts loaded state
class AvailableContractsLoadedState extends AvailableContractsState {
  /// Initializes
  AvailableContractsLoadedState({required this.contracts});

  /// contracts
  final ContractsForSymbol? contracts;
}

/// available contracts error state
class AvailableContractsErrorState extends AvailableContractsState {
  /// Initializes
  AvailableContractsErrorState(this.errorMessage);

  /// Error message
  final String errorMessage;
}
