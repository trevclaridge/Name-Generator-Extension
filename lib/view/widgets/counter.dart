part of view;

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
    required this.panelSettings,
    required this.panelNum,
  }) : super(key: key);

  final PanelSettings panelSettings;
  final int panelNum;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Color iconColorDecrement = Palette().sliderGrey;
  Color iconColorIncrement = Palette().sliderGrey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: _onHoverDecrement,
          onExit: _onExitDecrement,
          child: GestureDetector(
            onTap: () => App().decrementSyllables(widget.panelNum),
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.4,
                  color: Palette().genOrange,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  color: iconColorDecrement,
                  size: 10.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Consumer<App>(
          builder: (context, value, child) {
            return SizedBox(
              width: 26.0,
              child: Center(
                child: Text(
                  '0${widget.panelSettings.numSyllables}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8.0),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: _onHoverIncrement,
          onExit: _onExitIncrement,
          child: GestureDetector(
            onTap: () => App().incrementSyllables(widget.panelNum),
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.4,
                  color: Palette().genOrange,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: iconColorIncrement,
                  size: 10.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onExitDecrement(event) {
    setState(() {
      iconColorDecrement = Palette().sliderGrey;
    });
  }

  void _onHoverDecrement(event) {
    setState(() {
      iconColorDecrement = Colors.black;
    });
  }

  void _onExitIncrement(event) {
    setState(() {
      iconColorIncrement = Palette().sliderGrey;
    });
  }

  void _onHoverIncrement(event) {
    setState(() {
      iconColorIncrement = Colors.black;
    });
  }
}
