import 'package:flutter/material.dart';

import 'package:finance_manager/helpers/capitalize_first_letter.dart';

import 'package:finance_manager/widgets/button.dart';
import 'package:finance_manager/widgets/scroll_view.dart';

class SetupSavings extends StatefulWidget {
  @override
  _SetupSavingsState createState() => _SetupSavingsState();
}

class _SetupSavingsState extends State<SetupSavings> {
  static final _frequencies = ["daily", "weekly", "monthly"];

  final TextEditingController _savingsController =
      TextEditingController(text: "PHP 50");

  String _selectedFrequency = "daily";

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  void _onSelectFrequency(String frequency) {
    setState(() {
      _selectedFrequency = frequency;
      print(_selectedFrequency);
    });
  }

  void _onPressContinue() {
    Navigator.of(context).pop(_savingsController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: AppScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "How Much Is Your \n Income / Allowance?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 24),
                    AnimatedContainer(
                      curve: Curves.easeInOutExpo,
                      duration: Duration(milliseconds: 500),
                      height: !_keyboardIsVisible() ? 128 : 64,
                      width: !_keyboardIsVisible() ? 140 : 70,
                      child: Image.asset(
                        'assets/images/holding-money.png',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _savingsController,
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (String frequency in _frequencies)
                          _FrequencyButton(
                            text: frequency.capitalize(),
                            onPressed: () => _onSelectFrequency(frequency),
                            currentFrequency: this._selectedFrequency,
                          ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Center(
                        child: CustomButton(
                          "Continue",
                          onPressed: _onPressContinue,
                          isPrimary: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class _FrequencyButton extends StatelessWidget {
  const _FrequencyButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.currentFrequency,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final String currentFrequency;

  bool get _isSelected => this.currentFrequency == text.toLowerCase();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOutCubic,
      duration: Duration(milliseconds: 700),
      height: _isSelected ? 85 : 75,
      width: _isSelected ? 85 : 75,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        color: _isSelected ? Colors.blue : Colors.grey[100],
      ),
      child: Stack(
        children: <Widget>[
          RawMaterialButton(
            onPressed: this.onPressed,
            shape: new CircleBorder(),
            fillColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 300),
                child: Text(this.text),
                style: TextStyle(
                  fontSize: 14,
                  color: _isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: this.onPressed,
            borderRadius: BorderRadius.circular(120),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              opacity: _isSelected ? 1 : 0,
              child: AnimatedContainer(
                curve: Curves.easeInOutCirc,
                duration: Duration(milliseconds: 300),
                height: _isSelected ? 85 : 75,
                width: _isSelected ? 85 : 75,
                child: Image.asset('assets/images/button_mask.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
