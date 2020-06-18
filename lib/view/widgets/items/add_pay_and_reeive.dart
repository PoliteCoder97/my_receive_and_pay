import 'package:flutter/material.dart';
import '../../../model/transaction.dart';
import '../../../provider/transaction_provider.dart';
import '../../../view/widgets/neu_widgets.dart';
import 'package:provider/provider.dart';

import '../../res/values/dimens.dart';

class AddPayAndReceive extends StatefulWidget {
  final _bankId;

  AddPayAndReceive(this._bankId);

  @override
  _AddPayAndReceiveState createState() => _AddPayAndReceiveState();
}

class _AddPayAndReceiveState extends State<AddPayAndReceive> {
  bool _isPay = false;

  var _accountValueController = TextEditingController();
  var _forWhatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: MDimens.viewL, vertical: MDimens.viewS),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MDimens.viewL,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: MDimens.viewM,
              ),
              Expanded(
                  child: Text(
                'For what do pay or Receive? ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: MDimens.textL,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
              )),
            ],
          ),
          SizedBox(
            height: MDimens.viewXXL,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(
              child: NeuWidgets.textField(
                context,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MDimens.viewM),
                  child: TextField(
                    controller: _forWhatController,
                    decoration: InputDecoration(
                      hintText: 'Explain ...',
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ]),
          // DropdownButton<Bank>(
          //   isExpanded: true,
          //   value: _bank,
          //   onChanged: (Bank bank) {
          //     setState(() {
          //       this._bank = bank;
          //     });
          //   },
          //   hint: Text(
          //     '${Bank.banks[0]}',
          //     style: Theme.of(context).textTheme.bodyText1,
          //   ),
          //   items: Bank.banks.map<DropdownMenuItem<Bank>>(
          //     (Bank bank) {
          //       return DropdownMenuItem<Bank>(
          //         value: bank,
          //         child: Center(
          //           child: Text(
          //             '${bank.name}',
          //             style: Theme.of(context).textTheme.bodyText1,
          //           ),
          //         ),
          //       );
          //     },
          //   ).toList(),
          // ),
          SizedBox(
            height: MDimens.viewM,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: NeuWidgets.textField(
                  context,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MDimens.viewM),
                    child: TextField(
                      controller: _accountValueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'How much?',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MDimens.viewM,
          ),
          Row(
            children: <Widget>[
//              Expanded(
//                child: Text(
//                  'Are you pay for somthing? ',
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              Checkbox(
//                onChanged: (value) {
//                  setState(() {
//                    _isPay = value;
//                  });
//                },
//                value: _isPay,
//              ),
              Expanded(
                child: SizedBox(),
              ),
              Text('Receive  '),
              NeuWidgets.button(
                  context,
                  Container(
                    height: 52,
                    width: 52,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ), () {
                _isPay = false;
              }, backColor: Colors.green[500]),
              Expanded(
                child: SizedBox(),
              ),
              Text('Pay  '),
              NeuWidgets.button(
                  context,
                  Container(
                    height: 52,
                    width: 52,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ), () {
                _isPay = true;
              }, backColor: Colors.red[500]),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
          SizedBox(
            height: MDimens.viewL,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: NeuWidgets.button(
                      context,
                      Container(
                        height: 48,
                        child: Center(
                          child: Text(
                            'Save',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ), () {
                print('bank id : ${widget._bankId}');
                print('count value : ${_accountValueController.text}');
                if (_isPay)
                  Provider.of<TransActionProvider>(context, listen: false).pay(
                    context,
                    Transaction(widget._bankId, _forWhatController.text,
                        int.parse(_accountValueController.text), _isPay),
                  );
                else
                  Provider.of<TransActionProvider>(context, listen: false)
                      .receive(
                    context,
                    Transaction(widget._bankId, _forWhatController.text,
                        int.parse(_accountValueController.text), _isPay),
                  );
                Navigator.of(context).pop();
              })),
            ],
          ),
        ],
      ),
    );
  }
}
