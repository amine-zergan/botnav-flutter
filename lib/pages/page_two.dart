import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page Two for animation Package",
          style: Theme.of(context).textTheme.headline5),
    );
  }
}
