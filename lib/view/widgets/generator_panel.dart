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
    // List<Map<IconData, Subcategory>> subcategoryToggles =
    //     getSubCategoryToggles();

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
            height: (viewSettings) ? 190 : 70,
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
                          child: Column(
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
                                      SizedBox(
                                        height: 40.0,
                                        child: Consumer<App>(
                                          builder: (context, value, child) {
                                            return Row(
                                              children: List.generate(
                                                widget.panelSettings.categories
                                                    .length,
                                                (index) => PanelButtonToggleable(
                                                    icon: widget.panelSettings
                                                        .categories[index].icon,
                                                    tooltip: widget
                                                        .panelSettings
                                                        .categories[index]
                                                        .getName(),
                                                    buttonBehavior: () =>
                                                        _onToggleCategoryClick(
                                                            index),
                                                    toggled: widget
                                                            .panelSettings
                                                            .activeCategoryIndex ==
                                                        index),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: !Categories()
                                        .nonGenderedSubcategories
                                        .contains(widget
                                            .panelSettings
                                            .categories[widget.panelSettings
                                                .activeCategoryIndex]
                                            .subcategories[widget
                                                .panelSettings
                                                .categories[widget.panelSettings
                                                    .activeCategoryIndex]
                                                .activeSubcategory]
                                            .getName()),
                                    child: Row(
                                      children: [
                                        PanelButtonToggleable(
                                            tooltip: 'Feminine',
                                            icon: const AssetImage(
                                                'lib/assets/icons/png/venus.png'),
                                            buttonBehavior: () => App()
                                                .panelNames[widget.panelNum]
                                                .panelSettings
                                                .activeGender = Gender.feminine,
                                            toggled: widget.panelSettings
                                                    .activeGender ==
                                                Gender.feminine),
                                        PanelButtonToggleable(
                                            tooltip: 'Gender Neutral',
                                            icon: const AssetImage(
                                                'lib/assets/icons/png/delete.png'),
                                            buttonBehavior: () => App()
                                                    .panelNames[widget.panelNum]
                                                    .panelSettings
                                                    .activeGender =
                                                Gender.genderNeutral,
                                            toggled: widget.panelSettings
                                                    .activeGender ==
                                                Gender.genderNeutral),
                                        PanelButtonToggleable(
                                            tooltip: 'Masculine',
                                            icon: const AssetImage(
                                                'lib/assets/icons/png/mars.png'),
                                            buttonBehavior: () => App()
                                                    .panelNames[widget.panelNum]
                                                    .panelSettings
                                                    .activeGender =
                                                Gender.masculine,
                                            toggled: widget.panelSettings
                                                    .activeGender ==
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
                                        height: 40.0,
                                        child: Row(
                                          children: List.generate(
                                            widget
                                                .panelSettings
                                                .categories[widget.panelSettings
                                                    .activeCategoryIndex]
                                                .subcategories
                                                .length,
                                            (index) => PanelButtonToggleable(
                                                icon: widget
                                                    .panelSettings
                                                    .categories[widget
                                                        .panelSettings
                                                        .activeCategoryIndex]
                                                    .subcategories[index]
                                                    .icon,
                                                tooltip: widget
                                                    .panelSettings
                                                    .categories[widget
                                                        .panelSettings
                                                        .activeCategoryIndex]
                                                    .subcategories[index]
                                                    .getName(),
                                                buttonBehavior: () =>
                                                    _onToggleSubcategoryClick(
                                                        index),
                                                toggled: widget
                                                        .panelSettings
                                                        .categories[widget
                                                            .panelSettings
                                                            .activeCategoryIndex]
                                                        .activeSubcategory ==
                                                    index),
                                          ),
                                        ),
                                      ),
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
                              //       padding: const EdgeInsets.only(right: 16.0),
                              //       child: Counter(
                              //         panelSettings: widget.panelSettings,
                              //         panelNum: widget.panelNum,
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          )),
                    )
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
        content: Text('$name copied to clipboard.'),
      ),
    );
  }

  void _onSaveClick() {
    App().addNameToSaved(SavedName(name: widget.panelName.name));
  }

  void _onRerollClick() {
    App().rerollName(widget.panelNum);
  }

  void _onToggleCategoryClick(int categoryIndex) {
    App().toggleCategoryPanelButton(widget.panelNum, categoryIndex);
  }

  void _onToggleSubcategoryClick(int subcategoryIndex) {
    App().toggleSubcategoryPanelButton(widget.panelNum, subcategoryIndex);
  }

  double getPanelSize(PanelSettings settings, bool showSettings) {
    if (!showSettings) {
      return 70.0;
    }
    if (settings
            .categories[settings.activeCategoryIndex].subcategories.length ==
        1) {
      return 200.0;
    }
    if (Categories().syllabledSubcategories.contains(settings
        .categories[settings.activeCategoryIndex]
        .subcategories[
            settings.categories[settings.activeCategoryIndex].activeSubcategory]
        .getName())) {
      return 210.0;
    }
    throw 'Panel size not measured';
    // return 70.0;
  }
}
