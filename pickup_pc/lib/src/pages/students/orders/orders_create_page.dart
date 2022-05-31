import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pickup_pc/src/pages/students/orders/orders_create_page_controller.dart';
import 'package:pickup_pc/src/model/apps.dart';

class OrdersCreatePage extends StatefulWidget {
  const OrdersCreatePage({Key key}) : super(key: key);

  @override
  _OrdersCreatePageState createState() => _OrdersCreatePageState();
}

class _OrdersCreatePageState extends State<OrdersCreatePage> {
  OrdersCreatePageController _con = new OrdersCreatePageController();

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi orden'),
      ),
      body: Center(
        child: Text('Order'),
      ),
    );
  }

  Widget _cardApps(Apps apps) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            child: FadeInImage(
              image: AssetImage('assets/img/corel.png'),
              fit: BoxFit.contain,
              fadeInDuration: Duration(milliseconds: 50),
              placeholder: AssetImage('assets/img/no_image.png'),
            ),
          )
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
