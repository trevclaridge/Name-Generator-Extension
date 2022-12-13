part of view;

class Counter extends StatelessWidget {
  Counter({
    Key? key,
    required this.numSyllables,
  }) : super(key: key);

  final int numSyllables;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: const Icon(
            Icons.keyboard_arrow_up,
            size: 15.0,
          ),
          onTap: () {},
        ),
        Text(
          numSyllables.toString(),
        ),
        InkWell(
          child: const Icon(Icons.keyboard_arrow_down, size: 15.0),
          onTap: () {},
        ),
      ],
    );
  }
}
