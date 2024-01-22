import 'package:flutter/material.dart';
import 'package:news_app_2110020093/pages/home.page.dart';
import 'package:news_app_2110020093/providers/news.provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Berita',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
