import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ja'), Locale('ko')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Current Locale: " + context.locale.toString());

    return MaterialApp(
      title: 'Language Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: (kIsWeb) ? 'Castoro' : 'Roboto',
      ),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: MyHomePage(title: 'Flutter Language Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _changeLanguage(String locale) {
    print("Changing to locale $locale");
    Locale newLocale = Locale(locale);
    context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "intro_text",
                  style: TextStyle(fontSize: 24.0),
                ).tr(),
              ),
            ),
            SizedBox(height: 20.0),
            Text("change_language").tr(),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () => _changeLanguage('en'),
              child: Text("English"),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () => _changeLanguage('ja'),
              child: Text("Japanese"),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () => _changeLanguage('ko'),
              child: Text("Korean"),
            ),
            SizedBox(height: 20.0),
            Text("Translations By: Google Translate"),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
