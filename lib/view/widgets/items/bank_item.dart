import 'package:flutter/material.dart';
import '../../../model/bank.dart';
import '../../../view/res/values/dimens.dart';
import '../../../view/widgets/neu_widgets.dart';

import '../../transaction_screen.dart';

class BankItem extends StatelessWidget {
  final Bank _bank;
  final VoidCallback onItemClickd;

  BankItem(this._bank , this.onItemClickd);

  @override
  Widget build(BuildContext context) {
    return NeuWidgets.card(
      context,
      _bank == null ? Theme.of(context).primaryColor : _bank.color,
      GestureDetector(
        onTap: onItemClickd,
        child: Container(
          padding: EdgeInsets.all(MDimens.viewM),
          height: 200,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MDimens.viewL,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '$_bank',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            fontSize: MDimens.textL,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MDimens.viewS,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_bank.cardNumber}',
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: MDimens.viewS,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MDimens.viewS,
                  ),
                  Text(
                    'Card date: ',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      '${_bank.cardDate}',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    'Balance: ',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      '${_bank.amount}',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                          ),
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
      ),
    );
  }
}
