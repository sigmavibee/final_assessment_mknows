import 'package:flutter/material.dart';

import 'package:uas_mknows/screen/main_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/num_count_bloc.dart';
import 'main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  //untuk hasilkan saya taro di readme ya bang

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumCountBloc(),
      child: const HomePage(),
    );
  }
}
