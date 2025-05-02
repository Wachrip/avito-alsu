import 'package:avito_test/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drive_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Drive.kg',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const DriveApp(),
        );
      },
    );
  }
}

class DriveApp extends StatelessWidget {
  const DriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Тема:'),
                const SizedBox(width: 8),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (_) {
                        themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.dark_mode,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ),
          const Expanded(child: DriveScreen()),
        ],
      ),
    );
  }
}
