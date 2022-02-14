import 'dart:developer' as dev;

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/sync_time/sync_time_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/price_updates/price_updates_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../available_contracts/available_contracts_cubit_data.dart';
import 'price_updates_cubit_data.dart';

class MockPriceUpdatesCubit extends MockCubit<PriceUpdatesState>
    implements PriceUpdatesCubit {}

class MockSyncTimeCubit extends MockCubit<SyncTimeState>
    implements SyncTimeCubit {
  @override
  DateTime get now => DateTime.now();
}

class FakePriceUpdatesState extends Fake implements PriceUpdatesState {}

class FakeSyncTimeState extends Fake implements SyncTimeState {}

void main() {
  group('price updates stream test =>', () {
    setUpAll(() {
      registerFallbackValue(FakePriceUpdatesState());
      registerFallbackValue(FakeSyncTimeState());
      BlocManager.instance.register<SyncTimeCubit>(MockSyncTimeCubit());
      APIInitializer().initialize(isMock: true);
    });

    final Exception exception = Exception('Price Update Cubit Exception.');

    blocTest<PriceUpdatesCubit, PriceUpdatesState>(
      'captures exceptions.',
      build: () => PriceUpdatesCubit(),
      act: (PriceUpdatesCubit cubit) => cubit.addError(exception),
      errors: () => <Matcher>[equals(exception)],
    );

    final PriceUpdatesCubit priceUpdatesCubit = PriceUpdatesCubit();
    blocTest<PriceUpdatesCubit, PriceUpdatesState>(
      'should fetch price updates with expect states () =>',
      build: () => priceUpdatesCubit,
      act: (PriceUpdatesCubit a) => a.subscribeToPriceUpdates(activeSymbol),
      verify: (PriceUpdatesCubit cubit) async {
        final PriceUpdatesLoadedState currentState =
            priceUpdatesCubit.state as PriceUpdatesLoadedState;
        expect(currentState, isA<PriceUpdatesLoadedState>());

        expect(currentState.tick, isNotNull);
        expect(currentState.tick, isA<Tick>());
      },
      expect: () => <dynamic>[
        isA<PriceUpdatesLoadingState>(),
        isA<PriceUpdatesLoadedState>(),
      ],
    );

    final PriceUpdatesCubit priceUpdatesCubit2 = PriceUpdatesCubit();
    blocTest<PriceUpdatesCubit, PriceUpdatesState>(
      'Stream test for price updates () =>',
      build: () => priceUpdatesCubit2,
      verify: (PriceUpdatesCubit cubit) {
        final PriceUpdatesLoadedState currentState =
            priceUpdatesCubit2.state as PriceUpdatesLoadedState;
        expect(currentState, isA<PriceUpdatesLoadedState>());

        expect(currentState.tick, isNotNull);
        expect(currentState.tick, isA<Tick>());

        dev.log('currentState.tick?.ask : ${currentState.tick?.ask}');
        expect(currentState.tick?.ask, 879.7885);
      },
      act: (PriceUpdatesCubit cubit) async {
        for (final Tick element in ticks) {
          cubit.emit(PriceUpdatesLoadedState(tick: element));
        }
      },
    );
  });
}
