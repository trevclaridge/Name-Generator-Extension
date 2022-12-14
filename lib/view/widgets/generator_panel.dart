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
  bool sliderHovered = false;

  @override
  Widget build(BuildContext context) {
    double panelHeight = getPanelSize(widget.panelSettings, viewSettings);
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
            height: panelHeight,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: List.generate(
                            getIcons().length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: SvgPicture.asset(
                                    getIcons()[index],
                                    color: Palette().unhoveredGrey,
                                    width: 15.0,
                                    height: 15.0,
                                  ),
                                )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Transform.scale(
                        scale: 0.40,
                        child: MouseRegion(
                          onHover: (event) {
                            setState(() {
                              sliderHovered = true;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              sliderHovered = false;
                            });
                          },
                          child: CupertinoSwitch(
                            value: viewSettings,
                            onChanged: (bool value) {
                              setState(() {
                                viewSettings = value;
                              });
                            },
                            thumbColor: (sliderHovered)
                                ? Palette().textBlack.withOpacity(0.7)
                                : Palette().sliderGrey,
                            trackColor: Colors.white,
                            activeColor: Palette().genOrange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 20.0,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: SelectableText(
                              widget.panelName.getName(),
                              style: Palette().nameStyle,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: NameAction(
                                fullName: widget.panelName.getName(),
                                buttonBehavior: () =>
                                    _onCopyClick(widget.panelName.getName()),
                                icon: FontAwesomeIcons.copy,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: NameAction(
                                fullName: widget.panelName.getName(),
                                buttonBehavior: _onRerollClick,
                                icon: FontAwesomeIcons.arrowsRotate,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: NameAction(
                                fullName: widget.panelName.getName(),
                                buttonBehavior: _onSaveClick,
                                icon: FontAwesomeIcons.floppyDisk,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: viewSettings,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 17.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 1.0,
                            color: Palette().genOrange,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Consumer<App>(
                                      builder: (context, value, child) {
                                        return Row(
                                          children: List.generate(
                                            widget.panelSettings.categories
                                                .length,
                                            (index) => PanelButtonToggleable(
                                              iconString: widget.panelSettings
                                                  .categories[index].icon,
                                              tooltip: widget.panelSettings
                                                  .categories[index]
                                                  .getName(),
                                              buttonBehavior: () =>
                                                  _onToggleCategoryClick(index),
                                              toggled: widget.panelSettings
                                                      .activeCategoryIndex ==
                                                  index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: !Categories()
                                      .nonGenderedSubcategories
                                      .contains(
                                        widget
                                            .panelSettings
                                            .categories[widget.panelSettings
                                                .activeCategoryIndex]
                                            .subcategories[widget
                                                .panelSettings
                                                .categories[widget.panelSettings
                                                    .activeCategoryIndex]
                                                .activeSubcategory]
                                            .getName(),
                                      ),
                                  child: Row(
                                    children: [
                                      PanelButtonToggleable(
                                        tooltip: 'Feminine',
                                        iconString:
                                            'lib/assets/icons/svg/feminine.svg',
                                        buttonBehavior: () =>
                                            App().toggleGenderPanelButton(
                                          widget.panelNum,
                                          Gender.feminine,
                                        ),
                                        toggled:
                                            widget.panelSettings.activeGender ==
                                                Gender.feminine,
                                      ),
                                      PanelButtonToggleable(
                                        tooltip: 'Gender Neutral',
                                        iconString:
                                            'lib/assets/icons/svg/hyphen.svg',
                                        buttonBehavior: () =>
                                            App().toggleGenderPanelButton(
                                          widget.panelNum,
                                          Gender.genderNeutral,
                                        ),
                                        toggled:
                                            widget.panelSettings.activeGender ==
                                                Gender.genderNeutral,
                                      ),
                                      PanelButtonToggleable(
                                        tooltip: 'Masculine',
                                        iconString:
                                            'lib/assets/icons/svg/masculine.svg',
                                        buttonBehavior: () =>
                                            App().toggleGenderPanelButton(
                                          widget.panelNum,
                                          Gender.masculine,
                                        ),
                                        toggled:
                                            widget.panelSettings.activeGender ==
                                                Gender.masculine,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: getPanelSize(
                                        widget.panelSettings, viewSettings) ==
                                    217.0 ||
                                getPanelSize(
                                        widget.panelSettings, viewSettings) ==
                                    187.0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30.0,
                                        child: Row(
                                          children: List.generate(
                                            widget
                                                .panelSettings
                                                .categories[widget.panelSettings
                                                    .activeCategoryIndex]
                                                .subcategories
                                                .length,
                                            (index) => PanelButtonToggleable(
                                                iconString: widget
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
                            ),
                          ),
                          Visibility(
                            visible: getPanelSize(
                                    widget.panelSettings, viewSettings) ==
                                217.0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 4.0,
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
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Counter(
                                      panelSettings: widget.panelSettings,
                                      panelNum: widget.panelNum,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                )
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
    App().appPageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
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

  List<String> getIcons() {
    List<String> icons = [];
    icons.add(
      widget.panelSettings.categories[widget.panelSettings.activeCategoryIndex]
          .icon,
    );

    if (widget
            .panelSettings
            .categories[widget.panelSettings.activeCategoryIndex]
            .subcategories
            .length >
        1) {
      icons.add(widget
          .panelSettings
          .categories[widget.panelSettings.activeCategoryIndex]
          .subcategories[widget
              .panelSettings
              .categories[widget.panelSettings.activeCategoryIndex]
              .activeSubcategory]
          .icon);
    }

    // String feminine = 'lib/assets/icons/svg/feminine.svg';
    // String masculine = 'lib/assets/icons/svg/masculine.svg';
    // String genderNeutral = 'lib/assets/icons/svg/hyphen.svg';

    if (!Categories().nonGenderedSubcategories.contains(widget
        .panelSettings
        .categories[widget.panelSettings.activeCategoryIndex]
        .subcategories[widget
            .panelSettings
            .categories[widget.panelSettings.activeCategoryIndex]
            .activeSubcategory]
        .getName())) {
      if (widget.panelSettings.activeGender == Gender.feminine) {
        icons.add('lib/assets/icons/svg/feminine.svg');
      } else if (widget.panelSettings.activeGender == Gender.masculine) {
        icons.add('lib/assets/icons/svg/masculine.svg');
      } else {
        icons.add('lib/assets/icons/svg/hyphen.svg');
      }
    }

    return icons;
  }

  double getPanelSize(PanelSettings settings, bool viewSettings) {
    // base panel
    if (!viewSettings) {
      return 75.0;
    }

    // syllabled subcategories
    if (Categories().syllabledSubcategories.contains(
          settings
              .categories[settings.activeCategoryIndex]
              .subcategories[settings
                  .categories[settings.activeCategoryIndex].activeSubcategory]
              .getName(),
        )) {
      return 217.0;
    }

    // only one subcategory
    if (settings
            .categories[settings.activeCategoryIndex].subcategories.length ==
        1) {
      return 145.0;
    }

    // multiple subcategories, active subcategory is not syllabled
    else {
      return 187.0;
    }
  }
}
