import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

/// Interface for blocs that need ActiveSymbols.
abstract class ActiveSymbolsEventListener implements BaseEventListener {
  /// on ActiveSymbols loaded event handler.
  void onActiveSymbolsLoaded(final List<ActiveSymbol>? activeSymbols);

  /// on ActiveSymbols loading event handler.
  void onActiveSymbolsLoading();

  /// On ActiveSymbols error event handler.
  void onActiveSymbolsError(String error);
}
