import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.text, {
    Key key,
    @required this.onPressed,
    this.isPrimary = false,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        elevation: 0,
        color: !this.isPrimary
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
        child: Text(
          this.text,
          style: Theme.of(context).textTheme.button.copyWith(
                color: !this.isPrimary
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        onPressed: this.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
