// ignore_for_file: must_be_immutable

part of view;

class SavedNamePanel extends StatefulWidget {
  const SavedNamePanel({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  final FullName fullName;

  @override
  State<SavedNamePanel> createState() => _SavedNamePanelState();
}

class _SavedNamePanelState extends State<SavedNamePanel> {
  Color savedNamePanelColor = Colors.transparent;
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 95,
        child: MouseRegion(
          onEnter: _onEnter,
          onHover: _onHover,
          onExit: _onExit,
          child: Container(
            color: savedNamePanelColor,
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SelectableText(
                    widget.fullName.getCombinedName(),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 32.0),
                  ),
                ),
                const SizedBox(height: 8.0),
                Visibility(
                  visible: hovered,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          NameAction(
                              fullName: widget.fullName.getCombinedName(),
                              buttonBehavior: () => _onCopyClick(
                                  widget.fullName.getCombinedName()),
                              icon: FontAwesomeIcons.copy),
                          const SizedBox(width: 10.0),
                          NameAction(
                              fullName: widget.fullName.getCombinedName(),
                              buttonBehavior: () => onDeleteClick(),
                              icon: FontAwesomeIcons.trash)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onExit(event) {
    setState(() {
      savedNamePanelColor = Colors.transparent;
      hovered = false;
    });
  }

  void _onHover(event) {
    setState(() {
      savedNamePanelColor = const Color(0xffF6F6F6);
    });
  }

  void _onEnter(event) {
    setState(() {
      savedNamePanelColor = const Color(0xffF6F6F6);
      hovered = true;
    });
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

  void onDeleteClick() {
    setState(() {
      App().deleteNameFromSaved(widget.fullName);
    });
  }
}
