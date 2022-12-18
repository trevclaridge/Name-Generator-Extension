part of view;

class NewGeneratedPanel extends StatefulWidget {
  const NewGeneratedPanel(
      {Key? key, required this.fullName, required this.panelSettings})
      : super(key: key);

  final FullName fullName;
  final PanelSettings panelSettings;

  @override
  State<NewGeneratedPanel> createState() => _NewGeneratedPanelState();
}

class _NewGeneratedPanelState extends State<NewGeneratedPanel> {
  bool viewSettings = false;
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MouseRegion(
        onHover: (event) => setState(() {
          hovered = true;
        }),
        onExit: (event) => setState(() {
          hovered = false;
        }),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          alignment: Alignment.topCenter,
          curve: Curves.easeInOutCubic,
          child: Container(
            decoration: BoxDecoration(
              color: Palette().genOrangeAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            height: (viewSettings) ? 170.0 : 70,
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: SelectableText(
                                    widget.fullName.getCombinedName(),
                                    style: Palette().nameStyle,
                                    maxLines: 1),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: NameAction(
                                      fullName:
                                          widget.fullName.getCombinedName(),
                                      buttonBehavior: () => _onCopyClick(
                                          widget.fullName.getCombinedName()),
                                      icon: FontAwesomeIcons.copy),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: NameAction(
                                      fullName:
                                          widget.fullName.getCombinedName(),
                                      buttonBehavior: _onRerollClick,
                                      icon: FontAwesomeIcons.arrowsRotate),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: NameAction(
                                      fullName:
                                          widget.fullName.getCombinedName(),
                                      buttonBehavior: _onSaveClick,
                                      icon: FontAwesomeIcons.floppyDisk),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                        visible: viewSettings,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Consumer<App>(
                            builder: ((context, value, child) {
                              return Column(
                                children: [
                                  Container(
                                    height: 1.0,
                                    color: Palette().genOrange,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          PanelButtonToggleable(
                                              tooltip: 'Town',
                                              icon: FontAwesomeIcons.building,
                                              buttonBehavior: () =>
                                                  _onToggleClick('town'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.town),
                                          PanelButtonToggleable(
                                              tooltip: 'Dragon',
                                              icon: FontAwesomeIcons.dragon,
                                              buttonBehavior: () =>
                                                  _onToggleClick('dragon'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.dragon),
                                          PanelButtonToggleable(
                                              tooltip: 'Pirate',
                                              icon: FontAwesomeIcons
                                                  .skullCrossbones,
                                              buttonBehavior: () =>
                                                  _onToggleClick('pirate'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.pirate),
                                          PanelButtonToggleable(
                                              tooltip: 'Medieval',
                                              icon: FontAwesomeIcons.crown,
                                              buttonBehavior: () =>
                                                  _onToggleClick('medieval'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.medieval),
                                          PanelButtonToggleable(
                                              tooltip: 'Tavern',
                                              icon:
                                                  FontAwesomeIcons.beerMugEmpty,
                                              buttonBehavior: () =>
                                                  _onToggleClick('tavern'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.tavern),
                                        ],
                                      ),
                                      Visibility(
                                        visible: !App()
                                            .nonGenderedCategores
                                            .contains(widget
                                                .panelSettings.toggleCategory),
                                        child: Row(
                                          children: [
                                            PanelButtonToggleable(
                                                tooltip: 'Gender Neutral',
                                                icon:
                                                    FontAwesomeIcons.venusMars,
                                                buttonBehavior: () =>
                                                    _onToggleClick(
                                                        'genderneutral'),
                                                toggled: widget.panelSettings
                                                        .toggleGender ==
                                                    Gender.genderNeutral),
                                            PanelButtonToggleable(
                                                tooltip: 'Feminine',
                                                icon: FontAwesomeIcons.mars,
                                                buttonBehavior: () =>
                                                    _onToggleClick('feminine'),
                                                toggled: widget.panelSettings
                                                        .toggleGender ==
                                                    Gender.feminine),
                                            PanelButtonToggleable(
                                                tooltip: 'Masculine',
                                                icon: FontAwesomeIcons.venus,
                                                buttonBehavior: () =>
                                                    _onToggleClick('masculine'),
                                                toggled: widget.panelSettings
                                                        .toggleGender ==
                                                    Gender.masculine),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5.0,
                                        ),
                                        child: Text(
                                          '# of Syllables:',
                                          style: Palette().nameStyle.copyWith(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF1E1E1E)
                                                    .withOpacity(0.85),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: NewCounter(
                                            panelSettings:
                                                widget.panelSettings),
                                      )
                                    ],
                                  )
                                ],
                              );
                            }),
                          ),
                        )),
                  ],
                ),
                Visibility(
                  visible: hovered,
                  child: Transform.translate(
                    offset: const Offset(10.0, -8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Transform.scale(
                        scale: 0.40,
                        child: CupertinoSwitch(
                          value: viewSettings,
                          onChanged: (bool value) {
                            setState(() {
                              viewSettings = value;
                            });
                          },
                          thumbColor: Palette().sliderGrey,
                          trackColor: Colors.white,
                          activeColor: Palette().genOrange,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  void _onSaveClick() {
    App().addNameToSaved(widget.fullName);
  }

  void _onRerollClick() {
    App().rerollName(widget.panelSettings.panelNum);
  }

  void _onToggleClick(String toggle) {
    App().togglePanelButton(widget.panelSettings.panelNum, toggle);
  }
}
