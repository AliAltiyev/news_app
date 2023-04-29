import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../product/utils/constants/colors.dart';
import '../../../product/utils/constants/string_constants.dart';
import '../../../product/widgets/custom_button.dart';
import '../home/home._view.dart';
import 'state/splash_provider.dart';
import 'state/splash_state.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final provider = StateNotifierProvider<SplashProvider, SplashState>(
      (ref) => SplashProvider());

  @override
  void initState() {
    super.initState();
    ref
        .read<SplashProvider>(provider.notifier)
        .checkApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(provider, (previous, next) {
      if (next.isRequiredUpdateApplication) {
        _showDialogContent(context);
        return;
      }
      if (next.isRedirectUserToHomePage == true) {
        context.navigateToPage(const HomeView());
        return;
      }
    });

    return Scaffold(
        backgroundColor: AppColors.purpleDarker,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            LoadingAnimationWidget.staggeredDotsWave(
              color: AppColors.white,
              size: context.dynamicHeight(.1),
            ),
            Text(
              StringConstants.appName.toString(),
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }

  Future<dynamic> _showDialogContent(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.white,
            ),
            height: context.height * .3,
            width: context.height * .4,
            child: Padding(
              padding: context.paddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Update Belarus News?',
                    style: context.textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: context.height * .01,
                  ),
                  Text(
                    'Belarus app recommends you update to the latest version',
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: context.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () {},
                        child: Text(
                          'No Thanks',
                          style: context.textTheme.titleSmall
                              ?.apply(color: AppColors.purpleDarker),
                        ),
                      ),
                      CustomButton(
                          onPressed: () {},
                          backgroundColor: AppColors.purpleDarker,
                          child: const Text('Update')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
