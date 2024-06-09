import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:risky_coin/presentation/route/app_router.gr.dart';
import 'package:risky_coin/presentation/screen/user_screen/bloc/user_bloc.dart';
import 'package:risky_coin/presentation/utils/color_utils.dart';

@RoutePage()
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserInitEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is UserLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if(state is UserLoaded) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Quản lý nhân sự",
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(UserDetailRoute(id: state.users[index].id ?? '')).then((value) {
                            if(value == true) {
                              BlocProvider.of<UserBloc>(context).add(UserInitEvent());
                            }
                          });
                        },
                        child: Card(
                          elevation: 6.0,
                          color: const Color(0xffEDFFFF),
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        child: Text(
                                          "Tên : ${state.users[index].name}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: ColorUtils.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        child: Text(
                                          "SĐT: ${state.users[index].phone}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: ColorUtils.grey,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    state.users[index].email,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: ColorUtils.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                    itemCount: state.users.length,
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    AutoRouter.of(context).push(UserCreateRoute()).then((value) {
                      if(value == true) {
                        BlocProvider.of<UserBloc>(context).add(UserInitEvent());
                      }
                    });
                  },
                  backgroundColor: ColorUtils.primaryColor,
                  child: const Icon(
                    Icons.add,
                    color: ColorUtils.white,
                  ),
                )
            );
          }
          return Container();
        },
      ),
    );
  }
}
