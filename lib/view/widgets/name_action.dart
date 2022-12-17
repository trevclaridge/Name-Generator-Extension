part of view;

class NameAction extends StatefulWidget {
  const NameAction(
      {Key? key,
      required this.fullName,
      required this.buttonBehavior,
      required this.icon})
      : super(key: key);

  final String fullName;
  final VoidCallback buttonBehavior;
  final IconData icon;

  @override
  State<NameAction> createState() => _NameActionState();
}

class _NameActionState extends State<NameAction> {
  Color iconColor = Palette().unhoveredGrey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.buttonBehavior,
        child: Icon(widget.icon, color: iconColor, size: 20.0),
      ),
    );
  }

  void _onExit(event) {
    setState(() {
      iconColor = Palette().unhoveredGrey;
    });
  }

  void _onEnter(event) {
    setState(() {
      iconColor = Colors.black;
    });
  }
}
