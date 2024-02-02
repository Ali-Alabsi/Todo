part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}
class ChangeBottomNavBar extends TodosState{}
class CreateDataBase extends TodosState{}
class DeleteFromDataBase extends TodosState{}
class InsertToDataBase extends TodosState{}
// Get With Status
class GetTasksDataBase extends TodosState{}
class GetActiveDataBase extends TodosState{}
class GetCompleteDataBase extends TodosState{}
// Update With Status
class UpdateActiveInDataBase extends TodosState{}
class UpdateCompleteInDataBase extends TodosState{}
class UpdateTasksInDataBase extends TodosState{}
class UpdateFromDataBase extends TodosState{}