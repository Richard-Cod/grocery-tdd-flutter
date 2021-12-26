import 'package:flutter/material.dart';

import '../../utils/StateHelper.dart';

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

  static getWidgetFromStateHelper(
      StateHelper stateHelper, Function hasDataWidget, Function hasErrorWidget,
      {dynamic loaderWidgetBuilder}) {
    if (stateHelper.error != null) {
      return hasErrorWidget(stateHelper.error);
    }

    if (stateHelper.loading) {
      return kDefaultLoader;
    }

    if (stateHelper.emptyData == 0) {
      return Text("Aucune donnée pour le moment ");
    }

    return hasDataWidget(stateHelper.data);
  }
}
