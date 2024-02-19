
import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/models/servicermodel.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:adminservice/resources/widgets/detail.dart';
import 'package:adminservice/resources/widgets/sizedbox.dart';
import 'package:adminservice/resources/widgets/viewpagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Accepted extends StatefulWidget {
  final ServicerModel servcer;
  Accepted({
    super.key,
    required this.servcer,
  });

  @override
  State<Accepted> createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  TextEditingController descriptionController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    context.read<ProgressBloc>().add(AcceptedUserFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    descriptionController.text = widget.servcer.description;
    locationController.text = widget.servcer.location;
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Stack(
        children: [
          CustomContainer(
            height: screenSize.height * 0.5+20,
            width: screenSize.width * 0.5,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.1,
                      decoration:  BoxDecoration(
                        color: Webcolors.accentCanvasColor,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.servcer.servicerImage)),
                      ),
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Name',
                      label2: widget.servcer.fullname,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Email',
                      label2: widget.servcer.email,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Phone',
                      label2: widget.servcer.phone,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Job Type',
                      label2: widget.servcer.serviceCategory,
                    ),
                    const TextFieldSpacing(),
                    DetailWidget(
                      label: 'Charge Per Hour',
                      label2: widget.servcer.amount.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  width: screenSize.width * 0.1 - 150,
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
                    width: screenSize.width * 0.2 - 50,
                    height: screenSize.height * 0.5,
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
                          maxLines: 3,
                        ),
                        const TextFieldSpacing(),
                        Text(
                          'Verification Document',
                          style: AppText.smallDark,
                        ),
                        Container(
                          
                          height: screenSize.height * 0.1 + 35,
                          width: screenSize.width * 0.3,
                          decoration:  BoxDecoration(
                            
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.servcer.servicerDocument)),
                            color: Webcolors.accentCanvasColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
