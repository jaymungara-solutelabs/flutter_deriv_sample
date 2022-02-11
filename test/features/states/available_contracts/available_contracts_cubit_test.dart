import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/sync_time/sync_time_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/available_contracts/available_contracts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'available_contracts_cubit_data.dart';

class MockAvailableContractsCubit extends MockCubit<AvailableContractsState>
    implements AvailableContractsCubit {}

class MockSyncTimeCubit extends MockCubit<SyncTimeState>
    implements SyncTimeCubit {
  @override
  DateTime get now => DateTime.now();
}

class FakeAvailableContractsState extends Fake
    implements AvailableContractsState {}

class FakeSyncTimeState extends Fake implements SyncTimeState {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeAvailableContractsState());
    registerFallbackValue(FakeSyncTimeState());
    BlocManager.instance.register<SyncTimeCubit>(MockSyncTimeCubit());
    APIInitializer().initialize(isMock: true);
  });

  group('active contracts cubit () => ', () {
    final AvailableContractsCubit availableContractsCubit =
        AvailableContractsCubit();
    blocTest<AvailableContractsCubit, AvailableContractsState>(
        'should fetch availableContracts () =>',
        build: () => availableContractsCubit,
        act: (AvailableContractsCubit a) =>
            a.fetchAvailableContracts(activeSymbol),
        verify: (AvailableContractsCubit cubit) async {
          final AvailableContractsLoadedState currentState =
              availableContractsCubit.state as AvailableContractsLoadedState;
          expect(currentState, isA<AvailableContractsLoadedState>());

          expect(currentState.contracts, isNotNull);
          expect(currentState.contracts, isA<ContractsForSymbol>());
        });

    final Exception exception =
        Exception('available contracts cubit exception.');
    blocTest<AvailableContractsCubit, AvailableContractsState>(
        'captures exceptions => (available_contracts_cubit).',
        build: () => AvailableContractsCubit(),
        act: (AvailableContractsCubit cubit) => cubit.addError(exception),
        errors: () => <Matcher>[equals(exception)]);

    blocTest<AvailableContractsCubit, AvailableContractsState>(
      'should fetch availableContracts with expect states () =>',
      build: () => AvailableContractsCubit(),
      act: (AvailableContractsCubit a) =>
          a.fetchAvailableContracts(activeSymbol),
      verify: (AvailableContractsCubit cubit) async {
        final AvailableContractsLoadedState currentState =
            availableContractsCubit.state as AvailableContractsLoadedState;
        expect(currentState, isA<AvailableContractsLoadedState>());

        expect(currentState.contracts, isNotNull);
        expect(currentState.contracts, isA<ContractsForSymbol>());
      },
      expect: () => <dynamic>[
        isA<AvailableContractsLoadingState>(),
        isA<AvailableContractsLoadedState>(),
      ],
    );
  });
}
