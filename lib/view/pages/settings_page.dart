part of view;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GenAction(
          fullName: 'placeholder',
          buttonBehavior: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
        title: Text('Random Names',
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              _launchUrl(
                  'https://github.com/trevclaridge/Name-Generator-Extension');
            },
            title: const Text('Help build this app!'),
          ),
          ListTile(
            onTap: () {
              _launchUrl(
                  'https://github.com/trevclaridge/Name-Generator-Extension/blob/main/lib/assets/attributions.md');
            },
            title: const Text('Attributions'),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) {
    js.context.callMethod('open', [url]);
  }
}
