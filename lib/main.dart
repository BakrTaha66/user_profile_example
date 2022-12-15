import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_example/page/edit_profile_page.dart';
import 'package:user_profile_example/page/profile_page.dart';
import 'package:user_profile_example/themes.dart';
import 'package:user_profile_example/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isDarkMood ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (themeContext) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: user.isDarkMood ? MyThemes.darkTheme : MyThemes.lightTheme,
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
