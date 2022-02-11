import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

final List<ActiveSymbol> activeSymbols = <ActiveSymbol>[
  ActiveSymbol(
    allowForwardStarting: false,
    displayName: 'AUD Index',
    exchangeIsOpen: true,
    isTradingSuspended: false,
    market: 'forex',
    marketDisplayName: 'Forex',
    pip: 0.001,
    submarket: 'smart_fx',
    submarketDisplayName: 'Smart FX',
    symbol: 'WLDAUD',
    symbolType: 'smart_fx',
  ),
  ActiveSymbol(
    allowForwardStarting: true,
    displayName: 'AUD/JPY',
    exchangeIsOpen: true,
    isTradingSuspended: false,
    market: 'forex',
    marketDisplayName: 'Forex',
    pip: 0.001,
    submarket: 'major_pairs',
    submarketDisplayName: 'Major Pairs',
    symbol: 'frxAUDJPY',
    symbolType: 'forex',
  ),
  ActiveSymbol(
    allowForwardStarting: true,
    displayName: 'AUD/USD',
    exchangeIsOpen: true,
    isTradingSuspended: false,
    market: 'forex',
    marketDisplayName: 'Forex',
    pip: 0.00001,
    submarket: 'major_pairs',
    submarketDisplayName: 'Major Pairs',
    symbol: 'frxAUDUSD',
    symbolType: 'forex',
  )
];
