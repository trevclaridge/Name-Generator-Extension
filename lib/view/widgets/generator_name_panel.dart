// ignore_for_file: must_be_immutable

part of view;

class NamePanel extends StatefulWidget {
  NamePanel({Key? key, required this.fullName, required this.panelSettings})
      : super(key: key);

  final FullName fullName;
  PanelSettings panelSettings;

  @override
  State<NamePanel> createState() => _NamePanelState();
}

class _NamePanelState extends State<NamePanel> {
  Color namePanelColor = Colors.transparent;
  bool hovered = false;
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !deleted,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          height: 100,
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
                    child: Consumer(builder: (context, value, child) {
                      return SelectableText(widget.fullName.getCombinedName(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 32.0));
                    }),
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
                            Text('Syllables: ',
                                style: Theme.of(context).textTheme.labelLarge),
                            Consumer<App>(builder: (context, value, child) {
                              return Counter(
                                  panelSettings: widget.panelSettings);
                            }),
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
                            NameAction(
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
