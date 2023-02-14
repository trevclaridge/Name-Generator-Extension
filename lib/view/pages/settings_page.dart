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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Palette().genOrangeAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'NGE',
                  style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      fontSize: 14.0,
                      color: Palette().textBlack,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                'A name generating extension.',
                style: Theme.of(context)
                    .appBarTheme
                    .titleTextStyle!
                    .copyWith(fontSize: 12.0),
              ),
            ),
          ],
        ),
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
                onTap: () {
                  _launchUrl(
                      'https://github.com/trevclaridge/Name-Generator-Extension/blob/main/assets/attributions.md');
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Palette().genOrange,
                      strokeAlign: StrokeAlign.outside,
                      width: 1.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                hoverColor: Palette().genOrangeAccent,
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
                      color: Palette().genOrange,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      border: Border.all(
                        width: 1.2,
                        color: (colorSwatchHovered)
                            ? Palette().sliderGrey
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
                    hoverColor: Palette().genOrangeAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Palette().genOrange,
                        strokeAlign: StrokeAlign.outside,
                        width: 1.2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    activeTrackColor: Palette().genOrange,
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
                },
                hoverColor: Palette().genOrangeAccent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Palette().genOrange,
                      strokeAlign: StrokeAlign.outside,
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
                      'https://github.com/trevclaridge/Name-Generator-Extension/blob/main/lib/assets/attributions.md');
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Palette().genOrange,
                      strokeAlign: StrokeAlign.outside,
                      width: 1.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                hoverColor: Palette().genOrangeAccent,
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
