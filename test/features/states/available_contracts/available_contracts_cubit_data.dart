import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';

final ActiveSymbol activeSymbol = ActiveSymbol(
  allowForwardStarting: false,
  displayName: 'BTC/USD',
  exchangeIsOpen: true,
  isTradingSuspended: false,
  market: 'cryptocurrency',
  marketDisplayName: 'Cryptocurrencies',
  pip: 0.001,
  submarket: 'non_stable_coin',
  submarketDisplayName: 'Cryptocurrencies',
  symbol: 'cryBTCUSD',
  symbolType: 'cryptocurrency',
);

final ContractsForSymbol contractsForSymbol = ContractsForSymbol(
    availableContracts: availableContracts,
    close: DateTime(2022, 02, 11, 5, 29, 59),
    feedLicense: 'realtime',
    hitCount: 2,
    open: DateTime(2022, 02, 11, 5, 30),
    spot: 42927.062);

final List<AvailableContractModel> availableContracts =
    <AvailableContractModel>[
  AvailableContractModel(
      barrier: 'null',
      barrierCategory: 'american',
      barriers: 0,
      contractCategory: 'multiplier',
      contractCategoryDisplay: 'Multiply Up/Multiply Down',
      contractDisplay: 'Multiply Up',
      contractType: 'MULTUP',
      exchangeName: 'CRYPTOCURRENCY',
      expiryType: 'no_expiry',
      market: 'cryptocurrency',
      maxContractDuration: '0',
      minContractDuration: '0',
      multiplierRange: <int>[10, 20, 30, 40, 50],
      sentiment: 'up',
      startType: 'spot',
      submarket: 'non_stable_coin',
      underlyingSymbol: 'cryBTCUSD'),
  AvailableContractModel(
      barrier: 'null',
      barrierCategory: 'american',
      barriers: 0,
      contractCategory: 'multiplier',
      contractCategoryDisplay: 'Multiply Up/Multiply Down',
      contractDisplay: 'Multiply Down',
      contractType: 'MULTDOWN',
      exchangeName: 'CRYPTOCURRENCY',
      expiryType: 'no_expiry',
      market: 'cryptocurrency',
      maxContractDuration: '0',
      minContractDuration: '0',
      multiplierRange: <int>[10, 20, 30, 40, 50],
      sentiment: 'down',
      startType: 'spot',
      submarket: 'non_stable_coin',
      underlyingSymbol: 'cryBTCUSD')
];
