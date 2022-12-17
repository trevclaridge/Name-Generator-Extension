part of view;

class NewGeneratedPanel extends StatefulWidget {
  const NewGeneratedPanel({Key? key}) : super(key: key);

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
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: Palette().genOrangeAccent,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: (viewSettings) ? 170.0 : 70,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
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
                          Text('Annvaryaed Enkethdonor',
                              style: Palette().nameStyle),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: NameAction(
                                    fullName: 'Annvaryaed Enkethdonor',
                                    buttonBehavior: () {},
                                    icon: FontAwesomeIcons.copy),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: NameAction(
                                    fullName: 'Annvaryaed Enkethdonor',
                                    buttonBehavior: () {},
                                    icon: FontAwesomeIcons.arrowsRotate),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: NameAction(
                                    fullName: 'Annvaryaed Enkethdonor',
                                    buttonBehavior: () {},
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  PanelButtonToggleable(
                                      tooltip: 'Modern',
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
                                      toggled: false)
                                ],
                              ),
                              Row(
                                children: [
                                  PanelButtonToggleable(
                                      tooltip: 'Gender Neutral',
                                      icon: FontAwesomeIcons.venusMars,
                                      buttonBehavior: () {},
                                      toggled: true),
                                  PanelButtonToggleable(
                                      tooltip: 'Female',
                                      icon: FontAwesomeIcons.mars,
                                      buttonBehavior: () {},
                                      toggled: false),
                                  PanelButtonToggleable(
                                      tooltip: 'Male',
                                      icon: FontAwesomeIcons.venus,
                                      buttonBehavior: () {},
                                      toggled: false),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.4,
                                          color: Palette().genOrange,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: Palette().genOrange,
                                          size: 10.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      '3',
                                      style: Palette().nameStyle.copyWith(
                                            color: const Color(0xFF1E1E1E)
                                                .withOpacity(0.85),
                                          ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.4,
                                          color: Palette().genOrange,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: Palette().genOrange,
                                          size: 10.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
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
    );
  }
}
