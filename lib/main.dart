import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pdf_online/common/configs.dart';
import 'package:pdf_online/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: Configs.baseUrl,
    anonKey: Configs.baseKey,
  );
  runApp(const MyApp());
}
