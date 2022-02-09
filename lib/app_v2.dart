// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
// import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
// import 'package:flutter_deriv_sample/features/dashboard_page/presentation/pages/root_page.dart';
// import 'package:flutter_deriv_sample/generated/l10n.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   _AppState createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   late ConnectionCubit _connectionCubit;
//
//   @override
//   void dispose() {
//     _connectionCubit.close();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     _connectionCubit = ConnectionCubit(ConnectionInformation(
//         appId: '1089', brand: 'binary', endpoint: 'frontend.binaryws.com'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: <BlocProvider<dynamic>>[
//           BlocProvider<ConnectionCubit>.value(value: _connectionCubit),
//         ],
//         child: MaterialApp(
//             title: 'Flutter Mobile Test',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//                 primarySwatch: Colors.blue, brightness: Brightness.light),
//             localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
//               S.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: S.delegate.supportedLocales,
//             navigatorKey: _navigatorKey,
//             routes: <String, WidgetBuilder>{
//               RootPage.routeName: (BuildContext context) => const RootPage(),
//             },
//             onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
//                 settings: settings,
//                 builder: (BuildContext context) => const RootPage()),
//             initialRoute: RootPage.routeName));
//   }
// }
