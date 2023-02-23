part of view;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> actions = const [
    BottomNavigationBarItem(icon: Icon(Icons.reorder), label: 'Generator'),
    BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Saved'),
  ];
  PageController pageController = App().appPageController;
  int bottomSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    App().rerollNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'NGE',
                    style: Theme.of(context)
                        .appBarTheme
                        .titleTextStyle!
                        .copyWith(
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: Row(
              children: [
                (bottomSelectedIndex == 0)
                    ? const AppBarGenerateButton()
                    : Container(),
                const SizedBox(width: 15.0),
                GenAction(
                  fullName: 'placeholder',
                  buttonBehavior: () =>
                      Navigator.pushNamed(context, 'settings'),
                  icon: Icons.settings,
                ),
              ],
            ),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: const <Widget>[
          GeneratorPage(),
          SavedPage(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   selectedLabelStyle: TextStyle(
      //     color: Palette().scaffoldWhite,
      //     fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      //     fontWeight: FontWeight.w200,
      //   ),
      //   selectedItemColor: Palette().scaffoldWhite,
      //   currentIndex: bottomSelectedIndex,
      //   onTap: (index) {
      //     bottomTapped(index);
      //   },
      //   items: actions,
      // ),
      bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBottomNavigationBarButton(
                text: 'Generator',
                icon: FontAwesomeIcons.arrowsRotate,
                buttonBehavior: () {},
              ),
              Text(
                'Saved',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Palette().scaffoldWhite,
                      fontWeight: FontWeight.normal,
                    ),
              )
            ],
          )
          // width: MediaQuery.of(context).size.width,
          ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
}

class CustomBottomNavigationBarButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback buttonBehavior;

  const CustomBottomNavigationBarButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.buttonBehavior,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBarButton> createState() =>
      _CustomBottomNavigationBarButtonState();
}

class _CustomBottomNavigationBarButtonState
    extends State<CustomBottomNavigationBarButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        focusColor: Theme.of(context).colorScheme.secondary,
        onTap: widget.buttonBehavior,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Palette().scaffoldWhite,
                size: 16.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Palette().scaffoldWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
