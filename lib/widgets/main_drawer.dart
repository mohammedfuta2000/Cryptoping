import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/my_alerts.dart';
import '../pages/profile_page.dart';
import '../pages/set_alert_page.dart';
import '../providers/theme_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print(ModalRoute.of(context)?.settings.name);
    return Drawer(
        width: 150,
        child: Container(
          color: theme.primaryColor,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     repeat: ImageRepeat.repeatY,
          //     image: AssetImage('assets/background.jpg'),
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ProfilePage.route),
                    icon: const Icon(Icons.account_circle),
                    iconSize: 45),
                // Text('Profile'),
                const SizedBox(height: 20),
                if (ModalRoute.of(context)?.settings.name ==
                    "/SetAlertPageRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () =>
                        Navigator.of(context).popAndPushNamed(MyAlerts.route),
                    child: const Text('My Alerts',
                        style: TextStyle(color: Colors.white)),
                  ),
                if (ModalRoute.of(context)?.settings.name == "/MyAlertsRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => Navigator.of(context)
                        .popAndPushNamed(SetAlertPage.route),
                    child: Text('Set Alerts',
                        style: TextStyle(color: Colors.white)),
                  ),
                SizedBox(height: 20),
                ToggleButtons(
                    borderRadius: BorderRadius.circular(30),
                    selectedColor: Colors.black,
                    fillColor: theme.backgroundColor,
                    children: [Icon(Icons.sunny), Icon(Icons.nightlight)],
                    isSelected: [
                      Provider.of<ThemeProvider>(context).getThemeValue,
                      !Provider.of<ThemeProvider>(context).getThemeValue
                    ],
                    onPressed: (_) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme()),
                SizedBox(height: 250),
              ],
            ),
          ),
        ));
  }
}
