import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as connection_cubit;
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/pages/dashboard_page.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/center_text_widget.dart';
import 'package:flutter_deriv_sample/generated/l10n.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  /// Dashboard Page route name.
  static const String routeName = 'root_page';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).dashboardTitle)),
      body: BlocBuilder<connection_cubit.ConnectionCubit, connection_cubit.ConnectionState>(
        builder:
            (BuildContext context, connection_cubit.ConnectionState state) {
          if (state is connection_cubit.ConnectionConnectedState) {
            return const DashboardPage();
          } else if (state is connection_cubit.ConnectionInitialState ||
              state is connection_cubit.ConnectionConnectingState) {
            return CenterTextWidget(title: S.of(context).connecting);
          } else if (state is connection_cubit.ConnectionErrorState) {
            return CenterTextWidget(title: S.of(context).connection_error(state.error));
          } else if (state is connection_cubit.ConnectionDisconnectedState) {
            return CenterTextWidget(title: S.of(context).connection_down);
          }

          return Container();
        },
      ),
    );
  }
}