import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/price_updates/price_updates_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../available_contracts/available_contracts_cubit_data.dart';

class MockPriceUpdatesCubit extends MockCubit<PriceUpdatesState>
    implements PriceUpdatesCubit {}

class FakeTickStreamState extends Fake implements PriceUpdatesState {}

void main() {
  group('tick stream test =>', () {
    setUpAll(() => registerFallbackValue(FakeTickStreamState()));

    // test('should fetch price updates stream.', () async {
    //   final MockPriceUpdatesCubit priceUpdateCubit = MockPriceUpdatesCubit();
    //
    //   whenListen(
    //     priceUpdateCubit,
    //     Stream<PriceUpdatesState>.fromIterable(
    //       <PriceUpdatesState>[
    //         PriceUpdatesInitialState(),
    //         PriceUpdatesLoadingState(),
    //         PriceUpdatesLoadedState(tick: ticks.first),
    //       ],
    //     ),
    //   );
    //
    //   await expectLater(
    //     priceUpdateCubit.stream,
    //     emitsInOrder(
    //       <dynamic>[
    //         isA<PriceUpdatesInitialState>(),
    //         isA<PriceUpdatesLoadingState>(),
    //         isA<PriceUpdatesLoadedState>(),
    //       ],
    //     ),
    //   );
    //
    //   final PriceUpdatesLoadedState currentState =
    //       priceUpdateCubit.state as PriceUpdatesLoadedState;
    //   expect(currentState, isA<PriceUpdatesLoadedState>());
    //
    //   expect(currentState.tick?.ask, 879.615);
    //   expect(currentState.tick?.bid, 879.573);
    //   expect(currentState.tick?.pipSize, 3);
    //   expect(currentState.tick?.quote, 879.594);
    // });

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
  });
}
