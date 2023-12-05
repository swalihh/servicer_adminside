
import 'package:adminservice/bloc/bloc/servicer_bloc.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:adminservice/resources/widgets/customcard.dart';
import 'package:adminservice/resources/widgets/sizedbox.dart';
import 'package:adminservice/resources/widgets/viewbutton.dart';
import 'package:adminservice/utils/alertbox.dart';
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
            child: AppBar(
              leading: const CircleAvatar(),
              backgroundColor: Webcolors.accentCanvasColor,
              title: const Text('Admin'),
              centerTitle: true,
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
                    if(state is ServicerDataLoadingState){
                      return const CircularProgressIndicator();
                    }else if(state is ServicerDataFetchSuccessState){
                     
                         return ListView.separated(
                        itemBuilder: (context, index) {
                          final servce=state.servicers[index];
                          return CustomDetailContainer(
                            height: screenSize.height * 0.1 + 30,
                            width: screenSize.width * 0.3,
                            color: Webcolors.accentCanvasColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 CircleAvatar(
                                  backgroundImage: NetworkImage(servce.servicerImage),
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
                                    showViewAlertDialog(context,servce);
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
                    return SizedBox();
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
