import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:testflutter/bloc/users.bloc.dart';
import 'package:testflutter/ui/pages/git.user.repositories.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
          if (state is SearchUsersSuccessState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Users"),
                Text("${state.currentPage}/${state.totalPages}")
              ],
            );
          } else {
            return const Text("Users Page");
          }
        }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(width: 2)),
                        hintText: 'search',
                        contentPadding: const EdgeInsets.all(5)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String kw = controller.text;
                    context.read<UsersBloc>().add(
                        SearchUsersEvent(keyword: kw, page: 0, pageSize: 20));
                  },
                  icon: const Icon(Icons.search),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
            if (state is SearchUsersSLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchUsersSErrorState) {
              return Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        UsersBloc usersBloc = context.read<UsersBloc>();
                        usersBloc.add(usersBloc.currentEvent);
                      },
                      child: const Text('Retry'))
                ],
              );
            } else if (state is SearchUsersSuccessState) {
              return Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: () {
                    context.read<UsersBloc>().add(NextPageEvent(
                        keyword: state.currentKeyword,
                        page: state.currentPage + 1,
                        pageSize: state.pageSize));
                  },
                  child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GitRepositories(
                                          user: state.users[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          state.users[index].avatarUrl),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.users[index].login,
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  child: Text('${state.users[index].score}'),
                                )
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const Divider(height: 2),
                      itemCount: state.users.length),
                ),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
