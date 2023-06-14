import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/core/app.dart';
import 'package:riverpod_state_management/core/network/local/hive_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  runApp(
    const ProviderScope(child: App()),
  );
}
