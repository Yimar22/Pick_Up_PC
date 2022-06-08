import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pickup_pc/src/pages/students/orders/orders_create_page_controller.dart';
import 'package:pickup_pc/src/model/apps.dart';

import '../../../utils/my_colors.dart';
import '../../../widgets/no_data_widget.dart';

class OrdersCreatePage extends StatefulWidget {
  const OrdersCreatePage({Key key}) : super(key: key);

  @override
  _ClientOrdersCreatePageState createState() => _ClientOrdersCreatePageState();
}

class _ClientOrdersCreatePageState extends State<OrdersCreatePage> {

  OrdersCreatePageController _con = new OrdersCreatePageController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi orden'),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.235,
        child: Column(
          children: [
            Divider(
              color: Colors.grey[400],
              endIndent: 30, // DERECHA
              indent: 30, //IZQUIERDA
            ),
            _buttonNext()
          ],
        ),
      ),
      body: _con.selectedApps.length > 0
      ? ListView(
        children: _con.selectedApps.map((Apps app) {
          return _cardProduct(app);
        }).toList(),
      )
      : NoDataWidget(text: 'Ningun producto agregado',),
    );
  }

  Widget _buttonNext() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
      child: ElevatedButton(
        onPressed: _con.goToChatPage,
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'CONTINUAR',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 80, top: 9),
                height: 30,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _cardProduct(Apps app) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _imageProduct(app),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app?.name ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            Spacer(),
            Column(
              children: [
                _iconDelete(app)
              ],
            )
          ],
        ),
    );
  }
  
  Widget _iconDelete(Apps app) {
    refresh();
    return IconButton(
        onPressed: () {
          _con.deleteItem(app);
        },
        icon: Icon(Icons.delete, color: MyColors.primaryColor,)
        
    );
    
  }


  Widget _imageProduct(Apps app) {
    return Container(
      width: 90,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey[200]
      ),
      child: FadeInImage(
        image: app.image1 != null
            ? NetworkImage(app.image1)
            : AssetImage('assets/img/no_image.png'),
        fit: BoxFit.contain,
        fadeInDuration: Duration(milliseconds: 50),
        placeholder: AssetImage('assets/img/no_image.png'),
      ),
    );
  }

  
  
  void refresh() {
    setState(() {});
  }
}
