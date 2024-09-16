import "package:dasarata_mobile/env/env.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
