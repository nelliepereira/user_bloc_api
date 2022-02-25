import 'package:colorlizer/colorlizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc_api/bloc/users_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    ColorLizer colorLizer = ColorLizer();
    return BlocProvider(
      create: (context) =>
      UsersBloc(RepositoryProvider.of(context),)
        ..add(LoadUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title:  'Users App from API using bloc'.text.white.makeCentered(),
          actions: const [
            Icon(Icons.search,color: Colors.white,)
          ],
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersInitialState) {
              return const CircularProgressIndicator();
            } else if (state is UsersLoadingErrorState) {
              return errorWidget('Error');
            } else if(state is UsersLoadingSuccessState) {
              return SizedBox(
                height: context.screenHeight * 0.98,
                width: context.screenWidth * 0.98,
                child: GridView.builder(

                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: state.usersClass.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  itemBuilder: (context, index) {

                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: context.screenHeight * 0.98,
                              width: context.screenWidth * 0.98,
                              decoration:  BoxDecoration(
                                color: colorLizer.getSpecialFiledColor(
                                    [Colors.orangeAccent.shade100,Colors.yellowAccent.shade100,Colors.lightGreenAccent.shade100]),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Text('User Profile \n').text.xl.semiBold.makeCentered(),
                                    Text('Name:     ' + state.usersClass[index].name.toString()),
                                    Text('Email:    ' + state.usersClass[index].email.toString()),
                                    10.heightBox,
                                    Text('Company Name:     ' + state.usersClass[index].company.name.toString() + ', '+ state.usersClass[index].address.city),
                                    Text('Company TagLine:  ' + state.usersClass[index].company.catchPhrase.toString()),
                                    10.heightBox,
                                    Text('Lat /Long :    ' + state.usersClass[index].address.geo.lat.toString() + ' / ' +state.usersClass[index].address.geo.lng  ),

                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              );
            } else {
              return const Text('State Not defined');
            }

          },
        ),
      ),
    );
  }
}

