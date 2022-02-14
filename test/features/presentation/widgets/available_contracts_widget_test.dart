import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/row_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/title_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/available_contracts/available_contracts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../states/available_contracts/available_contracts_cubit_data.dart';

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

      expect(find.byType(TitleWidget), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);
    });
  });
}

class _TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      // const MaterialApp(home: Scaffold(body: AvailableContractsWidget()));
      MaterialApp(
          home: Scaffold(
              body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const TitleWidget(title: 'Available Contracts'),
          Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemBuilder: (BuildContext context, int index) {
                    final AvailableContractModel? item =
                        availableContracts[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6,
                                spreadRadius: 2)
                          ]),
                      child: Column(
                        children: <Widget>[
                          RowWidget(
                              title: 'Category',
                              value: item?.contractCategory ?? ''),
                          RowWidget(
                              title: 'Name', value: item?.exchangeName ?? ''),
                          RowWidget(title: 'Market', value: item?.market ?? ''),
                          RowWidget(
                              title: 'Submarket', value: item?.submarket ?? ''),
                        ],
                      ),
                    );
                  },
                  itemCount: availableContracts.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true)),
        ],
      )));
}
