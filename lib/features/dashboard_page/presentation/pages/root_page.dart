import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as connection_cubit;
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/pages/dashboard_page.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/center_text_widget.dart';

/// RootPage which manages connection listening point
class RootPage extends StatefulWidget {
  /// Initialise RootPage
  const RootPage({Key? key}) : super(key: key);

  /// Route Page route name.
  static const String routeName = 'root_page';

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late connection_cubit.ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();

    _connectionCubit =
        BlocManager.instance.fetch<connection_cubit.ConnectionCubit>();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Dashboard Title')),
        body: BlocBuilder<connection_cubit.ConnectionCubit,
            connection_cubit.ConnectionState>(
          bloc: _connectionCubit,
          builder:
              (BuildContext context, connection_cubit.ConnectionState state) {
            if (state is connection_cubit.ConnectionConnectedState) {
              return const DashboardPage();
            } else if (state is connection_cubit.ConnectionInitialState ||
                state is connection_cubit.ConnectionConnectingState) {
              return const CenterTextWidget(title: 'Connecting...');
            } else if (state is connection_cubit.ConnectionErrorState) {
              return CenterTextWidget(
                  title: 'Connection Error\\n${state.error}');
            } else if (state is connection_cubit.ConnectionDisconnectedState) {
              return const CenterTextWidget(
                  title: 'Connection is down, trying to reconnect...');
            }

            return Container();
          },
        ),
      );
}
