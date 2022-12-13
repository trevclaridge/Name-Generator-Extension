part of view;

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
    required this.panelSettings,
  }) : super(key: key);

  final PanelSettings panelSettings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: const Icon(
            Icons.keyboard_arrow_up,
            size: 15.0,
          ),
          onTap: () {
            App().incrementSyllables(panelSettings.panelNum);
          },
        ),
        Text(
          panelSettings.numSyllables.toString(),
        ),
        InkWell(
          child: const Icon(Icons.keyboard_arrow_down, size: 15.0),
          onTap: () {
            App().decrementSyllables(panelSettings.panelNum);
          },
        ),
      ],
    );
  }
}
