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
        fontFamily: GoogleFonts.cabin().fontFamily,
        fontSize: 24.0,
        color: Palette().genOrange,
      ),
    ),
    scaffoldBackgroundColor: Palette().scaffoldWhite,
  );

  ThemeData get orangeTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genOrange,
      shadowColor: Palette().genOrange,
      accentColor: Palette().genOrangeAccent,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genOrange,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.cabin().fontFamily,
          fontSize: 24.0,
          color: Palette().genOrange,
        ),
      ),
    );
  }

  ThemeData get blueTheme {
    return _baseTheme.copyWith(
      primaryColor: Palette().genBlue,
      shadowColor: Palette().genBlue,
      accentColor: Palette().genBlueAccent,
      appBarTheme: AppBarTheme(
        backgroundColor: Palette().scaffoldWhite,
        shadowColor: Palette().genBlue,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.cabin().fontFamily,
          fontSize: 24.0,
          color: Palette().genBlue,
        ),
      ),
    );
  }
}
