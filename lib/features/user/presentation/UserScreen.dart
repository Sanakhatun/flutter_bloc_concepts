import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/features/user/business_logic/user_bloc.dart';
import 'package:flutter_bloc_concepts/features/user/business_logic/user_state.dart';

/**
 * @Author: Sanakhatun Shaikh
 * @Date: 10/3/2022
 */

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);

    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                bloc.add(UserRequest());
              },
              child: Text(
                "Click",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLoadingProgress) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadSuccess) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.user.length,
                      itemBuilder: (context, position) {
                        return Card(
                          child: Container(
                            child: Text(state.user[position].name),
                            padding: EdgeInsets.all(16),
                          ),
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        );
                      }),
                );
              } else if (state is UserLoadFailure) {
                return Center(
                  child: Text("Something went wrong"),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      )),
    );
  }
}
