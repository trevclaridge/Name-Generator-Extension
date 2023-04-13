part of view;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool colorSwatchHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GenAction(
          fullName: 'placeholder',
          buttonBehavior: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/logos/gears/svg/${UserSettings().themeMap[UserSettings().userTheme]}_gear.svg',
              width: 45.0,
              height: 45.0,
            ),
            const SizedBox(width: 6.0),
            Text(
              'NGE',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: Consumer<UserSettings>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    (UserSettings().showDiceRoller)
                        ? Row(
                            children: [
                              GenAction(
                                  fullName: 'placeholder',
                                  buttonBehavior: () {},
                                  icon: FontAwesomeIcons.diceD6),
                              const SizedBox(width: 15.0),
                            ],
                          )
                        : Container(),
                  ],
                );
              },
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                child: Text(
                  'Customize',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: Palette().sliderGrey),
                ),
              ),
              ListTile(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'Pick a theme color!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    content: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ColorThemeSwatchTile(
                                theme: CustomTheme().blueTheme,
                              ),
                              ColorThemeSwatchTile(
                                theme: CustomTheme().greenTheme,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ColorThemeSwatchTile(
                                theme: CustomTheme().orangeTheme,
                              ),
                              ColorThemeSwatchTile(
                                theme: CustomTheme().purpleTheme,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.secondary),
                        ),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 1.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                hoverColor: Theme.of(context).colorScheme.secondary,
                title: Text(
                  'App Theme Color',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14.0),
                ),
                trailing: MouseRegion(
                  onHover: (event) {
                    setState(() {
                      colorSwatchHovered = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      colorSwatchHovered = false;
                    });
                  },
                  child: Container(
                    width: 70.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      border: Border.all(
                        width: 1.2,
                        color: (colorSwatchHovered)
                            ? Palette().textBlack
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Consumer<UserSettings>(
                builder: (context, value, child) {
                  return SwitchListTile(
                    onChanged: (bool value) {
                      UserSettings().toggleDiceRoller();
                    },
                    hoverColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 1.2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Palette().sliderGrey,
                    title: Text(
                      'Show Dice Roller',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                    value: UserSettings().showDiceRoller,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 2.0),
                child: Text(
                  'Name Generator Extension',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Palette().sliderGrey,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  _launchUrl(
                      'https://github.com/trevclaridge/Name-Generator-Extension');
                  // var value = JavascriptController().getSyncValue("hello");
                  // print(value);
                },
                hoverColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 1.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                title: Text(
                  'Help us build this extension!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14.0),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.github,
                  color: Color(0xFF24292F),
                ),
              ),
              const SizedBox(height: 8.0),
              ListTile(
                onTap: () {
                  _launchUrl(
                      'https://github.com/trevclaridge/Name-Generator-Extension/blob/main/assets/attributions.md');
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 1.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                hoverColor: Theme.of(context).colorScheme.secondary,
                title: Text(
                  'Attributions',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) {
    js.context.callMethod('open', [url]);
  }
}
