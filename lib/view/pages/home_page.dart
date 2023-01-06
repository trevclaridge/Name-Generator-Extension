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

  //   List<BottomNavigationAction> actions = const [
  //   BottomNavigationAction(icon: Icons.reorder, label: 'Generator', selected: true,),
  //   BottomNavigationAction(icon: Icons.archive, label: 'Saved', selected: false,),
  // ];

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
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text('Random Names', style: Palette().titleStyle),
        ),
        backgroundColor: Palette().genOrange,
        foregroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          (bottomSelectedIndex == 0)
              ? Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
                        onPressed: () {
                          App().rerollNames();
                        },
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
        selectedItemColor: Palette().genOrange,
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

class BottomNavigationAction extends StatefulWidget {
  const BottomNavigationAction(
      {super.key,
      required this.selected,
      required this.icon,
      required this.label});

  final bool selected;
  final IconData icon;
  final String label;

  @override
  State<BottomNavigationAction> createState() => _BottomNavigationActionState();
}

class _BottomNavigationActionState extends State<BottomNavigationAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color:
            (widget.selected) ? Colors.transparent : Palette().genOrangeAccent,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(widget.icon, color: Colors.white),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
