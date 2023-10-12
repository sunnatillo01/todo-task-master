part of 'get_all_data_model_bloc.dart';

abstract class GetAllDataModelState {}

class GetAllDataModelInitial extends GetAllDataModelState {}

class GetAllDataModelSucces extends GetAllDataModelState {
  final List<Data> dataModel;

  GetAllDataModelSucces(this.dataModel);
}

class GetAllDataModelProcces extends GetAllDataModelState {}

class GetAllDataModelFailure extends GetAllDataModelState {}
