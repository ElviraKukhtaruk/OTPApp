import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otp_app/widgets/sections/appbar.dart';
import 'package:otp_app/widgets/pages/icons/icon_set.dart';

class icons extends StatefulWidget {
  const icons({super.key});
  
  static GlobalKey<NavigatorState> iconsKey = GlobalKey<NavigatorState>();

  @override
  _iconsState createState() => _iconsState();
}

class _iconsState extends State<icons> {
  ScrollController _scrollController = ScrollController();
  double scrollOffset = 0.0;
  int currentIndex = 0;
  final List<Container> _data = [];
  int iconsLength = iconSet.length;
  
  void generateIcons(int count) {
    int currentCount = 0;
    for (var i = currentIndex; i < iconsLength; i++) {
      if(i > 0) currentIndex = i;
      if(currentCount > count) break;
      currentCount++;
      _data.add(iconSet[i]);
    }
  }
  
  @override
  void initState() {
    super.initState();
    generateIcons(500);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(_loadMoreData);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if((_scrollController.position.userScrollDirection == ScrollDirection.reverse
          || _scrollController.position.userScrollDirection == ScrollDirection.idle)
          && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          scrollOffset = _scrollController.offset;
          setState(() {
            generateIcons(30);
          });
        }
      });
    //});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50, mainAxisExtent: 70, crossAxisSpacing: 40),
        controller: _scrollController,
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return _data[index];
        },
      ),
    );
  }
}
