import 'package:flutter/material.dart';
import '../provider/bank_provider.dart';
import '../view/add_bank_screen.dart';
import '../view/res/values/dimens.dart';
import '../view/transaction_screen.dart';

import '../view/widgets/items/bank_item.dart';
import '../view/widgets/neu_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var bankList = Provider.of<BankProvider>(context, listen: true).banks;

    return Scaffold(
//      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MDimens.viewL,
                  ),
                  Expanded(
                    child: Text(
                      'Banks',
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Text(
                    'Add new',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Container(
                    height: 44,
                    width: 70,
                    padding: EdgeInsets.all(MDimens.viewS),
                    child: NeuWidgets.button(
                        context,
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ), () {
                      print('add new bank');
                      Navigator.of(context).pushNamed(AddBankScreen.routeName);
                    }, backColor: Colors.green),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  if (bankList.length == 0)
                    Container(
                      child: Center(
                        child: Text(
                          'There is no Bank here!',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: bankList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BankItem(
                          bankList[index],
                          () {
                            Navigator.of(context).pushNamed(
                                TransactionScreen.routeName,
                                arguments: {
                                  'bankId': bankList[index].id,
                                });
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNewBank(BuildContext context) {}
}
