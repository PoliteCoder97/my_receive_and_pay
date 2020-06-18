import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../view/widgets/items/bank_item.dart';
import '../view/widgets/neu_widgets.dart';
import 'package:provider/provider.dart';

import './widgets/items/transaction_list_item.dart';

import '../provider/bank_provider.dart';
import '../provider/transaction_provider.dart';
import './widgets/items/add_pay_and_reeive.dart';
import '../model/bank.dart';
import './res/values/dimens.dart';

class TransactionScreen extends StatefulWidget {
  static final String routeName = 'AccountsScreen';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Bank bank = Provider.of<BankProvider>(context, listen: true)
        .findById(routeArgs['bankId']);
    var transactionList =
        Provider.of<TransActionProvider>(context, listen: true)
            .accounts(bank.id);
    return Scaffold(
//      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MDimens.viewM,
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    padding: EdgeInsets.all(MDimens.viewS),
                    child: NeuWidgets.button(
                        context,
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ), () {
                      Navigator.of(context).pop();
                    }),
                  ),
                  SizedBox(
                    width: MDimens.viewM,
                  ),
                  Expanded(
                    child: Text(
                      ' Bank ${bank.name}',
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
                      ),
                      () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              // return AddPayAndReceive();
                              return AddPayAndReceive(bank.id);
                            });
                      },
                      backColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      BankItem(bank,null),
                      Expanded(
                        flex: 2,
                        child: Stack(
                          children: <Widget>[
                            if (transactionList.length == 0)
                              Container(
                                child: Center(
                                  child: Text(
                                    'There is no pay/receive here!',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              )
                            else
                              ListView.builder(
                                itemCount: transactionList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Slidable(
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    child: TransactionListItem(
                                        transactionList[index]),
                                    secondaryActions: <Widget>[
//                                      Container(
//                                        margin: EdgeInsets.symmetric(
//                                            vertical: MDimens.viewM,
//                                            horizontal: MDimens.viewS),
//                                        decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.all(
//                                            Radius.circular(MDimens.viewM),
//                                          ),
//                                          color: Colors.blue,
//                                        ),
//                                        child: IconSlideAction(
//                                          caption: 'Edit',
//                                          icon: Icons.edit,
//                                          color: Colors.transparent,
//                                          onTap: () {
//                                            //edit this transaction
//                                          },
//                                        ),
//                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MDimens.viewS,
                                            horizontal: MDimens.viewS),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MDimens.viewM),
                                          ),
                                          color: Colors.red,
                                        ),
                                        child: IconSlideAction(
                                          caption: 'Delete',
                                          icon: Icons.delete,
                                          color: Colors.transparent,
                                          onTap: () {
                                            Provider.of<TransActionProvider>(
                                                    context,
                                                    listen: false)
                                                .deleteTransaction(
                                                    transactionList[index].id);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
