import 'package:finance_manager/widgets/background_stack.dart';
import 'package:flutter/material.dart';

class SetupMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[100],
      body: BackgroundStack(
        child: SafeArea(
          bottom: false,
          child: Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Methods",
                  style: Theme.of(context).textTheme.display2.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      _Method(),
                      _Method(),
                      _Method(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Method extends StatelessWidget {
  const _Method({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/icons/money.png',
                height: 60,
                width: 60,
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Incremental Saving",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Save when you spend less then your budget",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/icons/cash.png',
                height: 40,
                width: 40,
              ),
              SizedBox(width: 16),
              Flexible(
                child: Text(
                  "This recommendation is if you're new at saving or just a student.",
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
