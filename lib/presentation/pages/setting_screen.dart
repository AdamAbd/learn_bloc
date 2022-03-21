import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text('Settings'),
      ),
      body: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'App ' +
                  state.appNotification.toString().toUpperCase() +
                  ', Email ' +
                  state.emailNotification.toString().toUpperCase(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                value: state.appNotification,
                onChanged: (newValue) {
                  context.read<SettingCubit>().toggleAppNotification(newValue);
                },
                title: const Text('App Notifications'),
              ),
              SwitchListTile(
                value: state.emailNotification,
                onChanged: (newValue) {
                  context
                      .read<SettingCubit>()
                      .toggleEmailNotification(newValue);
                },
                title: const Text('Email Notifications'),
              ),
            ],
          );
        },
      ),
    );
  }
}
