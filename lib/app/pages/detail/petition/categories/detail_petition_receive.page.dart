import 'package:camionesm/app/pages/detail/petition/contract/detail_petition.contract.dart';
import 'package:flutter/material.dart';

class DetailPetitionReceivePage extends DetailPetitionContract {
  const DetailPetitionReceivePage(
      {super.key, this.onPressedReject, this.onPressedAccept});

  final void Function()? onPressedReject;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) {
    return Column();
  }

}
