part of view;

Future<String?> showDiceRollerDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Let\'s roll some dice!',
        style:
            Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 15.0),
      ),
      content: FittedBox(
        child: Column(
          children: [
            Row(
              children: const [
                DiceButton(diceNumber: '20'),
                DiceButton(diceNumber: '12'),
                DiceButton(diceNumber: '10'),
              ],
            ),
            Row(
              children: const [
                DiceButton(diceNumber: '8'),
                DiceButton(diceNumber: '6'),
                DiceButton(diceNumber: '4'),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary),
          ),
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Close',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
