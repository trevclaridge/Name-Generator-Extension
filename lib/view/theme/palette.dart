part of view;

class Palette {
  Color genOrange = const Color(0xFFFF8C44);
  Color subcategoryTeal = const Color(0xFF62929E);
  Color genPurple = const Color(0xFF655A7C);
  Color genOrangeAccent = const Color(0xFFFFE8DA);
  Color unhoveredGrey = const Color(0xFF9C9A9A);
  Color textBlack = const Color(0xFF1E1E1E);
  Color sliderGrey = const Color(0XFF786F69);

  // unused as of yet
  Color genLightBlue = const Color(0xFFA7E2E3);
  Color genBeige = const Color(0xFFEFF0D1);

  TextStyle titleStyle = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 24.0,
    color: Colors.white,
  );
  TextStyle nameStyle = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF1E1E1E),
  );
}
