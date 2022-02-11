import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/available_contracts_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/row_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/available_contracts/available_contracts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Available contracts widget test =>', () {
    setUpAll(() {
      BlocManager.instance
        ..register(ConnectionCubit(
            ConnectionInformation(brand: '', appId: '', endpoint: ''),
            isMock: true))
        ..register(AvailableContractsCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<ConnectionCubit>();
      BlocManager.instance.dispose<AvailableContractsCubit>();
    });

    testWidgets('Widget exists', (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      await tester.idle();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RowWidget), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: Scaffold(body: AvailableContractsWidget()));
}
