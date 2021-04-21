import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container.dart';

class LocalizationContainer extends BlocContainer{
  final Widget child;

  LocalizationContainer({@required Widget this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocateCubit> (
      create: (context) => CurrentLocateCubit() ,
      child: this.child,
    );
  }
}

class CurrentLocateCubit extends Cubit<String>{
  CurrentLocateCubit(): super("en");
}


class ViewI18N {
  String _language;

  ViewI18N(BuildContext context){
    //o problema dessa abordagem
    //é o rebuild quando voce troaca a lingua
    //o que voce quer reconstruir quando trocar o currentlocatecubit
    //em geral reinicia o sistema ou volta para tela inicial
    this._language = BlocProvider.of<CurrentLocateCubit>(context).state;
  }

  String localize(Map<String, String> map) {
    return map[_language];
  }
}
