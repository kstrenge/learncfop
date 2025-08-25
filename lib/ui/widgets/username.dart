// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../data/username_provider.dart';

// class Username extends StatelessWidget {
//   const Username({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print("rebuild");
//     return Expanded(
//       child: TextFormField(
//         initialValue: context.watch<UsernameProvider>().username,
//         decoration: InputDecoration(
//           isDense: true,
//           hintText: "cuber",
//           enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: UnderlineInputBorder(),
//         ),
//         style: DefaultTextStyle.of(
//           context,
//         ).style.copyWith(color: Theme.of(context).colorScheme.primary),
//         onChanged: (newInput) =>
//             context.read<UsernameProvider>().updateUsername(newInput),
//         onTapOutside: (event) => FocusScope.of(context).unfocus(),
//       ),
//     );
//   }
// }

// TODO
