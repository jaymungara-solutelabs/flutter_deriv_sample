import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/center_text_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/custom_dropdown_menu.dart';
import 'package:flutter_deriv_sample/generated/l10n.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  /// Route Page route name.
  static const String routeName = 'dashboard_page';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final ActiveSymbolCubit _activeSymbolCubit;

  @override
  void initState() {
    super.initState();

    _initializeBlocs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveSymbolCubit, ActiveSymbolState>(
        // bloc: BlocManager.instance.fetch<ActiveSymbolCubit>(),
        bloc: _activeSymbolCubit,
        builder: (BuildContext context, ActiveSymbolState state) {
          if (state is ActiveSymbolLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ActiveSymbolLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomDropdown(
                    initialItem: _activeSymbolCubit.selectedActiveSymbol,
                    items: _activeSymbolCubit.activeSymbols,
                    onItemSelected: (ActiveSymbol? i) {
                      _activeSymbolCubit.getSelectedActiveSymbol(i);
                    }),
              ],
            );
          } else if (state is ActiveSymbolErrorState) {
            return CenterTextWidget(
                title: S.of(context).connection_error(state.errorMessage));
          }

          return Container();
        });
  }

  void _initializeBlocs() {
    _activeSymbolCubit = BlocManager.instance.fetch<ActiveSymbolCubit>();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<ActiveSymbolCubit>();
    super.dispose();
  }
}
