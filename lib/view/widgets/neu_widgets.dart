import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../view/res/values/dimens.dart';

class NeuWidgets {
  static Widget button(
      BuildContext context, Widget child, VoidCallback onButtonClicked,
      {Color backColor = Colors.blue}) {
    return GestureDetector(
      onTap: onButtonClicked,
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(MDimens.viewM),
          ),
          depth: 8,
          lightSource: LightSource.topLeft,
          color: backColor,
        ),
//            color: Theme.of(context).primaryColor),
        child: Center(child: child),
      ),
    );
  }

  static Widget textField(BuildContext context, Widget child) {
    return Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(MDimens.viewM))),
            depth: -8,
            lightSource: LightSource.topLeft,
            color: Colors.grey[200]),
        child: child);
  }

  static Widget card(BuildContext context, Color backColor, Widget child,
      {key}) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MDimens.viewM, vertical: MDimens.viewS),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(MDimens.viewM),
          ),
          depth: 8,
          lightSource: LightSource.topLeft,
          color: backColor,
        ),
        child: child,
      ),
    );
  }
}
