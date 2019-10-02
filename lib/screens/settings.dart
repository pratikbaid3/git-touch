import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/screens/credits.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:launch_review/launch_review.dart';
import '../widgets/table_view.dart';
import '../screens/login.dart';

class SettingsScreen extends StatelessWidget {
  Widget _buildRightWidget(bool checked) {
    if (!checked) return null;
    return Icon(Octicons.check, color: CupertinoColors.activeBlue, size: 24);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeModel>(context);

    return SingleScaffold(
      title: AppBarTitle('Settings'),
      body: Column(
        children: <Widget>[
          verticalGap,
          TableView(headerText: 'ACCOUNTS', items: [
            TableViewItem(
              text: Text('Switch to another account'),
              screenBuilder: (_) => LoginScreen(),
            ),
          ]),
          verticalGap,
          TableView(headerText: 'THEME', items: [
            TableViewItem(
              text: Text('Material'),
              rightWidget: _buildRightWidget(
                  themeProvider.theme == AppThemeType.material),
              onTap: () {
                if (themeProvider.theme != AppThemeType.material) {
                  themeProvider.setTheme(AppThemeType.material);
                }
              },
              hideRightChevron: true,
            ),
            TableViewItem(
              text: Text('Cupertino'),
              rightWidget: _buildRightWidget(
                  themeProvider.theme == AppThemeType.cupertino),
              onTap: () {
                if (themeProvider.theme != AppThemeType.cupertino) {
                  themeProvider.setTheme(AppThemeType.cupertino);
                }
              },
              hideRightChevron: true,
            ),
          ]),
          verticalGap,
          TableView(headerText: 'ABOUT', items: [
            TableViewItem(
              text: Text('Source Code'),
              screenBuilder: (_) => RepositoryScreen('pd4d10', 'git-touch'),
            ),
            TableViewItem(
              text: Text('Credits'),
              screenBuilder: (_) => CreditsScreen(),
            ),
            TableViewItem(
              text: Text('Rate This App'),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: 'io.github.pd4d10.gittouch',
                  iOSAppId: '1452042346',
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}
