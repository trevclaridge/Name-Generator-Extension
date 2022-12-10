part of view;

class NamePanel extends StatefulWidget {
  const NamePanel({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  final FullName fullName;

  @override
  State<NamePanel> createState() => _NamePanelState();
}

class _NamePanelState extends State<NamePanel> {
  Color namePanelColor = Colors.transparent;
  Color saveColor = const Color(0xFFC7CACC);
  bool iconsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 90,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              namePanelColor = const Color(0xffF6F6F6);
              iconsVisible = true;
            });
          },
          onHover: (event) {
            setState(() {
              namePanelColor = const Color(0xffF6F6F6);
            });
          },
          onExit: (event) {
            setState(() {
              namePanelColor = Colors.transparent;
              iconsVisible = false;
            });
          },
          child: Container(
            color: namePanelColor,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 8.0),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SelectableText(
                    widget.fullName.getCombinedName(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 36.0),
                  ),
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: iconsVisible,
                      child: NameAction(
                          fullName: widget.fullName.getCombinedName(),
                          buttonBehavior: () =>
                              _onCopyClick(widget.fullName.getCombinedName()),
                          icon: Icons.copy),
                    ),
                    const SizedBox(width: 10.0),
                    Visibility(
                        visible: iconsVisible,
                        child: NameAction(
                            fullName: widget.fullName.getCombinedName(),
                            buttonBehavior: onSaveClick,
                            icon: Icons.save)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSaveClick() {
    App().addNameToSaved(widget.fullName);
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
}
