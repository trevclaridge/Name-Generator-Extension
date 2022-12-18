part of view;

class PanelButtonToggleable extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback buttonBehavior;
  final bool toggled;

  const PanelButtonToggleable(
      {Key? key,
      required this.icon,
      required this.tooltip,
      required this.buttonBehavior,
      required this.toggled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: InkWell(
          onTap: buttonBehavior,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutCubic,
            decoration: BoxDecoration(
                color:
                    (toggled) ? Palette().genOrange : Palette().genOrangeAccent,
                borderRadius: BorderRadius.circular(5)),
            width: 30.0,
            height: 30.0,
            child: Center(
              child: FaIcon(
                icon,
                size: 17.0,
                color: (toggled)
                    ? Colors.white
                    : Palette().textBlack.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
