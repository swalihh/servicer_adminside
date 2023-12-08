import 'package:adminservice/bloc/bloc/servicer_bloc.dart';
import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:adminservice/resources/widgets/elevatedbutton.dart';
import 'package:adminservice/resources/widgets/sizedbox.dart';
import 'package:adminservice/resources/widgets/textfiled.dart';
import 'package:adminservice/utils/toasts.dart';
import 'package:adminservice/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('asset/images/Frame 4.jpg'),
          ),
        ),
        child: Center(
          child: CustomContainer(
            height: screenSize.height * 0.3,
            width: screenSize.width * 0.3,
            child: Column(
              children: [
                LoginTextField(
                  controller: usernameController,
                  labelText: 'Username',
                ),
                const TextFieldSpacing(),
                LoginTextField(
                  obscureText: true,
                  controller: passwordController,
                  labelText: 'Password',
                ),
                const TextFieldSpacing(),
                CustomElevatedButton(
                  onPressed: () {
                    if (usernameController.text == 'admin' &&
                        passwordController.text == '1234') {
                         context.read<ServicerBloc>().add(UserDataFetchEvent());
                         context.read<ProgressBloc>().add(AcceptedUserFetchEvent());

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    } else {
                      ToastHandler.showErrorToast(
                          context, "Invalid Username or Password");
                    }
                  },
                  buttonText: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 