import 'package:adminservice/bloc/servicer/servicer_bloc.dart';
import 'package:adminservice/data/sharedpreferences/login.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:adminservice/resources/strings/splashstring.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:adminservice/resources/widgets/customcard.dart';
import 'package:adminservice/resources/widgets/sizedbox.dart';
import 'package:adminservice/resources/widgets/viewbutton.dart';
import 'package:adminservice/utils/alertbox.dart';
import 'package:adminservice/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenSize.height * 0.1 + 15),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AppBar(
                leading: const Icon(Icons.handyman_outlined),
                backgroundColor: Webcolors.accentCanvasColor,
                title: Text(
                  HomeString.appName,
                  style: AppText.hometittle,
                ),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: ()async {
                    await Sharedprfe.instance.removeToken();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));

                  }, icon: const Icon(Icons.logout))
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const TextFieldSpacing(),
            CustomContainer(
                height: screenSize.height * 0.8 + 15,
                width: screenSize.width * 0.9,
                child: BlocBuilder<ServicerBloc, ServicerState>(
                  builder: (context, state) {
                    if (state is ServicerDataLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is ServicerDataFetchSuccessState) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final servce = state.servicers[index];
                            return CustomDetailContainer(
                              height: screenSize.height * 0.1 + 30,
                              width: screenSize.width * 0.3,
                              color: Webcolors.accentCanvasColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      servce.servicerImage,
                                    ),
                                    radius: 80,
                                  ),
                                  Text(
                                    servce.fullname,
                                    style: AppText.smallDark,
                                  ),
                                  Text(
                                    servce.serviceCategory,
                                    style: AppText.smallDark,
                                  ),
                                  ViewElevatedButton(
                                    onPressed: () {
                                      showViewAlertDialog(context, servce);
                                    },
                                    text: "View",
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: state.servicers.length);
                    }
                    return const Center(
                      child: Text('NO Request Found !',style: TextStyle(color: Colors.white),),
                    );
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
