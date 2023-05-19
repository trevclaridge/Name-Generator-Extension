part of view;

class GenAppBar extends StatelessWidget with PreferredSizeWidget {
  const GenAppBar({
    super.key,
    required this.bottomSelectedIndex,
    required this.currentRouteName,
  });

  final int bottomSelectedIndex;
  final String currentRouteName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Theme.of(context).primaryColor,
      leading: (currentRouteName != 'home')
          ? GenAction(
              fullName: 'placeholder',
              buttonBehavior: () => Navigator.pop(context),
              icon: Icons.arrow_back,
            )
          : null,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.asset(
              'assets/logos/gears/svg/${UserSettings().themeMap[UserSettings().userTheme]}_gear.svg',
              width: 45.0,
              height: 45.0,
            ),
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
                  (bottomSelectedIndex == 0 && currentRouteName == 'home')
                      ? const AppBarGenerateButton()
                      : Container(),
                  const SizedBox(width: 15.0),
                  (UserSettings().showDiceRoller)
                      ? Row(
                          children: [
                            GenAction(
                                fullName: 'placeholder',
                                buttonBehavior: () =>
                                    showDiceRollerDialog(context),
                                icon: FontAwesomeIcons.diceD6),
                            const SizedBox(width: 15.0),
                          ],
                        )
                      : Container(),
                  (currentRouteName != 'settings')
                      ? GenAction(
                          fullName: 'placeholder',
                          buttonBehavior: () =>
                              Navigator.pushNamed(context, 'settings'),
                          icon: FontAwesomeIcons.gear,
                        )
                      : Container(),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
