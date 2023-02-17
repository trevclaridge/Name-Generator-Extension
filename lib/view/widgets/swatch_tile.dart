part of view;

class ColorThemeSwatchTile extends StatefulWidget {
  final ThemeData theme;

  const ColorThemeSwatchTile({
    super.key,
    required this.theme,
  });

  @override
  State<ColorThemeSwatchTile> createState() => _ColorThemeSwatchTileState();
}

class _ColorThemeSwatchTileState extends State<ColorThemeSwatchTile> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: MouseRegion(
          onHover: (value) => setState(() {
            hovered = true;
          }),
          onExit: (value) => setState(() {
            hovered = false;
          }),
          child: GestureDetector(
            onTap: () {
              UserSettings().changeUserTheme(widget.theme);
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  width: 1.6,
                  color: (hovered) ? Palette().textBlack : Colors.transparent,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: widget.theme.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 70.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: widget.theme.colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
