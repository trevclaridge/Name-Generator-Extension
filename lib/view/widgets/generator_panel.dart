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
  bool sliderHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
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
                          trackColor: Palette().scaffoldWhite,
                          activeColor: Palette().genOrange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 12.0),
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                            child: GenAction(
                              fullName: widget.panelName.getName(),
                              buttonBehavior: () =>
                                  _onCopyClick(widget.panelName.getName()),
                              icon: FontAwesomeIcons.copy,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: GenAction(
                              fullName: widget.panelName.getName(),
                              buttonBehavior: _onRerollClick,
                              icon: FontAwesomeIcons.arrowsRotate,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: GenAction(
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
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 17.0, top: 8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 1.0,
                          color: Palette().genOrange,
                        ),
                        getSettings(),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSettings() {
    List<Widget> settings = [];
    settings.add(getCategories());
    if (getSubcategories() != null) {
      settings.add(getSubcategories()!);
    }
    if (getNameLength() != null) {
      settings.add(getNameLength()!);
    }
    return Column(children: [
      Container(
        height: 1.0,
        color: Palette().genOrange,
      ),
      ...settings
    ]);
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
    App().addNameToSaved(
      SavedName(
        name: widget.panelName.name,
        category: widget
            .panelSettings.categories[widget.panelSettings.activeCategoryIndex],
        subcategory: widget
                .panelSettings
                .categories[widget.panelSettings.activeCategoryIndex]
                .subcategories[
            widget
                .panelSettings
                .categories[widget.panelSettings.activeCategoryIndex]
                .activeSubcategory],
        date: DateTime.now(),
        gender: widget.panelSettings.activeGender,
      ),
    );
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

    if (!Categories().nonGenderedSubcategories.contains(widget
        .panelSettings
        .categories[widget.panelSettings.activeCategoryIndex]
        .subcategories[widget
            .panelSettings
            .categories[widget.panelSettings.activeCategoryIndex]
            .activeSubcategory]
        .getName())) {
      if (widget.panelSettings.activeGender == Gender.feminine) {
        icons.add('assets/icons/svg/feminine.svg');
      } else if (widget.panelSettings.activeGender == Gender.masculine) {
        icons.add('assets/icons/svg/masculine.svg');
      }
    }

    return icons;
  }

  Widget getCategories() {
    return Padding(
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
                      widget.panelSettings.categories.length,
                      (index) => PanelButtonToggleable(
                        iconString: widget.panelSettings.categories[index].icon,
                        tooltip:
                            widget.panelSettings.categories[index].getName(),
                        buttonBehavior: () => _onToggleCategoryClick(index),
                        toggled:
                            widget.panelSettings.activeCategoryIndex == index,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          getGenders() ?? Container(),
        ],
      ),
    );
  }

  Widget? getSubcategories() {
    if (widget
            .panelSettings
            .categories[widget.panelSettings.activeCategoryIndex]
            .subcategories
            .length >
        1) {
      return Padding(
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
                          .categories[widget.panelSettings.activeCategoryIndex]
                          .subcategories
                          .length,
                      (index) => PanelButtonToggleable(
                          iconString: widget
                              .panelSettings
                              .categories[
                                  widget.panelSettings.activeCategoryIndex]
                              .subcategories[index]
                              .icon,
                          tooltip: widget
                              .panelSettings
                              .categories[
                                  widget.panelSettings.activeCategoryIndex]
                              .subcategories[index]
                              .getName(),
                          buttonBehavior: () =>
                              _onToggleSubcategoryClick(index),
                          toggled: widget
                                  .panelSettings
                                  .categories[
                                      widget.panelSettings.activeCategoryIndex]
                                  .activeSubcategory ==
                              index),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return null;
    }
  }

  Widget? getNameLength() {
    if (Categories().syllabledSubcategories.contains(widget
        .panelSettings
        .categories[widget.panelSettings.activeCategoryIndex]
        .subcategories[widget
            .panelSettings
            .categories[widget.panelSettings.activeCategoryIndex]
            .activeSubcategory]
        .getName())) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 2.0,
              ),
              child: Text(
                'Name length:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Palette().textBlack.withOpacity(0.85),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Counter(
                panelSettings: widget.panelSettings,
                panelNum: widget.panelNum,
              ),
            )
          ],
        ),
      );
    } else {
      return null;
    }
  }

  Widget? getGenders() {
    if (!Categories().nonGenderedSubcategories.contains(
          widget
              .panelSettings
              .categories[widget.panelSettings.activeCategoryIndex]
              .subcategories[widget
                  .panelSettings
                  .categories[widget.panelSettings.activeCategoryIndex]
                  .activeSubcategory]
              .getName(),
        )) {
      return Row(
        children: [
          PanelButtonToggleable(
            tooltip: 'Feminine',
            iconString: 'assets/icons/svg/feminine.svg',
            buttonBehavior: () => App().toggleGenderPanelButton(
              widget.panelNum,
              Gender.feminine,
            ),
            toggled: widget.panelSettings.activeGender == Gender.feminine,
          ),
          PanelButtonToggleable(
            tooltip: 'Gender Neutral',
            iconString: 'assets/icons/svg/hyphen.svg',
            buttonBehavior: () => App().toggleGenderPanelButton(
              widget.panelNum,
              Gender.genderNeutral,
            ),
            toggled: widget.panelSettings.activeGender == Gender.genderNeutral,
          ),
          PanelButtonToggleable(
            tooltip: 'Masculine',
            iconString: 'assets/icons/svg/masculine.svg',
            buttonBehavior: () => App().toggleGenderPanelButton(
              widget.panelNum,
              Gender.masculine,
            ),
            toggled: widget.panelSettings.activeGender == Gender.masculine,
          ),
        ],
      );
    } else {
      return null;
    }
  }
}
