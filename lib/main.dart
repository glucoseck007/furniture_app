import 'package:easy_localization/easy_localization.dart';
import 'package:fair/fair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:furniture_app/core/theme/app_theme.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/widget/on-boarding/on_boarding_flow.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // Uncomment if needed

  FairApp.runApplication(
    FairApp(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'), // English
          Locale('vi', 'VN'), // Vietnamese
        ],
        path: 'assets/translations', // Path to your translation files
        fallbackLocale: const Locale('en', 'US'), // Fallback locale
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ],
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('vi', 'VN'), // Vietnamese
      ],
      localizationsDelegates: [
        EasyLocalization.of(context)!.delegate, // EasyLocalization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.lightTheme, // Define light theme from AppTheme
      darkTheme: AppTheme.darkTheme, // Define dark theme from AppTheme
      themeMode: themeProvider.isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light, // Apply theme based on ThemeProvider
      home: const OnBoardingFlow(), // Home screen of the app
    );
  }
}
