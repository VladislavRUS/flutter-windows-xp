import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/core/ioc/ioc.dart';
import 'package:flutter_windows_xp/ui/screens/app/desktop_renderer/application_icon/application_icon.dart';
import 'package:flutter_windows_xp/ui/screens/app/desktop_renderer/bloc/desktop_renderer_bloc.dart';
import 'bloc/desktop_renderer_state.dart';

class DesktopRenderer extends StatelessWidget {
  const DesktopRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<DesktopRendererBloc>()..init(),
      child: BlocBuilder<DesktopRendererBloc, DesktopRendererState>(
        builder: (context, state) {
          final applications = state.applications;

          return Container(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              itemBuilder: (_, index) => Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 60,
                    child: Center(
                      child: ApplicationIcon(
                        application: applications[index],
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (_, __) => const SizedBox(
                height: 20,
              ),
              itemCount: applications.length,
            ),
          );
        },
      ),
    );
  }
}
