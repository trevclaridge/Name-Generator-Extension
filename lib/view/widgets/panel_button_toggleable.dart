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
              curve: Curves.easeInOutCubic,
              decoration: BoxDecoration(
                  color: (widget.toggled)
                      ? Palette().genOrange
                      : Palette().genOrangeAccent,
                  borderRadius: BorderRadius.circular(5)),
              width: 30.0,
              height: 30.0,
              child: Center(
                child: SvgPicture.asset(widget.iconString,
                    color: getColor(), width: 22.0, height: 22.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor() {
    if (widget.toggled) {
      return Colors.white;
    }
    if (!widget.toggled && hovered) {
      return Colors.black;
    }
    return Palette().unhoveredGrey;
  }
}
