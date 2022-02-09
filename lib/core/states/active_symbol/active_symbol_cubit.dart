import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/common/asset_index/asset_index.dart';
import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'active_symbol_state.dart';

/// Active symbol cubit for managing active symbol state.
class ActiveSymbolCubit extends Cubit<ActiveSymbolState> {
  /// Initializes active symbol state.
  ActiveSymbolCubit() : super(ActiveSymbolInitialState()) {
    fetchActiveSymbols(showLoadingIndicator: true);
  }

  static const String _multiplierContractCode = 'multiplier';
  static const String _activeSymbolType = 'brief';
  static const String _productType = 'basic';

  List<ActiveSymbol> _activeSymbols = <ActiveSymbol>[];
  ActiveSymbol? _selectedActiveSymbol;

  ActiveSymbol? get selectedActiveSymbol => _selectedActiveSymbol;
  List<ActiveSymbol> get activeSymbols => _activeSymbols;

  // Select Active Symbol
  getSelectedActiveSymbol(int index) {
    emit(ActiveSymbolLoadedState(
        activeSymbols: _activeSymbols, selectedSymbol: _activeSymbols[index]));
  }

  /// Fetches active symbols list.
  Future<void> fetchActiveSymbols({bool showLoadingIndicator = true}) async {
    try {
      if (showLoadingIndicator) {
        emit(ActiveSymbolLoadingState());
      }

      // final List<ActiveSymbol> activeSymbols = await _getMultiplierActiveSymbols();
      _activeSymbols = await _getMultiplierActiveSymbols();
      _activeSymbols.toSet().toList();
      emit(ActiveSymbolLoadedState(activeSymbols: _activeSymbols));
    } on Exception catch (e) {
      dev.log('$ActiveSymbolCubit fetchActiveSymbols() error: $e');

      emit(ActiveSymbolErrorState('$e'));
    }
  }

  Future<List<ActiveSymbol>> _getMultiplierActiveSymbols() async {
    final List<ActiveSymbol> multiplierActiveSymbols = <ActiveSymbol>[];
    final List<ActiveSymbol> activeSymbols = await _fetchActiveSymbols();
    final List<AssetIndex?>? assetIndices = await _fetchAssetIndexes();

    for (final ActiveSymbol activeSymbol in activeSymbols) {
      final AssetIndex? assetIndex = assetIndices?.firstWhere(
          (final AssetIndex? assetIndex) =>
              assetIndex?.symbolCode == activeSymbol.symbol);

      final bool? hasContract = assetIndex?.contracts
          ?.where((final IndexContractModel? contract) =>
              contract?.contractTypeCode == _multiplierContractCode)
          .isNotEmpty;

      if (hasContract ?? false) {
        multiplierActiveSymbols.add(activeSymbol);
      }
    }

    return multiplierActiveSymbols;
  }

  Future<List<ActiveSymbol>> _fetchActiveSymbols() =>
      ActiveSymbol.fetchActiveSymbols(const ActiveSymbolsRequest(
          activeSymbols: _activeSymbolType, productType: _productType));

  Future<List<AssetIndex?>?> _fetchAssetIndexes() =>
      AssetIndex.fetchAssetIndices(const AssetIndexRequest());
}
