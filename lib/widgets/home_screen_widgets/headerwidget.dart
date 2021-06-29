import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shopping App".text.xl4.bold.color(context.theme.accentColor).make(),
        SizedBox(
          height: 10,
        ),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}