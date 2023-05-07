import 'package:flutter/material.dart';
import 'package:monie_point_test/helpers/const.dart';
import '../../helpers/assets.dart';
import '../../helpers/badge.dart';
import '../widgets/home_widgets.dart';
import '../widgets/home_carousel.dart';
import '../../helpers/silver_appbar_delegete.dart';
import '../../helpers/text_field.dart';
import '../../helpers/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 3,
          expandedHeight: 280,
          toolbarHeight: kToolbarHeight + 32,
          elevation: 0,
          pinned: true,
          forceElevated: innerBoxIsScrolled,
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Expanded(
                  child: InputField(
                    hint: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: LIGHTGREY,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Row(
                  children: [
                    buildBadge(AppIcons.bag, '5'),
                    const SizedBox(width: 15),
                    buildBadge(AppIcons.message, '9+'),

                  ],
                ),
              ],
            ),
          ),
          flexibleSpace: const FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: DashboardCarousel(),
          ),
        ),
        SliverPersistentHeader(
          delegate: SliverAppBarDelegate(PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryButton(AppIcons.category, 'Category'),
                      categoryButton(AppIcons.airplane, 'Flight'),
                      categoryButton(AppIcons.notes, 'Bill'),
                      categoryButton(AppIcons.world, 'Data Plan'),
                      categoryButton(AppIcons.dollar, 'Top Up'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    indicator(width: 12, opacity: 1.0),
                    indicator(width: 3, opacity: 0.2),
                    indicator(width: 3, opacity: 0.2),
                  ],
                ),
              ],
            ),
          )),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 50,
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Best Sale Product',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: DARK, fontSize: 18),
              ),
              Text(
                'See more',
                style: TextStyle(
                    color: PRIMARYCOLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
      // The content of the scroll view
      body: ListView(
        padding: const EdgeInsets.fromLTRB(BODYPADDING, 10, BODYPADDING, BODYPADDING),
        children: [
          Row(
            children: [
              productCard(image: 'prew'),
              const SizedBox(width: 20),
              productCard(image: 'shirt3', isFav: true),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              productCard(image: 'shirt2'),
              const SizedBox(width: 20),
              productCard(image: 'shirt'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              productCard(image: 'shirt'),
              const SizedBox(width: 20),
              productCard(image: 'shirt3'),
            ],
          ),
        ],
      ),
    );
  }


}


