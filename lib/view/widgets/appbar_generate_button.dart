part of view;

class AppBarGenerateButton extends StatelessWidget {
  const AppBarGenerateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      enableFeedback: true,
      onTap: () => App().rerollNames(),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 90.0,
            height: 25.0,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
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
    );
  }
}
