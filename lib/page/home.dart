import 'package:flutter/material.dart';
import 'package:foodapp/page/cart.dart';
import 'package:foodapp/page/directory.dart';
import 'package:foodapp/page/homelayout/searchappbar.dart';
import 'package:foodapp/page/notification.dart';
import 'package:foodapp/page/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectindex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeScreenBody(),
      DirecotoryScreen(),
      CartScreen(),
      NotificationScreen(),
      UserProfile()
    ];
  }

  void _onitemtap(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(),
      body:  _widgetOptions.elementAt(_selectindex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Người dùng',
          )
        ],
        currentIndex: _selectindex,
        onTap: _onitemtap,
        selectedItemColor: Colors.orange, 
        unselectedItemColor: Colors.black.withOpacity(0.6),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Nội dung trang chủ'),
      ),
    );
  }
}
