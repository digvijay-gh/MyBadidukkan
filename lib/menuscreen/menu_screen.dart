import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybadidukkan/constants.dart';
import 'package:mybadidukkan/menuscreen/item_info_popup.dart';

import 'package:mybadidukkan/menuscreen/menu_delegate.dart';
import 'package:mybadidukkan/menuscreen/options_popup.dart';

const List categoryMenus = [
  "Burger",
  "Pizza",
  "Momos",
  "Desert",
  "Beverage",
  "Water"
];
const List colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.grey,
];

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _HomepageState();
}

class _HomepageState extends State<MenuScreen> {
  final ScrollController scrollController = ScrollController();
  double restaurantInfoHeight = 200 - kToolbarHeight;
  int selectedCategoryIndex = 0;

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += 1;
      }
      scrollController.animateTo(
        restaurantInfoHeight + (totalItems * 576),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  List<double> breakPoints = [];
  void createBreakPoints() {
    double firstBreakPoint = restaurantInfoHeight + (576);
    print(firstBreakPoint);
    breakPoints.add(firstBreakPoint);
    for (var i = 1; i < categoryMenus.length; i++) {
      double breakPoint = breakPoints.last + (576);
      print(breakPoint);
      breakPoints.add(breakPoint);
    }
  }

  @override
  void initState() {
    createBreakPoints();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < categoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breakPoints[i - 1] <= offset) & (offset < breakPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  // alignment: Alignment.centerLeft,
                  content: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                            colorList.length,
                            (index) => TextButton(
                                onPressed: () {
                                  scrollToCategory(index);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  categoryMenus[index],
                                  style: selectedCategoryIndex == index
                                      ? const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)
                                      : const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                )))
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () => Navigator.pop(context)),
                    IconButton(
                        icon: const Icon(
                          Icons.search,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            // SliverPersistentHeader(
            //   delegate: TopHeader(),
            //   pinned: true,
            // ),
            const RestaurantInfoCard(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            )
            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.white,
            //     margin: EdgeInsets.symmetric(vertical: 12),
            //     padding: EdgeInsets.symmetric(vertical: 16),
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Center(
            //               child: Padding(
            //                 padding: EdgeInsets.only(left: 8.0),
            //                 child: SizedBox(
            //                   height: 32,
            //                   // child: Image.asset('images/menu.png'),
            //                 ),
            //               ),
            //             ),
            //             SizedBox(width: 16),
            //             Text(
            //               'Menu',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, fontSize: 16),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 4),
            //         SizedBox(
            //           height: 78,
            //           child: ListView.builder(
            //             itemCount: categoryMenus.length,
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (BuildContext context, int index) {
            //               return Padding(
            //                 padding: const EdgeInsets.only(left: 8, right: 8),
            //                 child: InkWell(
            //                   onTap: () => scrollToCategory(index),
            //                   child: Column(
            //                     children: [
            //                       CircleAvatar(
            //                         radius: 28,
            //                         backgroundColor: colorList[index],
            //                       ),
            //                       SizedBox(
            //                         height: 4,
            //                       ),
            //                       Text(
            //                         categoryMenus[index],
            //                         // "Rasmalai",
            //                         style: TextStyle(fontSize: 12),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            ,
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 32,
                      // child: Image.asset('images/menu.png'),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CategoriesBar(
                onChanged: scrollToCategory,
                selectedIndex: selectedCategoryIndex,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 20,
                    (context, categoryIndex) {
              return const MenuItemWidget();
            }))
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     childCount: categoryMenus.length,
            //     (context, categoryIndex) {
            //       return Column(
            //         children: [
            //           ...List.generate(
            //             9,
            //             (index) {
            //               return InkWell(
            //                 onTap: () {
            //                   showModalBottomSheet(
            //                       context: context,
            //                       builder: (context) {
            //                         return Wrap(
            //                           children: [
            //                             Column(
            //                               children: [
            //                                 ...List.generate(
            //                                     colorList.length,
            //                                     (index) => TextButton(
            //                                         onPressed: () =>
            //                                             scrollToCategory(index),
            //                                         child: Text(
            //                                             categoryMenus[index])))
            //                               ],
            //                             )
            //                           ],
            //                         );
            //                       });
            //                 },
            //                 child: Card(
            //                   child: ListTile(
            //                     tileColor: colorList[categoryIndex]
            //                         [(index + 1) * 100],
            //                     title: Text(
            //                       categoryMenus[categoryIndex],
            //                       style: TextStyle(
            //                         color: Colors.black.withOpacity(1),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            ,
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                builder: (BuildContext context) {
                  return const MySheet();
                });
          },
          child: Container(
            height: 199,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 20,
                      bottom: 20,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(CupertinoIcons.dot_square,
                            color: Colors.green),
                        const Text(
                          "Indi Tandoori Paneer Pizza",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(height: 4),
                        const Text("Category : Snacks"),
                        Text(
                          "₹269",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: const Text(
                            "33% OFF",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return OptionsSheet();
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(80, 32),
                        minimumSize: const Size(80, 32),
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const Text(
                        "ADD",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ]),
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}

class RestaurantInfoCard extends StatelessWidget {
  const RestaurantInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Baba Viswanath',
                maxLines: 2,
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(height: 2),
              const Text(
                "Sweets, Bakery, Indian",
                maxLines: 2,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: const Text(
                      "Jankipuram Extension, Lucknow",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black45, fontSize: 13),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(Icons.arrow_drop_down_sharp, color: Colors.red)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(CupertinoIcons.clock_fill, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "15 min",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 2,
                          height: 16,
                          color: Colors.grey),
                      Text(
                        '10 km away',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 28, width: 28, color: Colors.green),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 28, width: 28, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
