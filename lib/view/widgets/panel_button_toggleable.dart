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
      child: InkWell(
        onTap: buttonBehavior,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          width: 30.0,
          height: 30.0,
          child: Center(
            child: FaIcon(
              icon,
              size: 17.0,
              color: (toggled) ? Colors.blueAccent : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
