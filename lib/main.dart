import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softbenz_task/views/product_detail_page.dart';
import 'package:softbenz_task/views/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        expansionTileTheme:
            const ExpansionTileThemeData(collapsedBackgroundColor: Color(0xFF03DAC6), collapsedTextColor: Colors.white),
        chipTheme: const ChipThemeData(
          side: BorderSide(color: Color.fromARGB(255, 2, 121, 172), width: 3),
        ),

        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 0, 119, 238),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 2, 121, 172),
          onSecondary: Colors.black,
          error: Color(0xFFB00020),
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Default icon color
          size: 24.0, // Default icon size
        ),
        // Define text theme with centralized text color and styles
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Title text color
          ),
          titleMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Title text color
          ),
          titleSmall: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            color: Colors.black54, // Subtitle color
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            color: Colors.black87, // Regular body text
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black54, // Smaller body text
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            color: Colors.black54, // Smaller body text
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const ProductDetailPage(productId: '233'),
      },
    );
  }
}
