import 'package:flutter/material.dart';
import 'package:newsapp/pages/pages.dart';
import 'package:newsapp/services/news_services.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewServices(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: AppTheme.theme,
        home: const TabsScreen(),
      ),
    );
  }
}
