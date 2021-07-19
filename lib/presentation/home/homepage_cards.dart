import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:movieapp/infrastructure/models/hospital_data.dart';
import 'package:movieapp/presentation/home/add_details.dart';
import 'package:movieapp/presentation/home/card_details/bed.dart';
import 'package:movieapp/presentation/home/card_details/oxygen_cylinder.dart';

class HomepageCards extends StatelessWidget {
  final HospData hospData;

  const HomepageCards({this.hospData});

  @override
  Widget build(BuildContext context) {
    if (hospData.itemtype == 'oxygen cylinder') {
      return OxygenCard(hospData: hospData);
    } else {
      return BedCard(hospData: hospData);
    }
  }
}
