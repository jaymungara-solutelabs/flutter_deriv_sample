import 'package:flutter/material.dart';
import 'package:flutter_deriv_sample/features/dashboard_page/presentation/pages/root_page.dart';

/// Main Page where users can manage the app task
class App extends StatefulWidget {
  /// Initializes [App]
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Mobile Test',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      navigatorKey: _navigatorKey,
      routes: <String, WidgetBuilder>{
        RootPage.routeName: (BuildContext context) => const RootPage(),
      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const RootPage()),
      initialRoute: RootPage.routeName);
}
