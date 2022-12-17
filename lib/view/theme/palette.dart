part of view;

class Palette {
  Color genOrange = const Color(0xFFFF8c44);
  Color genOrangeAccent = const Color(0xFFFF8C44).withOpacity(20.0);
  Color unhoveredGrey = const Color(0xFF9C9A9A).withOpacity(50.0);
  Color textBlack = const Color(0xFF1E1E1E);
  Color sliderGrey = const Color(0XFF1E1E1E).withOpacity(60.0);

  TextStyle titleStyle = TextStyle(
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFFF8c44));
  TextStyle nameStyle = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1E1E1E));
}
