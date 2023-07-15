import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({super.key});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        const SizedBox(height: 20),
        const NavigationDrawerDestination(
          selectedIcon: Icon(Icons.favorite),
          icon: Icon(Icons.favorite_border),
          label: Text('Hello World!'),
        ),
        const NavigationDrawerDestination(
          selectedIcon: Icon(Icons.download_rounded),
          icon: Icon(Icons.download_outlined),
          label: Text('LoadData'),
        ),
        ListTile(
          leading: const Icon(Icons.upload),
          title: const Text('Upload data'),
          onTap: () {
            // ref.read(loadDataProvider.notifier).loadData(name: 'words');
          },
        ),
      ],
    );
  }
}
