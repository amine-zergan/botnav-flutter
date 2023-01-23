import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page one for animation Package",
          style: Theme.of(context).textTheme.headline5),
    );
  }
}
