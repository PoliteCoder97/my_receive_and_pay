import 'package:flutter/material.dart';
import '../../../provider/bank_provider.dart';
import 'package:provider/provider.dart';

import '../../res/values/dimens.dart';
import '../../../model/bank.dart';

class AddBank extends StatefulWidget {
  @override
  _AddBankState createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  Bank _bank;

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
                'Your bank Name:',
                textAlign: TextAlign.left,
              )),
            ],
          ),
          DropdownButton<Bank>(
            isExpanded: true,
            value: _bank,
            onChanged: (Bank bank) {
              print('selected bank name is ${bank.name}');

              setState(() {
                _bank = bank;
                print('current bank is ${this._bank}');
              });

            },
            hint: Text(
              '${Bank.banks[0]}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.grey,
              ),
            ),
            items: Bank.banks.map<DropdownMenuItem<Bank>>(
              (Bank bank) {
                return DropdownMenuItem<Bank>(
                  value: bank,
                  child: Center(
                    child: Text(
                      '${bank.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          SizedBox(
            height: MDimens.viewM,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () async {

                    // if (_bank == null) {
                    //   print('select one bank!');
                    //   return;
                    // }

                    Provider.of<BankProvider>(context,listen: false).addBank(
                      this._bank,
                    );

                    Navigator.of(context).pop();
                  },
                  child: Text('Add Bank'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
