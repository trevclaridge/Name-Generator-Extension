// ignore_for_file: must_be_immutable

part of view;

class NamePanel extends StatefulWidget {
  NamePanel(
      {Key? key,
      required this.fullName,
      required this.isSavedPage,
      required this.panelPrefs})
      : super(key: key);

  final FullName fullName;
  bool isSavedPage;
  final PanelPrefs panelPrefs;

  @override
  State<NamePanel> createState() => _NamePanelState();
}

class _NamePanelState extends State<NamePanel> {
  Color namePanelColor = Colors.transparent;
  Color saveColor = const Color(0xFFC7CACC);
  bool hovered = false;
  bool deleted = false;
  int numSyllables = Constants.NUM_STARTING_SYLLABLES;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !deleted,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: 95,
          child: MouseRegion(
            onEnter: _onEnter,
            onHover: _onHover,
            onExit: _onExit,
            child: Container(
              color: namePanelColor,
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SelectableText(
                      widget.fullName.getCombinedName(),
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 32.0),
                    ),
                  ),
                  Visibility(
                    visible: hovered,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Syllables: $numSyllables',
                                style: Theme.of(context).textTheme.labelLarge),
                            Slider(
                              value: numSyllables.toDouble(),
                              min: 1,
                              max: 7,
                              divisions: 6,
                              label: numSyllables.round().toString(),
                              onChanged: (double value) {
                                setState(
                                  () {
                                    numSyllables = value.toInt();
                                    App()
                                        .panelPrefs
                                        .elementAt(widget.panelPrefs.panelNum)
                                        .numSyllables = numSyllables;
                                    SharedPrefs().saveNamePanelPrefs();
                                  },
                                );
                              },
                              onChangeEnd: (double value) {
                                setState(
                                  () {
                                    newNames();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            NameAction(
                                fullName: widget.fullName.getCombinedName(),
                                buttonBehavior: () => _onCopyClick(
                                    widget.fullName.getCombinedName()),
                                icon: Icons.copy),
                            const SizedBox(width: 10.0),
                            widget.isSavedPage
                                ? NameAction(
                                    fullName: widget.fullName.getCombinedName(),
                                    buttonBehavior: () => onDeleteClick(),
                                    icon: Icons.delete)
                                : NameAction(
                                    fullName: widget.fullName.getCombinedName(),
                                    buttonBehavior: onSaveClick,
                                    icon: Icons.save)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void newNames() {
    setState(
      () {
        widget.fullName.firstName.generate(numSyllables);
        widget.fullName.lastName.generate(numSyllables);
      },
    );
  }

  void _onExit(event) {
    setState(() {
      namePanelColor = Colors.transparent;
      hovered = false;
    });
  }

  void _onHover(event) {
    setState(() {
      namePanelColor = const Color(0xffF6F6F6);
    });
  }

  void _onEnter(event) {
    setState(() {
      namePanelColor = const Color(0xffF6F6F6);
      hovered = true;
    });
  }

  void onSaveClick() {
    App().addNameToSaved(widget.fullName);
  }

  void onDeleteClick() {
    setState(() {
      deleted = true;
      App().deleteNameFromSaved(widget.fullName);
    });
  }

  void _onCopyClick(String name) async {
    await Clipboard.setData(
      ClipboardData(
        text: widget.fullName.getCombinedName(),
      ),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name copied to clipboard'),
      ),
    );
  }
}
