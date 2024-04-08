// Copyright 2023 BenderBlog Rodriguez and contributors.
// SPDX-License-Identifier: MPL-2.0

import 'package:flutter/material.dart';
import 'package:watermeter/page/public_widget/toast.dart';
import 'package:watermeter/page/public_widget/context_extension.dart';
import 'package:watermeter/page/score/score.dart';
import 'package:watermeter/repository/xidian_ids/ids_session.dart';
import 'package:watermeter/page/homepage/toolbox/small_function_card.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SmallFunctionCard(
      onTap: () {
        if (offline) {
          showToast(msg: "脱机模式下，一站式相关功能全部禁止使用");
        } else {
          context.pushReplacement(const ScoreWindow());
        }
      },
      icon: Icons.grading_rounded,
      name: "成绩查询",
    );
  }
}
