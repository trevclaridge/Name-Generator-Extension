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
  Color copyColor = const Color(0xFFC7CACC);
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: MouseRegion(
        onHover: _onHoverPanel,
        onExit: _onExitPanel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 8.0),
            Visibility(
              visible: hovered,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        PanelButtonToggleable(
                            tooltip: 'Female',
                            icon: FontAwesomeIcons.mars,
                            buttonBehavior: () {},
                            toggled: false),
                        PanelButtonToggleable(
                            tooltip: 'Male',
                            icon: FontAwesomeIcons.venus,
                            buttonBehavior: () {},
                            toggled: true),
                        PanelButtonToggleable(
                            tooltip: 'Neurtral',
                            icon: FontAwesomeIcons.marsAndVenus,
                            buttonBehavior: () {},
                            toggled: false),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      children: [
                        PanelButtonToggleable(
                            tooltip: 'Town',
                            icon: FontAwesomeIcons.building,
                            buttonBehavior: () {},
                            toggled: true),
                        PanelButtonToggleable(
                            tooltip: 'Dragon',
                            icon: FontAwesomeIcons.dragon,
                            buttonBehavior: () {},
                            toggled: false),
                        PanelButtonToggleable(
                            tooltip: 'Pirate',
                            icon: FontAwesomeIcons.skullCrossbones,
                            buttonBehavior: () {},
                            toggled: false),
                        PanelButtonToggleable(
                            tooltip: 'Medieval',
                            icon: FontAwesomeIcons.crown,
                            buttonBehavior: () {},
                            toggled: false),
                        PanelButtonToggleable(
                            tooltip: 'Tavern',
                            icon: FontAwesomeIcons.beerMugEmpty,
                            buttonBehavior: () {},
                            toggled: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      // width: 1,
                      color: (hovered) ? Colors.black : Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Consumer(
                          builder: (context, value, child) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SelectableText(
                                widget.fullName.getCombinedName(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 32.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: MouseRegion(
                        onHover: _onHoverCopy,
                        onExit: _onExitCopy,
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () =>
                              _onCopyClick(widget.fullName.getCombinedName()),
                          child:
                              FaIcon(FontAwesomeIcons.copy, color: copyColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: hovered,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Syllables: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Consumer<App>(builder: (context, value, child) {
                            return Counter(panelSettings: widget.panelSettings);
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          NameAction(
                              fullName: widget.fullName.getCombinedName(),
                              buttonBehavior: () => App()
                                  .rerollName(widget.panelSettings.panelNum),
                              icon: FontAwesomeIcons.arrowsRotate),
                          const SizedBox(width: 10.0),
                          NameAction(
                              fullName: widget.fullName.getCombinedName(),
                              buttonBehavior: onSaveClick,
                              icon: FontAwesomeIcons.floppyDisk)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0)
          ],
        ),
      ),
    );
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

  void _onHoverCopy(event) {
    setState(() {
      copyColor = Colors.black;
    });
  }

  void _onExitCopy(event) {
    setState(() {
      copyColor = const Color(0xFFC7CACC);
    });
  }

  void _onExitPanel(event) {
    setState(() {
      hovered = false;
    });
  }

  void _onHoverPanel(event) {
    setState(() {
      hovered = true;
    });
  }

  void onSaveClick() {
    App().addNameToSaved(widget.fullName);
  }
}
