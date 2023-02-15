part of view;

class GenAction extends StatefulWidget {
  const GenAction(
      {Key? key,
      required this.fullName,
      required this.buttonBehavior,
      required this.icon})
      : super(key: key);

  final String fullName;
  final VoidCallback buttonBehavior;
  final IconData icon;

  @override
  State<GenAction> createState() => _GenActionState();
}

class _GenActionState extends State<GenAction> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.buttonBehavior,
        child: Icon(widget.icon, color: getColor(), size: 20.0),
      ),
    );
  }

  void _onExit(event) {
    setState(() {
      hovered = false;
    });
  }

  void _onEnter(event) {
    setState(() {
      hovered = true;
    });
  }

  Color getColor() {
    List<String> savedNamesAsStrings = List.generate(
        App().savedNames.length, (index) => App().savedNames[index].name);

    if (savedNamesAsStrings.contains(widget.fullName) &&
        widget.icon == FontAwesomeIcons.floppyDisk) {
      return Theme.of(context).primaryColor;
    }
    if (hovered) {
      return Colors.black;
    } else {
      return Palette().unhoveredGrey;
    }
  }
}
