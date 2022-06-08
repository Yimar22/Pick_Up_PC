import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pickup_pc/src/model/apps.dart';
import 'package:pickup_pc/src/pages/students/apps/apps_page_controller.dart';
import 'package:pickup_pc/src/utils/my_colors.dart';

import '../../../model/category.dart';
import '../../../utils/shared_pref.dart';
import '../../../widgets/no_data_widget.dart';

class AppsPage extends StatefulWidget {
  const AppsPage({Key key}) : super(key: key);

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  AppsPageController _con = new AppsPageController();
  SharedPref _sharedPref = new SharedPref();

 
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _con.categories?.length,
      child: Scaffold(
        key: _con.key,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(205),
          child: AppBar(
            // title: Text('TabBar'),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            actions: [_ordersBag()],
            flexibleSpace: Column(
              children: [
                SizedBox(height: 40),
                _menuDrawer(),
                SizedBox(height: 20),
                _textFieldSearch(),
              ],
            ),
            bottom: TabBar(
              indicatorColor: MyColors.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: List<Widget>.generate(_con.categories.length, (index) {
                return Tab(
                  child: Text(_con.categories[index].name ?? ''),
                );
              }),
            ),
          ),
        ),
        drawer: _drawer(),
        body: TabBarView(
          children: _con.categories.map((Category category) {
            return FutureBuilder(
                future: _con.getApps(category.id, _con.appName),
                builder: (context, AsyncSnapshot<List<Apps>> snapshot) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.9),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (_, index) {
                            return _cardApps(snapshot.data[index]);
                          });
                    } 
                );
          }).toList(),
        ),
      ),
    );
  }

Widget _cardApps(Apps app) {
    return InkWell(
      onTap: () { 
       _con.addToBag(app);
    },
      child: Container(
        height: 250,
        
        child: Card(
          
          color: Colors.white.withOpacity(0.9),
          elevation: 3.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                  top: -1.0,
                  right: -1.0,
                  
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(20),
                        )),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
              Column(
                children: [
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: EdgeInsets.all(20),
                    child: FadeInImage(
                      image: app.image1 != null
                          ? NetworkImage(app.image1)
                          : AssetImage('assets/img/corel.png'),
                      fit: BoxFit.contain,
                      fadeInDuration: Duration(milliseconds: 50),
                      placeholder: AssetImage('assets/img/no_image.png'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 33,
                      child: Text(
                        app.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, fontFamily: 'NimbusSans'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _ordersBag() {
    return GestureDetector(
      onTap: _con.goToOrders,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15, top: 22),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
          Positioned(
            right: 16,
            top: 24,
            child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          )
        ],
      ),
    );
  }

  Widget _textFieldSearch() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Buscar',
              suffixIcon: Icon(Icons.search, color: Colors.grey[400]),
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey[300])),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey[300])),
              contentPadding: EdgeInsets.all(15)),
        ));
  }

  

  Widget _cardAi() {
    return Container(
      height: 225,
      child: Card(
        color: Colors.white.withOpacity(0.9),
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Positioned(
                top: -1.0,
                right: -1.0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20),
                      )),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )),
            Column(
              children: [
                Container(
                  height: 170,
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(20),
                  child: FadeInImage(
                    image: AssetImage('assets/img/i7.jpg'),
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(milliseconds: 50),
                    placeholder: AssetImage('assets/img/no_image.png'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 30,
                    child: Text(
                      'Nombre',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, fontFamily: 'NimbusSans'),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuDrawer() {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 1),
      alignment: Alignment.centerLeft,
      child: IconButton(onPressed: _con.openDrawer, icon: Icon(Icons.menu)),
    );
  }

  Widget _drawer() {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
          decoration: BoxDecoration(color: MyColors.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yimar Tamayo',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(top: 10),
                child: FadeInImage(
                  image: AssetImage('assets/img/user_profile.png'),
                  fit: BoxFit.contain,
                  fadeInDuration: Duration(milliseconds: 50),
                  placeholder: AssetImage('assets/img/user_profile.png'),
                ),
              )
            ],
          )),
      ListTile(
        title: Text('Mis Pedidos'),
        trailing: Icon(Icons.shopping_cart_outlined),
      ),
      ListTile(
        onTap: _con.logout,
        title: Text('Cerrar sesion'),
        trailing: Icon(Icons.logout),
      )
    ]));
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }
}
