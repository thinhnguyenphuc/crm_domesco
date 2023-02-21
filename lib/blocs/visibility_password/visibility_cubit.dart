
import 'package:demo_domesco/blocs/visibility_password/visibility_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityCubit extends Cubit<VisibilityState> {
  VisibilityCubit() : super(Hide());


  Future<void> showPass() async {
    emit(Show());
  }

  Future<void> hidePass() async {
    emit(Hide());
  }
}
