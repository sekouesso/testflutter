import 'package:bloc/bloc.dart';
import 'package:testflutter/model/users.model.dart';
import 'package:testflutter/repository/users.repository.dart';

abstract class UsersEvent{}
class SearchUsersEvent extends UsersEvent{
  final String keyword;
  final int page;
  final int pageSize;
  SearchUsersEvent({required this.keyword,required this.page,required this.pageSize});
}

class NextPageEvent extends SearchUsersEvent{
  NextPageEvent({required super.keyword, required super.page, required super.pageSize});

}

abstract class UsersState{
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final String currentKeyword;

 const UsersState(
      {required this.users,
        required this.currentPage,
        required this.totalPages,
        required this.pageSize,
        required this.currentKeyword
      });
}
class SearchUsersSuccessState extends UsersState{
  SearchUsersSuccessState({required super.users, required super.currentPage, required super.totalPages, required super.pageSize, required super.currentKeyword});


}
class SearchUsersSLoadingState extends UsersState{
  SearchUsersSLoadingState({required super.users, required super.currentPage, required super.totalPages, required super.pageSize, required super.currentKeyword});
}
class SearchUsersSErrorState extends UsersState{
  final String errorMessage;

  SearchUsersSErrorState({required super.users, required super.currentPage, required super.totalPages, required super.pageSize, required super.currentKeyword,required this.errorMessage});


}
class UsersInitialState extends UsersState{
  UsersInitialState():super(users: [],currentPage: 0,totalPages: 0,pageSize: 20,currentKeyword: "");
}

class UsersBloc extends Bloc<UsersEvent,UsersState>{
  late final UsersEvent currentEvent;
  UsersRepositry usersRepositry = UsersRepositry();
  UsersBloc():super(UsersInitialState()){
    on((SearchUsersEvent event, emit) async {
     // currentEvent = event;
      emit(SearchUsersSLoadingState(
        currentKeyword: state.currentKeyword,
        pageSize: state.pageSize,
        totalPages: state.totalPages,
        currentPage: state.currentPage,
        users: state.users
      ));
      try {
        ListUsers listUsers = await usersRepositry.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount/event.pageSize).ceil();
        emit(SearchUsersSuccessState(
            users: listUsers.items,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
          currentKeyword: event.keyword
        ));
      } catch (e) {
        emit(SearchUsersSErrorState(
            currentKeyword: state.currentKeyword,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            currentPage: state.currentPage,
            users: state.users,
            errorMessage: e.toString()
        ));
      };
    });
    on((NextPageEvent event, emit) async {
      //print("page ${event.page}");
      try {
        ListUsers listUsers = await usersRepositry.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount/event.pageSize).ceil();
        List<User> currentUsersList  = [...state.users];
        currentUsersList.addAll(listUsers.items);
        emit(SearchUsersSuccessState(
            users: currentUsersList,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeyword: event.keyword
        ));
      } catch (e) {
        emit(SearchUsersSErrorState(
            currentKeyword: state.currentKeyword,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            currentPage: state.currentPage,
            users: state.users,
            errorMessage: e.toString()));
      };
    });


}

}