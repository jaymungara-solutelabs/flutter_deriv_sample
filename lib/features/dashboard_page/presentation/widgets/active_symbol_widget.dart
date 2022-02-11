import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/custom_dropdown_menu.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/title_widget.dart';

/// Active Symbol Widget
class ActiveSymbolWidget extends StatefulWidget {
  /// Initialise Widget
  const ActiveSymbolWidget({Key? key}) : super(key: key);

  @override
  _ActiveSymbolWidgetState createState() => _ActiveSymbolWidgetState();
}

class _ActiveSymbolWidgetState extends State<ActiveSymbolWidget> {
  late final ActiveSymbolCubit _activeSymbolCubit;

  @override
  void initState() {
    super.initState();

    _initializeBlocs();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActiveSymbolCubit, ActiveSymbolState>(
          bloc: _activeSymbolCubit,
          builder: (BuildContext context, ActiveSymbolState state) {
            if (state is ActiveSymbolLoadingState) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            } else if (state is ActiveSymbolLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  const TitleWidget(title: 'Active Symbols'),
                  CustomDropdown(
                      initialItem: _activeSymbolCubit.selectedActiveSymbol,
                      items: _activeSymbolCubit.activeSymbols,
                      onItemSelected: (ActiveSymbol? i) {
                        _activeSymbolCubit.getSelectedActiveSymbol(i);
                      }),
                ],
              );
            } else if (state is ActiveSymbolErrorState) {
              dev.log(state.errorMessage);
            }

            return Container();
          });

  void _initializeBlocs() {
    _activeSymbolCubit = BlocManager.instance.fetch<ActiveSymbolCubit>();
    _activeSymbolCubit.fetchActiveSymbols();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<ActiveSymbolCubit>();
    super.dispose();
  }
}
