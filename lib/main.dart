import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
// Pages
import 'pages/customer.dart';
// Stores
import 'stores/root.dart';
import 'stores/customer/customer.dart';
import 'stores/prizes/prizes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: TabNavigatorWidget()
    );
  }
}

class TabRoute {
  Widget body;
  BottomNavigationBarItem tabItem;

  TabRoute({ this.body, this.tabItem });
}

class TabNavigatorWidget extends StatefulWidget {
  TabNavigatorWidget({ Key key }) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

final rootStore = RootStore();
final customerStore = rootStore.customerStore;
final prizesStore = rootStore.prizesStore;

class _TabNavigatorState extends State<TabNavigatorWidget> {
  
  final List<TabRoute> _routes = [
    TabRoute(
      body: CustomerPageWidget(),
      tabItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      )
    ),
    TabRoute(
      body: CustomerPageWidget(),
      tabItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      )
    ),
    TabRoute(
      body: CustomerPageWidget(),
      tabItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      )
    ),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed(ActionsMode mode) {
    switch(mode) {
      case ActionsMode.addPoints:
        customerStore.dismissCustomer();
        break;
      case ActionsMode.redeemPrizes:
        prizesStore.redeemPrizes();
        break;
      default:
    }
  }

  Widget _buildBody() {
    return _routes[_selectedIndex].body;
  }

  List<BottomNavigationBarItem> _buildTabItems() {
    return _routes.map((TabRoute route) => route.tabItem).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: MultiProvider(
        providers: [
          Provider<CustomerStore>.value(value: customerStore),
          Provider<PrizesStore>.value(value: prizesStore)
        ],
        child: _buildBody()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildTabItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabPressed(customerStore.mode),
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}