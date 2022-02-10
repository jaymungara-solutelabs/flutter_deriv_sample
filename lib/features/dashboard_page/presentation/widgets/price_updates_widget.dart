import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/row_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/price_updates/price_updates_cubit.dart';
import 'package:flutter_deriv_sample/generated/l10n.dart';
import 'dart:developer' as dev;

class PriceUpdatesWidget extends StatefulWidget {
  const PriceUpdatesWidget({Key? key}) : super(key: key);

  @override
  _PriceUpdatesWidgetState createState() => _PriceUpdatesWidgetState();
}

class _PriceUpdatesWidgetState extends State<PriceUpdatesWidget> {
  late final PriceUpdatesCubit _priceUpdateCubit;
  double? _lastTickValue = 0;

  @override
  void initState() {
    super.initState();

    _initializeBlocs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceUpdatesCubit, PriceUpdatesState>(
        bloc: _priceUpdateCubit,
        builder: (BuildContext context, PriceUpdatesState state) {
          if (state is PriceUpdatesLoadedState) {
            final Color tickColor = state.tick!.ask! > _lastTickValue!
                ? Colors.green
                : state.tick!.ask == _lastTickValue
                    ? Colors.black
                    : Colors.red;
            _lastTickValue = state.tick!.ask;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RowWidget(
                    title: S.of(context).symbol_name,
                    value: state.tick?.symbol ?? ''),
                RowWidget(
                    title: S.of(context).price,
                    value: "${state.tick?.ask?.toStringAsFixed(5)}",
                    color: tickColor),
              ],
            );
          } else if (state is PriceUpdatesErrorState) {
            dev.log(state.errorMessage);
          }

          return Container();
        });
  }

  void _initializeBlocs() {
    _priceUpdateCubit = BlocManager.instance.fetch<PriceUpdatesCubit>();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<PriceUpdatesCubit>();
    super.dispose();
  }
}
