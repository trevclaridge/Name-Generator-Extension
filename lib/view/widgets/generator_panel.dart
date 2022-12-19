part of view;

class GeneratorPanel extends StatefulWidget {
  const GeneratorPanel(
      {Key? key,
      required this.panelName,
      required this.panelSettings,
      required this.panelNum})
      : super(key: key);

  final Name panelName;
  final PanelSettings panelSettings;
  final int panelNum;

  @override
  State<GeneratorPanel> createState() => _GeneratorPanelState();
}

class _GeneratorPanelState extends State<GeneratorPanel> {
  bool viewSettings = false;
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    List<Map<IconData, Subcategory>> subcategoryToggles =
        getSubCategoryToggles();

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
            height: (viewSettings) ? 180.0 : 70,
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
                                    widget.panelName.getName(),
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
                                      fullName: widget.panelName.getName(),
                                      buttonBehavior: () => _onCopyClick(
                                          widget.panelName.getName()),
                                      icon: FontAwesomeIcons.copy),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: NameAction(
                                      fullName: widget.panelName.getName(),
                                      buttonBehavior: _onRerollClick,
                                      icon: FontAwesomeIcons.arrowsRotate),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: NameAction(
                                      fullName: widget.panelName.getName(),
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
                                              tooltip: 'Pirate',
                                              icon: FontAwesomeIcons
                                                  .skullCrossbones,
                                              buttonBehavior: () =>
                                                  _onToggleClick('pirate'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.pirate),
                                          PanelButtonToggleable(
                                              tooltip: 'Fantasy',
                                              icon: FontAwesomeIcons.crown,
                                              buttonBehavior: () =>
                                                  _onToggleClick('fantasy'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.fantasy),
                                          PanelButtonToggleable(
                                              tooltip: 'Tavern',
                                              icon:
                                                  FontAwesomeIcons.beerMugEmpty,
                                              buttonBehavior: () =>
                                                  _onToggleClick('tavern'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.tavern),
                                          PanelButtonToggleable(
                                              tooltip: 'Chaos',
                                              icon: FontAwesomeIcons.shuffle,
                                              buttonBehavior: () =>
                                                  _onToggleClick('chaos'),
                                              toggled: widget.panelSettings
                                                      .toggleCategory ==
                                                  Category.chaos),
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
                                                tooltip: 'Feminine',
                                                icon: FontAwesomeIcons.mars,
                                                buttonBehavior: () =>
                                                    _onToggleClick('feminine'),
                                                toggled: widget.panelSettings
                                                        .toggleGender ==
                                                    Gender.feminine),
                                            PanelButtonToggleable(
                                                tooltip: 'Gender Neutral',
                                                icon: FontAwesomeIcons.minus,
                                                buttonBehavior: () =>
                                                    _onToggleClick(
                                                        'genderneutral'),
                                                toggled: widget.panelSettings
                                                        .toggleGender ==
                                                    Gender.genderNeutral),
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
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 30.0,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  subcategoryToggles.length,
                                              itemBuilder: ((context, index) {
                                                return PanelButtonToggleable(
                                                  icon:
                                                      subcategoryToggles[index]
                                                          .keys
                                                          .elementAt(0),
                                                  tooltip:
                                                      subcategoryToggles[index]
                                                          .values
                                                          .elementAt(0)
                                                          .toString()
                                                          .capitalize(),
                                                  buttonBehavior: () =>
                                                      _onToggleClick(
                                                          subcategoryToggles[
                                                                  index]
                                                              .values
                                                              .elementAt(0)
                                                              .toString()),
                                                  toggled: widget.panelSettings
                                                      .toggleSubcategories
                                                      .contains(
                                                    subcategoryToggles[index]
                                                        .values
                                                        .elementAt(0),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                          // PanelButtonToggleable(
                                          //   icon: FontAwesomeIcons.hammer,
                                          //   tooltip: 'Dwarf',
                                          //   buttonBehavior: () =>
                                          //       _onToggleClick('dwarf'),
                                          //   toggled: widget.panelSettings
                                          //           .toggleSubcategory ==
                                          //       Fantasy.dwarf,
                                          // ),
                                          // PanelButtonToggleable(
                                          //   icon: FontAwesomeIcons.earListen,
                                          //   tooltip: 'Elf',
                                          //   buttonBehavior: () =>
                                          //       _onToggleClick('elf'),
                                          //   toggled: widget.panelSettings
                                          //           .toggleSubcategory ==
                                          //       Fantasy.elf,
                                          // ),
                                          // PanelButtonToggleable(
                                          //   icon: FontAwesomeIcons.user,
                                          //   tooltip: 'Human',
                                          //   buttonBehavior: () =>
                                          //       _onToggleClick('human'),
                                          //   toggled: widget.panelSettings
                                          //           .toggleSubcategory ==
                                          //       Fantasy.human,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(height: 12.0),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(
                                  //         left: 5.0,
                                  //       ),
                                  //       child: Text(
                                  //         '# of Syllables:',
                                  //         style: Palette().nameStyle.copyWith(
                                  //               fontSize: 16.0,
                                  //               fontWeight: FontWeight.w600,
                                  //               color: const Color(0xFF1E1E1E)
                                  //                   .withOpacity(0.85),
                                  //             ),
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(right: 16.0),
                                  //       child: Counter(
                                  //         panelSettings: widget.panelSettings,
                                  //         panelNum: widget.panelNum,
                                  //       ),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              );
                            }),
                          ),
                        )),
                  ],
                ),
                Transform.translate(
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
        text: widget.panelName.getName(),
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
    App().addNameToSaved(SavedName(name: widget.panelName.name));
  }

  void _onRerollClick() {
    App().rerollName(widget.panelNum);
  }

  void _onToggleClick(String toggle) {
    App().togglePanelButton(widget.panelNum, toggle);
  }

  List<Map<IconData, Subcategory>> fantasySubcategories = [
    {FontAwesomeIcons.hammer: Fantasy.dwarf},
    {FontAwesomeIcons.earListen: Fantasy.elf},
    {FontAwesomeIcons.user: Fantasy.human},
  ];

  List<Map<IconData, Subcategory>> chaosSubcategories = [
    {FontAwesomeIcons.shuffle: Chaos.blipblorp},
  ];

  List<Map<IconData, Subcategory>> townSubcategories = [
    {FontAwesomeIcons.towerObservation: Town.real},
  ];

  List<Map<IconData, Subcategory>> pirateSubcategories = [
    {FontAwesomeIcons.eye: Pirate.sailor},
    {FontAwesomeIcons.anchor: Pirate.ship},
  ];

  List<Map<IconData, Subcategory>> tavernSubcategories = [
    {FontAwesomeIcons.clock: Tavern.fantasy},
  ];

  List<Map<IconData, Subcategory>> getSubCategoryToggles() {
    List<Map<IconData, Subcategory>> tempSubcategories = [];
    switch (widget.panelSettings.toggleCategory) {
      case Category.town:
        tempSubcategories = townSubcategories;
        break;
      case Category.pirate:
        tempSubcategories = pirateSubcategories;
        break;
      case Category.fantasy:
        tempSubcategories = fantasySubcategories;
        break;
      case Category.tavern:
        tempSubcategories = tavernSubcategories;
        break;
      case Category.chaos:
        tempSubcategories = chaosSubcategories;
        break;
    }
    return tempSubcategories;
  }
}
