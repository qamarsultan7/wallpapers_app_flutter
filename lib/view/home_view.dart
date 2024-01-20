import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Providers/home_provider.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/app_bar.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/category_list.dart';
import 'package:wallpapers_app_flutter/Resources/components/grid_view.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/search_bar.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/View%20Model/home_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<HomeViewModel>(context, listen: false).fetchImagesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        backgroundColor: const Color.fromARGB(255, 3, 177, 108),
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            Provider.of<HomeViewModel>(context, listen: false)
                .fetchImagesList();
          });
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<HomeProvider>(
              builder: (_, value, __) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),

                    //Custom App bar
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: value.isVisible ? 1 : 0,
                      child: customAppbar(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //Search Bar
                    Hero(
                      tag: '',
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: value.isVisible ? 1 : 0,
                        child:
                            searchBar(false, context),
                      ),
                    ),

                    // Categories List
                    AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 200),
                      height: value.height.toDouble(),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(5, (index) {
                          return CategoryList(
                            imgUrl: categoriesList[index].image,
                            title: categoriesList[index].name,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Random Images Grid
                    const HomeGrid()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
