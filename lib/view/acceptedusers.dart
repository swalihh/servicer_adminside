import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/widgets/acceptdetails.dart';
import 'package:adminservice/resources/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AcceptedServicer extends StatelessWidget {
  const AcceptedServicer({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Webcolors.accentCanvasColor,
        title: const Text('Servicers'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomContainer(
          height: screenSize.height * 0.9,
          width: screenSize.width * 0.9,
          child: BlocBuilder<ProgressBloc, ProgressState>(
            builder: (context, state) {
              if (state is AcceptedServicerDataFetchErrorState) {
                return const CircularProgressIndicator();
              } else if (state is AcceptedServicerDetailsFetchState) 
              {
                print(state);
                print("list is ${state.servicers}");
                return AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing:2 ,
                    crossAxisSpacing: 2,
                    children: List.generate(
                      state.servicers.length,
                      (int index) {
                        final servicer = state.servicers[index];
                         print(servicer);
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: state.servicers.length,
                          
                          child: ScaleAnimation(
                            child: FadeInAnimation(child: Accepted(servcer:servicer)),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
