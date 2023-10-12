import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_height/screens/izars_servis.dart';

import '../data.dart';
part 'get_all_data_model_event.dart';
part 'get_all_data_model_state.dart';

class GetAllDataModelBloc
    extends Bloc<GetAllDataModelEvent, GetAllDataModelState> {
  GetAllDataModelBloc() : super(GetAllDataModelInitial()) {
    on<StartGetALlDataModelEvent>(getAllData);
  }

  Future<void> getAllData(StartGetALlDataModelEvent event,
      Emitter<GetAllDataModelState> emit) async {
    emit(GetAllDataModelProcces());

    List<Data> data = await IsarService().getAllData();

    emit(GetAllDataModelSucces(data));
  }
}
