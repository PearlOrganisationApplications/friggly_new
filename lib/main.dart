import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friggly/app/constants/apptheme.dart';
import 'package:friggly/app/providers/appproviders.dart';
import 'package:friggly/core/notifire/themenotifire.dart';
import 'package:friggly/presentation/loginscreen/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((dynamic taskName, dynamic inputData) async {
    try {
      final Iterable<CallLogEntry> clog = await CallLog.get();
      for (CallLogEntry entry in clog) {}
      return true;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return true;
    }
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyThemeData());
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

class MyThemeData extends StatelessWidget {
  const MyThemeData({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Friggly",
          theme: ThemeData(useMaterial3: true),
          home: const LoginPage(),
        );
      },
    );
  }
}
