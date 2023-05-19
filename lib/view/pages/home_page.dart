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

  @override
  void initState() {
    super.initState();
    App().rerollNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenAppBar(
        bottomSelectedIndex: App().bottomSelectedIndex,
        currentRouteName: ModalRoute.of(context)!.settings.name!,
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
        backgroundColor: Theme.of(context).primaryColor,
        selectedLabelStyle: TextStyle(
          color: Palette().scaffoldWhite,
          fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
          fontWeight: FontWeight.w200,
        ),
        selectedItemColor: Palette().scaffoldWhite,
        currentIndex: App().bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: actions,
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      App().bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      App().bottomSelectedIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
}
