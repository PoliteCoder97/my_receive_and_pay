import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../model/bank.dart';
import '../provider/bank_provider.dart';
import '../view/res/values/dimens.dart';
import '../view/widgets/neu_widgets.dart';
import 'package:provider/provider.dart';

class AddBankScreen extends StatefulWidget {
  static final String routeName = 'AddBankScreen';

  @override
  _AddBankScreenState createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  var _cardAmountController = TextEditingController();
  var _cardDateController = TextEditingController();
  Bank _bank;

  var _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
//      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
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
                    width: MDimens.viewS,
                  ),
                  Expanded(
                      child: Text(
                    'Add new bank',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: MDimens.viewM,
            ),
            NeuWidgets.card(
              context,
              _bank == null ? Theme.of(context).primaryColor : _bank.color,
              Container(
                decoration: BoxDecoration(
                  color: _bank == null
                      ? Theme.of(context).primaryColor
                      : _bank.color,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<Bank>(
                      isExpanded: false,
//                      isDense: true,
                      value: _bank,
                      onChanged: (Bank bank) {
                        print('selected bank name is ${bank.name}');

                        setState(() {
                          _bank = bank;
                          print('current bank is ${_bank}');
                        });
                        
                      },
                      hint:Expanded(
                        child: Text(
                          '${Bank.banks[0]}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                            color: Colors.grey[400],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      items: Bank.banks.map<DropdownMenuItem<Bank>>(
                        (Bank bank) {
                          return DropdownMenuItem<Bank>(
                            value: bank,
                            child: Center(
                              child: Text(
                                '${bank.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
//                                color: Colors.white,
                                        ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(
                      height: MDimens.viewS,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MDimens.viewM,
                        ),
                        Expanded(
                          child: Text(
                            'card number',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MDimens.viewM,
                                vertical: MDimens.viewS),
                            child: TextField(
                              controller: _cardNumberController,
                              decoration: InputDecoration(
                                hintText: '0000 0000 0000 0000',
//                          border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MDimens.viewS,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MDimens.viewM,
                        ),
                        Expanded(
                          child: Text(
                            'card date',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MDimens.viewM, vertical: MDimens.viewS),
                      child: TextField(
                        controller: _cardDateController,
                        decoration: InputDecoration(
                          hintText: 'Card Date',
//                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: MDimens.viewM,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MDimens.viewXXL,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MDimens.viewM,
                ),
                Expanded(
                  child: Text(
                    'Amount of your card',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MDimens.viewS,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MDimens.viewM, vertical: MDimens.viewS),
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: NeuWidgets.textField(
                context,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MDimens.viewM, vertical: MDimens.viewS),
                  child: TextField(
                    controller: _cardAmountController,
                    decoration: InputDecoration(
                      hintText: '300,000',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MDimens.viewXXL,
            ),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: MDimens.viewM),
              child: NeuWidgets.button(
                  context,
                  Text(
                    'Add card',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ), () {
                String amount = _cardAmountController.text.trim();
                if (amount == null || amount == '') {
                  print('enter card amount');
                  return;
                }
                _bank.amount = int.parse(amount);
                String cardNumber = _cardNumberController.text.trim();
                if (cardNumber == null || cardNumber == '') {
                  print('enter number date');
                  return;
                }
                _bank.cardNumber = cardNumber;

                String date = _cardDateController.text.trim();
                if (date == null || date == '') {
                  print('enter card date');
                  return;
                }
                _bank.cardDate = date;

                Provider.of<BankProvider>(context, listen: false).addBank(
                  this._bank,
                );

                Navigator.of(context).pop();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
