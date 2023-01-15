part of view;

class CustomTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      textTheme: TextTheme(
        labelMedium: TextStyle(
            color: Palette().unhoveredGrey,
            fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.inter().fontFamily),
        labelLarge: TextStyle(
            color: Palette().unhoveredGrey,
            fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 16.0),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Palette().textBlack,
        ),
        bodySmall: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Palette().textBlack.withOpacity(0.85),
        ),
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
  }
}
