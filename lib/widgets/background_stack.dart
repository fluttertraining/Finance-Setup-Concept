import 'package:flutter/material.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        this.child,
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/pattern.png',
            filterQuality: FilterQuality.high,
            height: 225,
            width: MediaQuery.of(context).size.width * 0.71,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
