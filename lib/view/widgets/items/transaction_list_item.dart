import 'package:flutter/material.dart';

import '../../../model/transaction.dart';

import '../../res/values/dimens.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionListItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(AccountsScreen.routeName, arguments: {
        //   'bankId': accountList[index].id,
        // });
      },
      child: Container(
        height: 80,
                margin: EdgeInsets.symmetric(
          horizontal: MDimens.viewM,
          vertical: MDimens.viewS,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MDimens.viewM,
          vertical: MDimens.viewS,
        ),
        decoration: BoxDecoration(
            color: _transaction.isPay ? Colors.red[500] : Colors.green[500],
//            color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(
                MDimens.viewM,
              ),
            )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MDimens.viewM,
            ),
            Expanded(
              child: Text(
                'For ${_transaction.forWhat}',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: MDimens.textL,
                      color: Colors.white,
                    ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Value: ${_transaction.count}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                if (_transaction.isPay)
                  Text(
                    'payed',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  )
                else
                  Text(
                    'received',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
              ],
            ),
            SizedBox(
              height: MDimens.viewM,
            ),
          ],
        ),
      ),
    );
  }
}
