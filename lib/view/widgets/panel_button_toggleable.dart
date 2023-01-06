part of view;

class PanelButtonToggleable extends StatefulWidget {
  final String iconString;
  final String tooltip;
  final VoidCallback buttonBehavior;
  final bool toggled;

  const PanelButtonToggleable(
      {Key? key,
      required this.iconString,
      required this.tooltip,
      required this.buttonBehavior,
      required this.toggled})
      : super(key: key);

  @override
  State<PanelButtonToggleable> createState() => _PanelButtonToggleableState();
}

class _PanelButtonToggleableState extends State<PanelButtonToggleable> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: isSubcategory(),
      message: widget.tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) => setState(() {
            hovered = true;
          }),
          onExit: (event) => setState(() {
            hovered = false;
          }),
          child: GestureDetector(
            onTap: widget.buttonBehavior,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              decoration: BoxDecoration(
                  color: getToggleColor(),
                  borderRadius: BorderRadius.circular(5)),
              width: 30.0,
              height: 30.0,
              child: Center(
                child: SvgPicture.asset(widget.iconString,
                    semanticsLabel: widget.tooltip,
                    color: getIconColor(),
                    width: 22.0,
                    height: 22.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getIconColor() {
    if (widget.toggled) {
      return Colors.white;
    }
    if (!widget.toggled && hovered) {
      return Colors.black;
    }
    return Palette().unhoveredGrey;
  }

  bool isSubcategory() {
    List<String> allSubcategories = [];
    for (var category in Categories().categories) {
      for (var subcategory in category.subcategories) {
        allSubcategories.add(subcategory.getName());
      }
    }
    if (allSubcategories.contains(widget.tooltip)) {
      return true;
    }
    return false;
  }

  bool isGender() {
    List<String> genders = ['Gender Neutral', 'Feminine', 'Masculine'];
    if (genders.contains(widget.tooltip)) {
      return true;
    }
    return false;
  }

  Color getToggleColor() {
    List<String> allSubcategories = [];
    for (var category in Categories().categories) {
      for (var subcategory in category.subcategories) {
        allSubcategories.add(subcategory.getName());
      }
    }
    if (!widget.toggled) {
      return Palette().genOrangeAccent;
    }
    if (widget.toggled && isGender()) {
      return Palette().genPurple;
    }
    if (widget.toggled && isSubcategory()) {
      return Palette().subcategoryTeal;
    }
    return Palette().genOrange;
  }
}
