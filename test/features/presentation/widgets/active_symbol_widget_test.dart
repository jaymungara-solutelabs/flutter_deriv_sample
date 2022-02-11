import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/active_symbol_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/custom_dropdown_menu.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/title_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Active symbols widget test =>', () {
    setUpAll(() {
      BlocManager.instance
        ..register(ConnectionCubit(
            ConnectionInformation(brand: '', appId: '', endpoint: ''),
            isMock: true))
        ..register(ActiveSymbolCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<ConnectionCubit>();
      BlocManager.instance.dispose<ActiveSymbolCubit>();
    });

    testWidgets('Widget exists', (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(TitleWidget), findsOneWidget);
      expect(find.byType(CustomDropdown), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: Scaffold(body: ActiveSymbolWidget()));
}
