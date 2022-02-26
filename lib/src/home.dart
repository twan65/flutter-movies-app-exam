import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exam/src/provider/bottom_navigation_provider.dart';
import 'package:provider_exam/src/provider/count_provider.dart';
import 'package:provider_exam/src/ui/count_home_widget.dart';
import 'package:provider_exam/src/ui/movie_list_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  BottomNavigationProvider? _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider!.currentIndex) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "movie")
      ],
      currentIndex: _bottomNavigationProvider!.currentIndex,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // provider navigation state
        _bottomNavigationProvider!.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
