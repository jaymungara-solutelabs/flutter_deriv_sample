import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/exceptions/contract_for_symbol_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';

part 'available_contracts_state.dart';

/// Active symbol cubit for managing active symbol state.
class AvailableContractsCubit extends Cubit<AvailableContractsState> {
  /// Initializes active symbol state.
  AvailableContractsCubit() : super(AvailableContractsInitialState()) {
    // fetchAvailableContracts();
  }

  Future<void> fetchAvailableContracts(ActiveSymbol selectedSymbol) async {
    emit(AvailableContractsLoadingState());

    try {
      final ContractsForSymbol contracts =
          await _fetchAvailableContracts(selectedSymbol);

      emit(AvailableContractsLoadedState(contracts: contracts));
    } on ContractsForSymbolException catch (error) {
      emit(AvailableContractsErrorState(error.message ?? ''));
    }
  }

  Future<ContractsForSymbol> _fetchAvailableContracts(
          ActiveSymbol selectedSymbol) async =>
      ContractsForSymbol.fetchContractsForSymbol(
          ContractsForRequest(contractsFor: selectedSymbol.symbol));
}
