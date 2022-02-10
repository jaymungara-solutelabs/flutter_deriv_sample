import 'package:flutter/material.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/available_contracts_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/active_symbol_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/price_updates_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  /// Route Page route name.
  static const String routeName = 'dashboard_page';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ActiveSymbolWidget(),
        PriceUpdatesWidget(),
        Expanded(child: AvailableContractsWidget())
      ],
    );
  }
}
