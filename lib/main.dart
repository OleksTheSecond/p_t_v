import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:p_t_v/providers/books_provider.dart';
import 'package:p_t_v/widgets/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeData theme = await initTheme();

  runApp(MainApp(
    themeData: theme,
  ));
}

Future<ThemeData> initTheme() async {
  final themeStr = await rootBundle.loadString('assets/theme.json');
  final themeJson = jsonDecode(themeStr);
  final ThemeData theme = ThemeDecoder.decodeThemeData(themeJson)!;
  return theme;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.themeData});
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BooksProvider()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomeScreen(
          title: "PDFToVoice",
        ),
      ),
    );
  }
}
