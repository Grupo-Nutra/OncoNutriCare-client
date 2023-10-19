import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:onconutricare/models/nutritionist/nutritionist.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'color_schemes.g.dart';
import 'firebase_options.dart';

import '.env';
import 'utils/firebase_helper.dart';
import 'views/pages/home/home.dart';
import 'views/pages/login.dart';
import 'views/pages/signup.dart';

final log = Logger('ONC_client');
final transaction = Sentry.startTransaction('processOrderBatch()', 'task');

GetIt getIt = GetIt.instance;

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getIt.registerSingleton<Nutritionist>(
    Nutritionist(),
    signalsReady: true,
  );

  await SentryFlutter.init(
    (options) {
      options.dsn = OPTIONS_DSN;
      options.addIntegration(LoggingIntegration());
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor blueOcean = const MaterialColor(
    0xFF002F3B,
    <int, Color>{
      50: Color(0xFF002F3B),
      100: Color(0xFF002F3B),
      200: Color(0xFF002F3B),
      300: Color(0xFF002F3B),
      400: Color(0xFF002F3B),
      500: Color(0xFF002F3B),
      600: Color(0xFF002F3B),
      700: Color(0xFF002F3B),
      800: Color(0xFF002F3B),
      900: Color(0xFF002F3B),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onco Nutri Care',
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _loading = true;

  void _incrementCounter() async {
    Logger.root.level = Level.INFO;

    log.finest('finest');
    log.finer('finer');
    log.fine('fine');
    log.info('info');
    log.config('config');
    log.warning('warning');
    log.severe('severe');
    log.shout('shout');

    try {
      throw Exception();
    } catch (error, stackTrace) {
      log.severe('an error!', error, stackTrace);
    }
  }

  @override
  void initState() {
    super.initState();

    _verifyUser();
  }

  _verifyUser() async {
    final logged = await FirebaseHelper().isLoggedIn();
    final Nutritionist user = getIt<Nutritionist>();
    if (logged != null) {
      user.setNutritionistLogged(logged);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loading ? const CircularProgressIndicator() : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
