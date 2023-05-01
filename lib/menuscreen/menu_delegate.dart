// class TopHeader extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       height: 72,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back,
//                 ),
//                 onPressed: () => Navigator.pop(context)),
//             IconButton(
//                 icon: const Icon(
//                   Icons.search,
//                 ),
//                 onPressed: () {})
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 72;

//   @override
//   double get minExtent => 72;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }

import 'package:flutter/material.dart';

import 'menu_screen.dart';

class CategoriesBar extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  CategoriesBar({
    required this.onChanged,
    required this.selectedIndex,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: 102,
      padding: const EdgeInsets.symmetric(vertical: 12),
      // child: CategoriesItems(
      //   onChanged: onChanged,
      //   selectedIndex: selectedIndex,
      // ),
      child: Text(
        categoryMenus[selectedIndex],
        style: TextStyle(fontSize: 18),
      ),
    );
    // return Container(
    //   color: Colors.white,
    //   height: 52,
    //   child: Categories(
    //     onChanged: onChanged,
    //     selectedIndex: selectedIndex,
    //   ),
    // );
  }

  @override
  double get maxExtent => 102;

  @override
  double get minExtent => 102;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CategoriesItems extends StatefulWidget {
  const CategoriesItems({
    super.key,
    required this.onChanged,
    required this.selectedIndex,
  });

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<CategoriesItems> createState() => _CategoriesItemsState();
}

class _CategoriesItemsState extends State<CategoriesItems> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CategoriesItems oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: categoryMenus.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(categoryMenus[widget.selectedIndex]),
            // child: InkWell(
            //   onTap: () => widget.onChanged(index),
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 28,
            //         backgroundColor: colorList[index],
            //       ),
            //       const SizedBox(height: 4),
            //       Text(
            //         categoryMenus[index],
            //         // "Rasmalai",
            //         style: TextStyle(
            //           fontSize: 12,
            //           fontWeight: widget.selectedIndex == index
            //               ? FontWeight.bold
            //               : FontWeight.normal,
            //           color: widget.selectedIndex == index
            //               ? Colors.black
            //               : Colors.black45,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ),
        );
      },
    );
  }
}

// class Categories extends StatefulWidget {
//   const Categories({
//     Key? key,
//     required this.onChanged,
//     required this.selectedIndex,
//   }) : super(key: key);

//   final ValueChanged<int> onChanged;
//   final int selectedIndex;

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
  // late ScrollController _controller;
  // @override
  // void initState() {
  //   _controller = ScrollController();
  //   super.initState();
  // }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

  // @override
  // void didUpdateWidget(covariant Categories oldWidget) {
  //   _controller.animateTo(
  //     80.0 * widget.selectedIndex,
  //     curve: Curves.ease,
  //     duration: const Duration(milliseconds: 200),
  //   );
  //   super.didUpdateWidget(oldWidget);
  // }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       controller: _controller,
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           categoryMenus.length,
//           (index) => Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: TextButton(
//               onPressed: () {
//                 widget.onChanged(index);
//               },
//               style: TextButton.styleFrom(
//                 foregroundColor: widget.selectedIndex == index
//                     ? Colors.black
//                     : Colors.black45,
//               ),
//               child: Text(
//                 categoryMenus[index],
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
