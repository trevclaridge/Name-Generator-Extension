part of view;

class DiceButton extends StatefulWidget {
  const DiceButton({
    super.key,
    required this.diceNumber,
  });

  final String diceNumber;

  @override
  State<DiceButton> createState() => _DiceButtonState();
}

class _DiceButtonState extends State<DiceButton> {
  Color buttonColor = Palette().textBlack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App().setDiceOutput(roll());
      },
      hoverColor: Colors.transparent,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: _onHover,
        onExit: _onExit,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/d${widget.diceNumber}.svg',
              width: 20.0,
              height: 20.0,
              color: buttonColor,
            ),
            Text(
              'd${widget.diceNumber}',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 4.0, height: 0.9),
            )
          ],
        ),
      ),
    );
  }

  String roll() {
    return (Die((int.parse(widget.diceNumber))).roll()).toString();
  }

  void _onHover(event) {
    setState(() {
      buttonColor = Theme.of(context).primaryColor;
    });
  }

  void _onExit(event) {
    setState(() {
      buttonColor = Palette().textBlack;
    });
  }
}
