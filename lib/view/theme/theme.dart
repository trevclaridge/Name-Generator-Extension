part of view;

class CustomTheme {
  final ThemeData _baseTheme = ThemeData(
    textTheme: TextTheme(
      labelMedium: TextStyles().pageSubtitleStyle,
      labelLarge: TextStyles().emptyPageStyle,
      bodyMedium: TextStyles().panelNameStyle,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette().scaffoldWhite,
      shadowColor: Palette().genOrange,
      titleTextStyle: TextStyle(
        fontFamily: 'Lobster',
        fontSize: 24.0,
        color: Palette().genOrange,
      ),
    ),
    scaffoldBackgroundColor: Palette().scaffoldWhite,
  );

  ThemeData get blueTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genBlue,
      shadowColor: Palette().genBlue,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genBlue,
        titleTextStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 24.0,
          color: Palette().genBlue,
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Palette().genBlueAccent),
    );
  }

  ThemeData get greenTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genGreen,
      shadowColor: Palette().genGreenAccent,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genGreen,
        titleTextStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 24.0,
          color: Palette().genGreen,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Palette().genGreenAccent),
    );
  }

  ThemeData get orangeTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genOrange,
      shadowColor: Palette().genOrange,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genOrange,
        titleTextStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 24.0,
          color: Palette().genOrange,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Palette().genOrangeAccent),
    );
  }

  ThemeData get purpleTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genPurple,
      shadowColor: Palette().genPurple,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genPurple,
        titleTextStyle: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 24.0,
          color: Palette().genPurple,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Palette().genPurpleAccent),
    );
  }
}
