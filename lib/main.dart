import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/boxes/boxes.dart';
import 'package:smart_home_app/provider/home.dart';
import 'package:smart_home_app/provider/search.dart';
import 'package:smart_home_app/view/central.dart';

Future<void> main() async {
  // Ensure that the Flutter bindings are properly initialized before any other Flutter-related
  // operations are performed. Provides a stable and consistent environment for Flutter app execution.
  // "bindings" refer to the connection between the Dart code and the underlying platform-specific code (e.g., Android and iOS).
  WidgetsFlutterBinding.ensureInitialized();

  // Get the application documents directory
  final directory = await getApplicationDocumentsDirectory();

  // Initialize Hive with the directory path
  Hive.init(directory.path);

  // Open the Hive box when the app starts
  await Boxes.openBox();

  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:
        Colors.transparent, // Set the status bar color to transparent
    systemNavigationBarColor:
        Colors.transparent, // Set the systemNavigation bar color to transparent
  ));

  // Set the preferred screen orientations for the app (portrait mode only)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchProvider>(
            create: (context) => SearchProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Home App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff211D1D),
          useMaterial3: true,
        ),
        home: const CentralScreen(),
      ),
    );
  }
}
