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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text('Random Names',
              style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        actions: [
          (bottomSelectedIndex == 0)
              ? Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    children: [
                      InkWell(
                        splashColor: Palette().genOrange,
                        enableFeedback: true,
                        onTap: () => App().rerollNames(),
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Palette().genOrangeAccent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 90.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  color: Palette().genOrange,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0, vertical: 1.0),
                                  child: Text(
                                    'Generate',
                                    style: TextStyle(
                                        color: Palette().scaffoldWhite,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
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
            fontWeight: FontWeight.w200),
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
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
