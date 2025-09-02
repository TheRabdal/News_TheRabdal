import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_app/screens/login.dart';
import 'package:interview_app/services/secure_storage_service.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  final container = ProviderContainer();
  final secureStorage = container.read(secureStorageServiceProvider);
  const apiKey = '202855be2c954c73868c740c5d249326';
  final storedKey = await secureStorage.read('api_key');
  if (storedKey == null) {
    await secureStorage.write('api_key', apiKey);
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
