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
        print(Die(int.parse(widget.diceNumber)).roll());
      },
      hoverColor: Colors.transparent,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: _onHover,
        onExit: _onExit,
        child: SvgPicture.asset(
          'assets/icons/svg/d${widget.diceNumber}.svg',
          width: 20.0,
          height: 20.0,
          color: buttonColor,
        ),
      ),
    );
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
