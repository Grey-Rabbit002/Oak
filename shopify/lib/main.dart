import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/screens/splashScreen/splash_screen1.dart';
import 'package:shopify/theme/pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'InternShip Task',
        debugShowCheckedModeBanner: false,
        theme: Pallete.lightModeAppTheme,
        home: const SplashScreen1(),
      ),
    );
  }
}
