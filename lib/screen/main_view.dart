import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uas_mknows/bloc/num_count_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumCountBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocBuilder<NumCountBloc, NumCountState>(
            builder: (context, state) {
              if (state is NumCountStateInitial) {
                return SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textField('input', state),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              elevatedButton(
                                  () => context.read<NumCountBloc>().add(
                                        NumCountEvent.onGetResultNumber1(
                                          int.parse(
                                              state.numberController.text),
                                        ),
                                      ),
                                  '1'),
                              elevatedButton(
                                  () => context.read<NumCountBloc>().add(
                                        NumCountEvent.onGetResultNumber2(
                                          int.parse(
                                              state.numberController.text),
                                        ),
                                      ),
                                  '2'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              elevatedButton(
                                  () => context.read<NumCountBloc>().add(
                                        NumCountEvent.onGetResultNumber3(
                                          int.parse(
                                              state.numberController.text),
                                        ),
                                      ),
                                  '3'),
                              elevatedButton(
                                  () => context.read<NumCountBloc>().add(
                                        NumCountEvent.onGetResultNumber4(
                                          int.parse(
                                              state.numberController.text),
                                        ),
                                      ),
                                  '4'),
                            ],
                          ),
                          resultText('Result : '),
                          outputData(state),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

Widget textField(String hintText, NumCountState state) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: TextField(
      controller: state.numberController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xffD4D4D4),
          ),
        ),
        hintText: hintText,
      ),
    ),
  );
}

Widget elevatedButton(VoidCallback onPressed, String text) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(175, 50),
        backgroundColor: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(text),
    ),
  );
}

Widget resultText(String result) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(result),
  );
}

Widget outputData(NumCountState state) {
  return Wrap(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          state.result.join(''),
          style: const TextStyle(fontSize: 25),
        ),
      ),
    ],
  );
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Final Assessment'),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Input N',
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black))),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 5, bottom: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     buttonWidget('1', () {}),
//                     buttonWidget('2', () {})
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [buttonWidget('3', () {}), buttonWidget('4', () {})],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget buttonWidget(String text, VoidCallback onPressed) {
//   return ElevatedButton(
//     onPressed: onPressed,
//     child: Text(text),
//     style: ElevatedButton.styleFrom(minimumSize: Size(175, 50)),
//   );
// }
