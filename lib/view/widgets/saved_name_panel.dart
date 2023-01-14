// ignore_for_file: must_be_immutable

part of view;

class SavedNamePanel extends StatefulWidget {
  const SavedNamePanel({
    Key? key,
    required this.savedName,
  }) : super(key: key);

  final SavedName savedName;

  @override
  State<SavedNamePanel> createState() => _SavedNamePanelState();
}

class _SavedNamePanelState extends State<SavedNamePanel> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: MouseRegion(
        onHover: _onHover,
        onExit: _onExit,
        child: SizedBox(
          height: 70.0,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette().genOrangeAccent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SelectableText(
                          widget.savedName.name,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 24.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ),
                        ),
                        Text(
                          Constants.DATE_FORMAT.format(widget.savedName.date),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                visible: hovered,
                child: SizedBox(
                  width: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      top: 8.0,
                    ),
                    child: Row(
                      children: [
                        GenAction(
                            fullName: widget.savedName.name,
                            buttonBehavior: () =>
                                _onCopyClick(widget.savedName.name),
                            icon: FontAwesomeIcons.copy),
                        const SizedBox(width: 10.0),
                        GenAction(
                            fullName: widget.savedName.name,
                            buttonBehavior: () => onDeleteClick(),
                            icon: FontAwesomeIcons.trash)
                      ],
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

  List<String> getIcons() {
    List<String> icons = [];
    icons.add(widget.savedName.category.icon);

    if (widget.savedName.category.subcategories.length > 1) {
      icons.add(widget.savedName.subcategory.icon);
    }

    if (!Categories()
        .nonGenderedSubcategories
        .contains(widget.savedName.subcategory.getName())) {
      if (widget.savedName.gender == Gender.feminine) {
        icons.add('assets/icons/svg/feminine.svg');
      } else if (widget.savedName.gender == Gender.masculine) {
        icons.add('assets/icons/svg/masculine.svg');
      }
    }

    return icons;
  }

  void _onExit(event) {
    setState(() {
      hovered = false;
    });
  }

  void _onHover(event) {
    setState(
      () {
        hovered = true;
      },
    );
  }

  void _onCopyClick(String name) async {
    await Clipboard.setData(
      ClipboardData(
        text: widget.savedName.name,
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
      App().deleteNameFromSaved(widget.savedName);
    });
  }
}
