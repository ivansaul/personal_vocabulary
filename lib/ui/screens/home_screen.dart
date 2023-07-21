import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/ui/delegates/search_word_delegate.dart';
import 'package:flutter_template/ui/providers/localdb_provider.dart';
import 'package:flutter_template/ui/providers/localdb_repository_provider.dart';
import 'package:flutter_template/ui/providers/preferences/preferences_provider.dart';
import 'package:flutter_template/ui/screens/categories_screen.dart';
import 'package:flutter_template/ui/screens/learn_screen.dart';
import 'package:flutter_template/ui/screens/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // ref.read(loadDataProvider.notifier).loadData(name: 'words_sample');
    ref.read(randomWordsProvider.notifier).getRandomWords(count: 1);
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final words = ref.watch(randomWordsProvider);
    final userAsync = ref.watch(userGetProvider('user'));
    if (words.isEmpty || !userAsync.hasValue) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.primaryColorLightGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              _AppbarView(scaffoldKey: scaffoldKey),
              const SizedBox(height: 40),
              Text(
                "Good evening, ${userAsync.value?.username ?? ''}",
                style: AppTheme.titleExtaLargeTextStyle,
              ),
              const SizedBox(height: 10),
              const ProgressWidget(progress: 0.25),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Practice English',
                      style: AppTheme.titleExtaLargeTextStyle,
                    ),
                    Text(
                      'You have new word!',
                      style: AppTheme.subTitleLargeTextStyle,
                    ),
                    const SizedBox(height: 10),

                    // Word Card
                    WordCardWidget(word: words.first),
                    const SizedBox(height: 30),

                    // Review Cards
                    CustomListTile(
                      iconColor: Colors.orange,
                      leading: Icons.edit_outlined,
                      trailing: Icons.keyboard_arrow_right_rounded,
                      title: '2 Selected categories',
                      subtitle: 'A1, C2',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoriesScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomListTile(
                      iconColor: Colors.pinkAccent,
                      leading: Icons.add_circle_outline_rounded,
                      trailing: Icons.keyboard_arrow_right_rounded,
                      title: 'Learn new words',
                      subtitle: 'Memorized today: 0 out of 10',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LearnScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomListTile(
                      iconColor: Colors.green,
                      leading: Icons.history_rounded,
                      trailing: Icons.keyboard_arrow_right_rounded,
                      title: 'Review words',
                      subtitle: 'Words to review: 2',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingupScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const CustomListTile(
                      iconColor: Colors.blue,
                      leading: Icons.lightbulb_outline_rounded,
                      trailing: Icons.keyboard_arrow_right_rounded,
                      title: 'Mixed mode',
                      subtitle: 'Both new words and words to review will appear.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}

class _AppbarView extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const _AppbarView({
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        CustomIconButton(
          icon: const FaIcon(
            FontAwesomeIcons.barsProgress,
            size: 18,
          ),
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        const Spacer(),
        CustomIconButton(
          icon: const Icon(CupertinoIcons.search),
          onTap: () {
            final localdbRepository = ref.read(localdbRepositoryProvider);
            showSearch(
              context: context,
              delegate: SearchWordDelegate(searchWordCallback: localdbRepository.searchWord),
            );
          },
        ),
      ],
    );
  }
}
