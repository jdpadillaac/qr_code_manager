import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_manager/app_module.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus && focusScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        title: 'Qr code manager',
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        theme: ThemeData(
          scaffoldBackgroundColor: QcmColors.darkGunmeta,
          textTheme: GoogleFonts.manropeTextTheme().copyWith(
            headlineMedium: GoogleFonts.manrope().copyWith(
              color: QcmColors.white,
              fontWeight: FontWeight.w900,
            ),
            bodyLarge: GoogleFonts.manrope().copyWith(
              color: QcmColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            titleMedium: GoogleFonts.manrope().copyWith(color: QcmColors.white),
            titleLarge: GoogleFonts.manrope().copyWith(color: QcmColors.white),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: QcmColors.darkGunmeta,
            iconTheme: IconThemeData(color: QcmColors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: QcmColors.darkJungleGreen,
            labelStyle: const TextStyle(color: QcmColors.white),
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: QcmColors.auroMetalSaurus),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: QcmColors.white,
            selectionColor: QcmColors.white,
            selectionHandleColor: QcmColors.white,
          ),
          iconTheme: const IconThemeData(color: QcmColors.white),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
