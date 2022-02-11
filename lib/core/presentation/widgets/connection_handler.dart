// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
//     as connection_cubit;
// import 'package:flutter_deriv_bloc_manager/manager.dart';
//
// /// Class that handles the connection state of the app.
// ///
// /// It is responsible for showing a loading screen while the
// /// app is connecting to the server.
// class ConnectionHandler extends StatefulWidget {
//   /// Initializes the [ConnectionHandler] class.
//   const ConnectionHandler({required this.child, Key? key}) : super(key: key);
//
//   /// The [child] that is being wrapped by the [ConnectionHandler].
//   final Widget child;
//
//   @override
//   State<ConnectionHandler> createState() => _ConnectionHandlerState();
// }
//
// class _ConnectionHandlerState extends State<ConnectionHandler> {
//   late final connection_cubit.ConnectionCubit _connectionCubit;
//   bool _isOpen = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _initializeBlocs();
//   }
//
//   @override
//   Widget build(BuildContext context) => BlocListener<
//           connection_cubit.ConnectionCubit,
//           connection_cubit.ConnectionState>(
//       bloc: _connectionCubit,
//       listener: (_, connection_cubit.ConnectionState state) =>
//           _handleConnectionState(state),
//       child: widget.child);
//
//   void _handleConnectionState(connection_cubit.ConnectionState state) =>
//       state is connection_cubit.ConnectionConnectedState
//           ? _hideAlertDialog()
//           : _showAlertDialog();
//
//   void _showAlertDialog() {
//     _isOpen = true;
//     // show the dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) => AlertDialog(
//           title: const Text("AlertDialog"),
//           content: const Text(
//               "Would you like to continue
//               learning how to use Flutter alerts?"),
//           actions: <Widget>[
//             TextButton(
//                 child: const Text("Retry"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _connectionCubit.connect();
//                 }),
//           ],
//         ),
//     );
//   }
//
//   void _hideAlertDialog() {
//     if (_isOpen) {
//       Navigator.pop(context);
//
//       _isOpen = false;
//     }
//   }
//
//   void _initializeBlocs() {
//     _connectionCubit =
//         BlocManager.instance.fetch<connection_cubit.ConnectionCubit>();
//   }
// }
