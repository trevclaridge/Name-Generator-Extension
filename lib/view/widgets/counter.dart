part of view;

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
    required this.panelSettings,
  }) : super(key: key);

  final PanelSettings panelSettings;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Color iconColorLeft = const Color(0xFFC7CACC);
  Color iconColorRight = const Color(0xFFC7CACC);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          onHover: _onHoverLeft,
          onExit: _onExitLeft,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              App().decrementSyllables(widget.panelSettings.panelNum);
            },
            child: Icon(FontAwesomeIcons.angleLeft,
                size: 15.0, color: iconColorLeft),
          ),
        ),
        Text(widget.panelSettings.numSyllables.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        MouseRegion(
          onHover: _onHoverRight,
          onExit: _onExitRight,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Icon(FontAwesomeIcons.angleRight,
                size: 15.0, color: iconColorRight),
            onTap: () {
              App().incrementSyllables(widget.panelSettings.panelNum);
            },
          ),
        ),
      ],
    );
  }

  void _onExitLeft(event) {
    setState(() {
      iconColorLeft = const Color(0xFFC7CACC);
    });
  }

  void _onHoverLeft(event) {
    setState(() {
      iconColorLeft = Colors.black;
    });
  }

  void _onExitRight(event) {
    setState(() {
      iconColorRight = const Color(0xFFC7CACC);
    });
  }

  void _onHoverRight(event) {
    setState(() {
      iconColorRight = Colors.black;
    });
  }
}
