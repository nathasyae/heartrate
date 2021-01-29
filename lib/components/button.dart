// import 'file:///D:/kampus/heartrate/lib/models/style.dart';
// import 'package:flutter/material.dart';
//
// class Button extends StatelessWidget {
//   final String title;
//   final VoidCallback onPressed;
//   final bool isPrimary;
//   final double width;
//
//   const Button(
//       {Key key, this.title, this.onPressed, this.isPrimary, this.width = 300})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return isPrimary ? primaryButton(context) : secondaryButton(context);
//   }
//
//   Widget primaryButton(context) {
//     return FlatButton(
//       key: Key(title),
//       color: primaryRed,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       padding: const EdgeInsets.symmetric(horizontal: 50),
//       child: Container(
//           width: context.widget.width,
//           height: 48,
//           child: Center(
//             child: Text(title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .button
//                     .copyWith(color: primaryWhite),
//                 textAlign: TextAlign.center,
//                 maxLines: 1,),
//           )),
//       onPressed: onPressed,
//     );
//   }
//
//   Widget secondaryButton(context) {
//     return OutlineButton(
//       // padding: const EdgeInsetsDirectional.only(),
//       // borderSide: const BorderSide(style: BorderStyle.solid),
//       color: primaryGray,
//       highlightedBorderColor: primaryBlack,
//       child: Container(
//         width: context.widget.width,
//         height: 48,
//         child: Center(
//             child: Text(title,
//                 style: Theme.of(context)
//                     .textTheme
//                     .button
//                     .copyWith(color: primaryBlack),
//                 textAlign: TextAlign.center,
//                 maxLines: 1,
//             )
//         ),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }
