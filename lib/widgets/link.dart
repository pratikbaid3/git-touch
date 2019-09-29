import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/theme.dart';

class Link extends StatelessWidget {
  final Widget child;
  final String url;
  final WidgetBuilder screenBuilder;
  final Function onTap;
  final bool material;

  Link({
    this.child,
    this.url,
    this.screenBuilder,
    this.onTap,
    this.material = true,
  }) : assert(screenBuilder == null || url == null);

  void _onTap(BuildContext context) {
    if (onTap != null) {
      return onTap();
    }
    if (screenBuilder != null) {
      return Provider.of<ThemeModel>(context).pushRoute(context, screenBuilder);
    }
    if (url != null) {
      launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!material) {
      return GestureDetector(
        child: child,
        onTap: () => _onTap(context),
      );
    }

    return Material(
      child: Ink(
        color: Colors.white,
        child: InkWell(
          child: child,
          // splashColor:
          //     theme == AppThemeType.cupertino ? Colors.transparent : null,
          onTap: () => _onTap(context),
        ),
      ),
    );
  }
}
