import 'package:finance_manager/screens/setup_method.dart';
import 'package:finance_manager/screens/setup_savings.dart';
import 'package:flutter/material.dart';
import 'package:finance_manager/widgets/background_stack.dart';
import 'package:finance_manager/widgets/button.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class _StepClass {
  int id;
  String title;
  String description;
  bool isFinished;
  String imgName;

  _StepClass({
    @required this.title,
    @required this.description,
    @required this.id,
    @required this.isFinished,
    @required this.imgName,
  });
}

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  List<_StepClass> _steps = [
    _StepClass(
      id: 1,
      title: "Step 1",
      description: "Setup a savings goal",
      isFinished: false,
      imgName: 'saving.png',
    ),
    _StepClass(
      id: 2,
      title: "Step 2",
      description: "Decide how to save for it",
      isFinished: false,
      imgName: 'rules.png',
    ),
    _StepClass(
      id: 3,
      title: "Step 3",
      description: "Link your bank to start saving",
      isFinished: false,
      imgName: 'bank.png',
    ),
  ];

  String _currentStep = "Step 1";

  void _onCompleteStep(int id) {
    final int ndx = _steps.indexWhere((_StepClass step) => step.id == id);

    setState(() {
      _currentStep = "Step ${(id + 1).toString()}";

      _steps[ndx].isFinished = true;
    });
  }

  void _onSetup(int id) async {
    if (id == 1) {
      final String savings = await Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (_) => SetupSavings(),
        ),
      );

      print(savings);
    }

    if (id == 2) {
      final int savings = await Navigator.of(context).push(
        platformPageRoute(
          context: context,
          builder: (_) => SetupMethod(),
        ),
      );
    }

    _onCompleteStep(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Setup"),
      ),
      // backgroundColor: Colors.white,
      body: BackgroundStack(
        child: SafeArea(
          bottom: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child:
                LayoutBuilder(builder: (context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (var step in _steps)
                      _Step(
                        currentStep: _currentStep,
                        step: step,
                        onPressed: () => _onSetup(step.id),
                        height: constraints.maxHeight *
                            (_currentStep == step.title ? 0.55 : 0.225),
                      ),
                    _currentStep == "Step 4"
                        ? Container(
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.symmetric(horizontal: 36),
                            child: CustomButton(
                              "Start Budgeting!",
                              onPressed: () {},
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    Key key,
    @required this.step,
    @required this.currentStep,
    @required this.onPressed,
    @required this.height,
  }) : super(key: key);

  final String currentStep;
  final _StepClass step;
  final Function onPressed;
  final double height;

  bool get _isCurrentStep => this.currentStep == step.title;

  Color _backgroundColor(BuildContext context) {
    return step.isFinished || _isCurrentStep
        ? Theme.of(context).primaryColor
        : Colors.white;
  }

  Color _subHeadColor(BuildContext context) {
    return step.isFinished
        ? Color.fromRGBO(119, 230, 182, 1)
        : Theme.of(context).primaryColor;
  }

  Color _descriptionColor(BuildContext context) {
    return step.isFinished ? Colors.white : Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor(context),
      child: AnimatedContainer(
        curve: Curves.easeInOutExpo,
        height: height,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 800),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 55),
          child: _isCurrentStep
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _isCurrentStep ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Image.asset(
                          'assets/images/${step.imgName}',
                          filterQuality: FilterQuality.high,
                          height: 150,
                          width: 200,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        this.step.title,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 12),
                      Text(
                        this.step.description,
                        style: Theme.of(context).textTheme.headline,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35),
                      CustomButton("Let's start", onPressed: this.onPressed),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.step.isFinished
                          ? "${this.step.title} • Done"
                          : this.step.title,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .apply(color: _subHeadColor(context)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      this.step.description,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .apply(color: _descriptionColor(context)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
