import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_deriv_sample/core/states/active_symbol/active_symbol_cubit.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/row_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/widgets/title_widget.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/states/available_contracts/available_contracts_cubit.dart';

/// Available Contracts Listing Widget
class AvailableContractsWidget extends StatefulWidget {
  /// Initialise Widget
  const AvailableContractsWidget({Key? key}) : super(key: key);

  @override
  _AvailableContractsWidgetState createState() =>
      _AvailableContractsWidgetState();
}

class _AvailableContractsWidgetState extends State<AvailableContractsWidget> {
  late final AvailableContractsCubit _availableContractsCubit;

  @override
  void initState() {
    super.initState();

    _initializeBlocs();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AvailableContractsCubit, AvailableContractsState>(
          bloc: _availableContractsCubit,
          builder: (BuildContext context, AvailableContractsState state) {
            if (state is AvailableContractsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AvailableContractsLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  const TitleWidget(title: 'Available Contracts'),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemBuilder: (BuildContext context, int index) {
                            final AvailableContractModel? item =
                                state.contracts?.availableContracts?[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
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
                                      title: 'Name',
                                      value: item?.exchangeName ?? ''),
                                  RowWidget(
                                      title: 'Market',
                                      value: item?.market ?? ''),
                                  RowWidget(
                                      title: 'Submarket',
                                      value: item?.submarket ?? ''),
                                ],
                              ),
                            );
                          },
                          itemCount:
                              state.contracts?.availableContracts?.length ?? 0,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true)),
                ],
              );
            } else if (state is AvailableContractsErrorState) {
              dev.log(state.errorMessage);
            }

            return Container();
          });

  void _initializeBlocs() {
    _availableContractsCubit =
        BlocManager.instance.fetch<AvailableContractsCubit>();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<ActiveSymbolCubit>();
    super.dispose();
  }
}
