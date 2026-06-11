import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoButtonsMoreFeaturesSocial extends StatelessWidget {
  const DemoButtonsMoreFeaturesSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H3(const Text('Social Buttons')),
          FUISpacer.vSpace10,
          SmallTextI(const Text('Class: FUIButtonBlockCircleIcon')),
          FUISpacer.vSpace10,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8,
            runSpacing: 8,
            children: [
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.facebook, color: Colors.white), backgroundColor: Color(0xff4267B2), onPressed: () {}),
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.instagram, color: Colors.white), backgroundColor: Color(0xffba308c), onPressed: () {}),
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.twitter, color: Colors.white), backgroundColor: Color(0xff1dadeb), onPressed: () {}),
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.linkedin, color: Colors.white), backgroundColor: Color(0xff127cb3), onPressed: () {}),
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.pinterest, color: Colors.white), backgroundColor: Color(0xffc9232d), onPressed: () {}),
              FUIButtonBlockCircleIcon(icon: const Icon(LineAwesomeIcons.github, color: Colors.white), backgroundColor: Color(0xff000000), onPressed: () {}),
            ],
          ),
          FUISpacer.vSpace10,
          SmallTextI(const Text('Class: FUIButtonOutlinedCircleIcon')),
          FUISpacer.vSpace10,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8,
            runSpacing: 8,
            children: [
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.facebook, color: Color(0xff4267B2)), onPressed: () {}),
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.instagram, color: Color(0xffba308c)), onPressed: () {}),
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.twitter, color: Color(0xff1dadeb)), onPressed: () {}),
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.linkedin, color: Color(0xff127cb3)), onPressed: () {}),
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.pinterest, color: Color(0xffc9232d)), onPressed: () {}),
              FUIButtonOutlinedCircleIcon(icon: const Icon(LineAwesomeIcons.github, color: Color(0xff000000)), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
