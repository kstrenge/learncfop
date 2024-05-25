import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

// class HomeExample extends StatefulWidget {
//   const HomeExample({Key? key}) : super(key: key);

//   @override
//   _HomeExampleState createState() => _HomeExampleState();
// }

// class _HomeExampleState extends State<HomeExample> {
//   bool showArrows = true;

//   @override
//   Widget build(BuildContext context) => ArrowContainer(
//         child: Scaffold(
//           appBar: AppBar(
//             title: ArrowElement(
//               show: showArrows,
//               color: Colors.red,
//               id: 'title',
//               targetId: 'text2',
//               targetAnchor: Alignment.topCenter,
//               sourceAnchor: Alignment.bottomCenter,
//               child: Text('Arrows everywhere'),
//             ),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: ArrowElement(
//                     bow: 0,
//                     show: showArrows,
//                     id: 'text',
//                     targetIds: ['fab', 'title'],
//                     sourceAnchor: Alignment.bottomCenter,
//                     color: Colors.green,
//                     child: Text('Arrows and stuff'),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ArrowElement(
//                     show: showArrows,
//                     id: 'text2',
//                     targetId: 'text',
//                     targetAnchor: Alignment.centerRight,
//                     child: Text(
//                       'Arrow here please',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: ArrowElement(
//             id: 'fab',
//             child: FloatingActionButton(
//               onPressed: () => setState(() {
//                 showArrows = !showArrows;
//               }),
//               tooltip: 'hide/show',
//               child: Icon(Icons.remove_red_eye),
//             ),
//           ),
//         ),
//       );
// }

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rubik App")),
      body: const Center(child: Text("Home")),
    );
  }
}
