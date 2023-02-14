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
        shadowColor: Palette().genOrange,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette().genOrange,
        selectedLabelStyle: TextStyle(
          color: Palette().scaffoldWhite,
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          fontWeight: FontWeight.w200,
        ),
        selectedItemColor: Palette().scaffoldWhite,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: actions,
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
