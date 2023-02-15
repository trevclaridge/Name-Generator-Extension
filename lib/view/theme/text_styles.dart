part of view;

class TextStyles {
  TextStyle pageSubtitleStyle = TextStyle(
      color: Palette().unhoveredGrey,
      fontWeight: FontWeight.w200,
      fontFamily: GoogleFonts.inter().fontFamily);

  TextStyle emptyPageStyle = TextStyle(
      color: Palette().unhoveredGrey,
      fontWeight: FontWeight.w200,
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16.0);

  TextStyle panelNameStyle = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Palette().textBlack,
  );
}
