import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peerview/core/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


import 'package:peerview/services/firebase/auth_service.dart';
import 'package:peerview/services/firebase/user_service.dart';
import 'package:peerview/viewmodels/session_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => UserService()),
        ChangeNotifierProvider(
          create: (context) => SessionViewModel(
            context.read<AuthService>(), 
            context.read<UserService>(),
          )..init(),
        ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Color(0xff2953B3)),
          trackColor: WidgetStatePropertyAll(Color(0xffEBEBEB))
        )
      ),
      title: 'Peerview',
      // initialRoute: '/login',
      initialRoute: '/gate',
      routes: AppRoutes.routes,
    );
  }
}