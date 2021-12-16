import 'package:flutter/material.dart';

class FutureBuilderHelperClass {
  static final Widget kDefaultLoader = Column(
    children: const [
      SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text('Loading...'),
      )
    ],
  );

  static FutureBuilder getFutureBuilderHelper(
      Future futureElement, Function hasDataWidget, Function hasErrorWidget,
      {dynamic loaderWidgetBuilder}) {
    return FutureBuilder(
      future: futureElement, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Widget children;
        if (snapshot.hasData) {
          children = hasDataWidget(snapshot);
        } else if (snapshot.hasError) {
          children = hasErrorWidget(snapshot);
        } else {
          children = loaderWidgetBuilder ?? kDefaultLoader;
        }
        return children;
      },
    );
  }
}
