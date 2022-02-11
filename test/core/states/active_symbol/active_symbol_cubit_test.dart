import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';
import 'package:flutter_deriv_sample/core/states/sync_time/sync_time_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'active_symbol_cubit_data.dart';

class MockActiveSymbolCubit extends MockCubit<ActiveSymbolState>
    implements ActiveSymbolCubit {}

class MockSyncTimeCubit extends MockCubit<SyncTimeState>
    implements SyncTimeCubit {
  @override
  DateTime get now => DateTime.now();
}

class FakeActiveSymbolState extends Fake implements ActiveSymbolState {}

class FakeSyncTimeState extends Fake implements SyncTimeState {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeActiveSymbolState());
    registerFallbackValue(FakeSyncTimeState());

    BlocManager.instance.register<SyncTimeCubit>(MockSyncTimeCubit());
    APIInitializer().initialize(isMock: true);
  });

  group('active symbols test =>', () {
    test('should fetch active symbols.', () async {
      final MockActiveSymbolCubit activeSymbolCubit = MockActiveSymbolCubit();

      whenListen(
          activeSymbolCubit,
          Stream<ActiveSymbolState>.fromIterable(<ActiveSymbolState>[
            ActiveSymbolInitialState(),
            ActiveSymbolLoadingState(),
            ActiveSymbolLoadedState(
                activeSymbols: activeSymbols,
                selectedSymbol: activeSymbols.first)
          ]));

      await expectLater(
          activeSymbolCubit.stream,
          emitsInOrder(<dynamic>[
            isA<ActiveSymbolInitialState>(),
            isA<ActiveSymbolLoadingState>(),
            isA<ActiveSymbolLoadedState>(),
          ]));

      final ActiveSymbolLoadedState currentState =
          activeSymbolCubit.state as ActiveSymbolLoadedState;
      expect(currentState, isA<ActiveSymbolLoadedState>());

      expect(currentState.activeSymbols, isNotNull);
      expect(currentState.activeSymbols, isA<List<ActiveSymbol>>());

      expect(currentState.selectedSymbol, isNotNull);
      expect(currentState.selectedSymbol, isA<ActiveSymbol>());
    });

    final Exception exception = Exception('active symbol cubit exception.');
    blocTest<ActiveSymbolCubit, ActiveSymbolState>(
        'captures exceptions => (active_symbols_cubit).',
        build: () => ActiveSymbolCubit(),
        act: (ActiveSymbolCubit cubit) => cubit.addError(exception),
        errors: () => <Matcher>[equals(exception)]);
  });
}
