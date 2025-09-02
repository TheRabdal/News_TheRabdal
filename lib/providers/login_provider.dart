import 'package:flutter_riverpod/flutter_riverpod.dart';

// A simple provider to manage the loading state of the login button
final loginLoadingProvider = StateProvider<bool>((ref) => false);
