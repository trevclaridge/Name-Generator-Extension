part of view;

class NewCounter extends StatefulWidget {
  NewCounter({
    Key? key,
    required this.panelSettings,
  }) : super(key: key);

  final PanelSettings panelSettings;

  @override
  State<NewCounter> createState() => _NewCounterState();
}

class _NewCounterState extends State<NewCounter> {
  Color iconColorDecrement = Palette().sliderGrey;
  Color iconColorIncrement = Palette().sliderGrey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          onHover: _onHoverDecrement,
          onExit: _onExitDecrement,
          child: GestureDetector(
            onTap: () =>
                App().decrementSyllables(widget.panelSettings.panelNum),
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
              width: 10.0,
              child: Text(
                widget.panelSettings.numSyllables.toString(),
                style: Palette().nameStyle.copyWith(
                      color: const Color(0xFF1E1E1E).withOpacity(0.80),
                    ),
              ),
            );
          },
        ),
        const SizedBox(width: 8.0),
        MouseRegion(
          onHover: _onHoverIncrement,
          onExit: _onExitIncrement,
          child: GestureDetector(
            onTap: () =>
                App().incrementSyllables(widget.panelSettings.panelNum),
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
