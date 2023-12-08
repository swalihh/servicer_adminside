import 'package:adminservice/bloc/bloc/servicer_bloc.dart';
import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/models/servicermodel.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:adminservice/resources/widgets/detail.dart';
import 'package:adminservice/resources/widgets/sizedbox.dart';
import 'package:adminservice/resources/widgets/statuselevatedbutton.dart';
import 'package:adminservice/resources/widgets/viewpagecontainer.dart';
import 'package:adminservice/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Views extends StatelessWidget {
  final ServicerModel servicer;
  Views({super.key, required this.servicer});
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    descriptionController.text = servicer.description;
    locationController.text = servicer.location;
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Stack(
        children: [
          CustomContainer(
            height: screenSize.height * 0.7,
            width: screenSize.width * 0.7,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height * 0.3,
                      width: screenSize.width * 0.2,
                      decoration: BoxDecoration(
                        color: Webcolors.accentCanvasColor,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(servicer.servicerImage)),
                      ),
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Name',
                      label2: servicer.fullname,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Email',
                      label2: servicer.email,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Phone',
                      label2: servicer.phone,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Job Type',
                      label2: servicer.serviceCategory,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Charge Per Hour',
                      label2: servicer.amount.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenSize.width * 0.1 - 110,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.amber,
                    width: screenSize.width * 0.4 + 30,
                    height: screenSize.height * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomViewTextField(
                          controller: locationController,
                          labelText: 'Location',
                          prefixIcon: Icons.location_on,
                        ),
                        const TextFieldSpacing(),
                        CustomViewTextField(
                          controller: descriptionController,
                          labelText: 'Describtion',
                          minLength: 500,
                          maxLines: 5,
                        ),
                        const TextFieldSpacing(),
                        Text(
                          'Verification Document',
                          style: AppText.smallDark, 
                        ),
                        Shimmer(
                          duration:const Duration(seconds: 3),
                          child: Container(
                            height: screenSize.height * 0.3 - 50,
                            width: screenSize.width * 0.2 + 20,
                            decoration: BoxDecoration(
                              color: Webcolors.accentCanvasColor,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(servicer.servicerDocument),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            right: 60,
            child: Column(
              children: [
                ///------------------------------------------------------reject---------------------------------------------------------
                BlocConsumer<ProgressBloc, ProgressState>(
                  listener: (context, state) {
                    if (state is RejectedState) {
                      context.read<ServicerBloc>().add(UserDataFetchEvent());
                      Navigator.of(context).pop();
                      ToastHandler.showSuccessToast(
                          context, 'Successfuly Rejected !');
                    } else if (state is RejectErrorState) {
                      ToastHandler.showErrorToast(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return CustomIconButton(
                        onPressed: () {
                          // print(servicer.id.toString());
                          context.read<ProgressBloc>().add(
                              ServicerRejectedEvent(
                                  id: servicer.id.toString()));
                        },
                        label: 'Rejected',
                        icon: const Icon(Icons.cancel),
                        textColor: Webcolors.rejectcolor);
                  },
                ),
                //------------------------------------------------Accept-----------------------------------------------------------------------------
                const TextFieldSpacing(),
                BlocConsumer<ProgressBloc, ProgressState>(
                  listener: (context, state) {
                    if(state is AccecptSuccessState){
                      Navigator.of(context).pop();
                      ToastHandler.showSuccessToast(context, "Accepted");
                      context.read<ServicerBloc>().add(UserDataFetchEvent());
                    }else if(state is AcceptErrorState){
                      ToastHandler.showErrorToast(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return CustomIconButton(
                        onPressed: () {
                      context.read<ProgressBloc>().add(ServicerAcceptedEvent(id: servicer.id.toString()));

                        },
                        label: 'Accepted',
                        icon: const Icon(Icons.check_circle),
                        textColor: Webcolors.acceptcolor);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 8,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
