import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/row_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/price_updates/price_updates_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../states/price_updates/price_updates_cubit_data.dart';

void main() {
  group('Price updates widget test =>', () {
    setUpAll(() {
      BlocManager.instance
        ..register(ConnectionCubit(
            ConnectionInformation(brand: '', appId: '', endpoint: ''),
            isMock: true))
        ..register(PriceUpdatesCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<ConnectionCubit>();
      BlocManager.instance.dispose<PriceUpdatesCubit>();
    });

    testWidgets('Widget exists', (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsOneWidget);
      expect(find.text('Symbol Name'), findsOneWidget);
      expect(find.text('Price'), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      // const MaterialApp(home: Scaffold(body: PriceUpdatesWidget()));
      MaterialApp(
          home: Scaffold(
              body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RowWidget(title: 'Symbol Name', value: '${ticks.first.ask ?? 0.211}'),
          RowWidget(
              title: 'Price', value: '${ticks.first.ask?.toStringAsFixed(5)}'),
        ],
      )));
}
