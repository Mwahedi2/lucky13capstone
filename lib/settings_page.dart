import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lucky13capstone/brickview_page.dart';
import 'package:lucky13capstone/dev_page.dart';
import 'settings_model.dart';
import 'package:provider/provider.dart';
import 'styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
<<<<<<< HEAD
  TextStyle headingStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      //fontWeight: FontWeight.w600,
      color: Color.fromARGB(223, 5, 1, 23));

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  TextStyle headingStyleIOS = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color.fromARGB(223, 89, 212, 161),
  );
  TextStyle descStyleIOS =
      const TextStyle(color: Color.fromARGB(255, 40, 13, 194));

  void _logout() {
=======
  void _logout(BuildContext context) {
>>>>>>> 828b9eb12b76c93b34acc302d7d8ae0b20eab4e6
    FirebaseAuth.instance.signOut();

    // Call setState to trigger a rebuild
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<< HEAD
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "General",
                    style: headingStyle,
                  ),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.cloud),
                title: Text("History"),
                subtitle: Text("Settings"),
              ),
              const Divider(),
              ListTile(
                  leading: const Icon(Icons.table_chart_outlined),
                  title: const Text("Brick View"),
                  subtitle: const Text("View"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BrickView()),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Account", style: headingStyle),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone Number"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.mail),
                title: Text("Email"),
              ),
              const Divider(),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Login"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Security", style: headingStyle),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.lock),
                title: Text("Change Password"),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Sign Out"),
                onTap: () => _logout(),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.save),
                title: Text("Save Settings"),
              ),
=======
              _generalSettingsColumn(context),
              if (FirebaseAuth.instance.currentUser != null)
                _accountSettingsColumn()
              else
                const SizedBox(height: 0),
              if (FirebaseAuth.instance.currentUser != null)
                _securitySettingsColumn(context, this)
              else
                _securitySettingsColumnLoggedOut(context),
              _developmentSettingsColumn(context)
>>>>>>> 828b9eb12b76c93b34acc302d7d8ae0b20eab4e6
            ],
          ),
        ),
      ),
    );
  }
}

Widget _generalSettingsColumn(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "General",
            style: headingStyle,
          ),
        ],
      ),
      const ListTile(
        leading: Icon(Icons.cloud),
        title: Text("History"),
        subtitle: Text("Settings"),
      ),
      const Divider(),
      ListTile(
          leading: const Icon(Icons.table_chart_outlined),
          title: const Text("Brick View"),
          subtitle: const Text("View"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BrickView()),
            );
          }),
      const Divider(),
      const ThemeSwitcher(),
      const Divider(),
    ],
  );
}

Widget _accountSettingsColumn() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Account", style: headingStyle),
        ],
      ),
      const ListTile(
        leading: Icon(Icons.phone),
        title: Text("Phone Number"),
      ),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.mail),
        title: Text("Email"),
      ),
      const Divider(),
    ],
  );
}

Widget _securitySettingsColumn(BuildContext context, _SettingsPageState state) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Security", style: headingStyle),
        ],
      ),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.lock),
        title: Text("Change Password"),
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text("Sign Out"),
        onTap: () => state._logout(context),
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text('Save Settings'),
        onTap: () {
          context.read<SettingsModel>().saveSettings();
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text('Save to cloud'),
        onTap: () {
          context.read<SettingsModel>().saveToCloud();
        },
      ),
    ],
  );
}

Widget _securitySettingsColumnLoggedOut(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Security", style: headingStyle),
        ],
      ),
      ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Login"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          }),
      const Divider(),
    ],
  );
}

Widget _developmentSettingsColumn(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Development", style: headingStyle),
        ],
      ),
      ListTile(
        leading: const Icon(Icons.dangerous),
        title: const Text("Devevelopment Page"),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DevPage(title: 'Dev Page')),
        ),
      ),
      const Divider(),
    ],
  );
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the settings model
    final settings = context.watch<SettingsModel>();

    return SwitchListTile(
      title: const Text('Dark mode'),
      secondary: const Icon(Icons.brightness_medium),
      value: settings.darkMode,
      onChanged: (bool value) {
        // Update the dark mode value in the settings model
        context.read<SettingsModel>().updateDarkMode(value);
      },
    );
  }
}
