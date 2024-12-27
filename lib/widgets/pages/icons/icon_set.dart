import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:otp_app/widgets/pages/icons/icons.dart';

const bgBrightnessValue = 0.3;
const iconBrightnessValue = 0.05;
const iconBrightnessValueLight = 0.8;

final iconSet = SimpleIcons.values.entries.map((e) => Container(child: filterIcons(e.key, e.value))).toList();

Icon filterIcons(String key, IconData value) {
  BuildContext? isContext = icons.iconsKey.currentContext;
  BuildContext context;
  Color? iconColor = SimpleIconColors.values[key];

  if(isContext != null) {
    context = isContext;
    bool isLightBg = Theme.of(context).scaffoldBackgroundColor.computeLuminance() > bgBrightnessValue;
    print(Theme.of(context).scaffoldBackgroundColor);
    if(!isLightBg && iconColor != null) {
      Color iconColorNotNull = iconColor;
      iconColor = iconColorNotNull.computeLuminance() > iconBrightnessValue ? iconColor : Colors.white; 
    } else if(isLightBg && iconColor != null) {
      Color iconColorNotNull = iconColor;
      iconColor = iconColorNotNull.computeLuminance() >= iconBrightnessValueLight ? Colors.black : iconColor; 
    }
  }
   
  return Icon(
    value, 
    color: iconColor, 
    size: 40
  );
}