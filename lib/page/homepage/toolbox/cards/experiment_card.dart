// Copyright 2023 BenderBlog Rodriguez and contributors.
// SPDX-License-Identifier: MPL-2.0

import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:watermeter/page/setting/dialogs/experiment_password_dialog.dart';
import 'package:watermeter/repository/preference.dart' as preference;
import 'package:watermeter/page/experiment/experiment_window.dart';
import 'package:watermeter/page/homepage/toolbox/small_function_card.dart';

class ExperimentCard extends StatefulWidget {
  const ExperimentCard({super.key});

  @override
  State<ExperimentCard> createState() => _ExperimentCardState();
}

class _ExperimentCardState extends State<ExperimentCard> {
  @override
  Widget build(BuildContext context) {
    return SmallFunctionCard(
      onTap: () async {
        bool isGood = true;
        if (preference
            .getString(preference.Preference.experimentPassword)
            .isEmpty) {
          isGood = await showDialog(
            context: context,
            builder: (context) => const ExperimentPasswordDialog(),
          );
        }
        if (mounted && isGood) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ExperimentWindow(),
            ),
          );
        }
      },
      icon: MingCuteIcons.mgc_science_line,
      name: "物理实验",
      description: "计算还顺利吧",
    );
  }
}