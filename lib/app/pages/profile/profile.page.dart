import 'package:camionesm/app/pages/profile/profile.controller.dart';
import 'package:camionesm/app/pages/profile/widgets/my_transport_item.dart';
import 'package:camionesm/app/utils/dialog.utils.dart';
import 'package:camionesm/app/widgets/app_bar/app_bar_undulated.widget.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/buttons/button_card.widget.dart';
import 'package:camionesm/app/widgets/buttons/icon_button.widget.dart';
import 'package:camionesm/app/widgets/cards/container.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/app/widgets/time_line.widget.dart';
import 'package:camionesm/core/routes/routes.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/core/values/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Column(children: [
                  CustomAppBarUndulate(
                      pathBackgroundImage: Paths.splash,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: Get.width * 0.13,
                                child: CustomIconButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () => Get.back())),
                            IconButton(
                                icon: const Icon(Icons.more_vert,
                                    color: Colors.black, size: 40),
                                onPressed: () => _customDialogMoreOptions())
                          ]).paddingAll(15)),
                  SizedBox(height: Get.height * 0.07),
                  _contentBody(context)
                ]),
                _customHead(context)
              ]),
            ],
          ),
        ));
  }

  Widget _customHead(BuildContext context) {
    return Center(
        heightFactor: 2.5,
        child: GestureDetector(
            onTap: () => Get.toNamed(Routes.profile),
            child: const Hero(
                tag: Keys.animationAppBarToProfile,
                child: CircleAvatar(
                    backgroundImage: AssetImage(Paths.profile),
                    radius: 60.0))));
  }

  Widget _contentBody(BuildContext context) {
    return Column(children: [
      Column(children: [
        CustomText("Insignia de Plata",
            textAlign: TextAlign.center, maxLines: 4, style: bodyMedium),
        SizedBox(height: Get.height * 0.01),
        CustomText("Jorge Murillo Sánchez", style: titleLarge),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.location_on_outlined, color: Colors.black),
          CustomText("México, CDMX", style: bodyMedium.apply(fontSizeDelta: 2))
        ]),
        SizedBox(height: Get.height * 0.02),
        Card(
                elevation: 0,
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _customColumnText(context, "78", " Viajes "),
                      _customColumnText(context, "862", "Kilómetros"),
                      _customColumnText(context, "${"★"} 4.2", "valoraciones")
                    ]).paddingAll(15))
            .paddingAll(22),
        Align(
            alignment: Alignment.centerLeft,
            child: CustomText("Progreso de perfil",
                style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height * 0.02),
        _customCardProgressProfile(context),
        SizedBox(height: Get.height * 0.02),
        _customCardDataPersonal(context).paddingOnly(top: 10, bottom: 5),
        _customCardDirection(context).paddingOnly(top: 10, bottom: 5),
        _customCardDocuments(context).paddingOnly(top: 10, bottom: 5),
        SizedBox(height: Get.height * 0.02),
      ]).paddingAll(20),
      SizedBox(
          height: Get.height * 0.145,
          width: Get.width,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            _customContainers(
                context,
                "5 Entregas a tiempo",
                "Cerca de obtener una insignia de realizar 5 entregas en antes del tiempo previsto.",
                "1/5",
                Globals.principalColor),
            _customContainers(
                context,
                "100 viajes completados",
                "Continua con tu progreso de 100 viajes completados.",
                "69/100",
                Globals.secondColor),
            _customContainers(
                context,
                "100 viajes completados",
                "Continua con tu progreso de 100 viajes completados.",
                "69/100",
                Globals.principal2Color)
          ])),
      SizedBox(height: Get.height * 0.04),
      SizedBox(
          width: Get.width,
          child: CustomContainer(
              backgroundColor: Globals.principalColor,
              child: Column(children: [
                Align(
                        alignment: Alignment.topLeft,
                        child: CustomText("Mis solicitudes",
                            style: titleMedium.apply(
                                fontWeightDelta: FontWeight.w500.value)))
                    .paddingAll(20),
                SizedBox(
                    height: Get.height * 0.69,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      MyCustomTransportItem(
                          onPressedAccept: () {}, onPressedReject: () {}),
                      MyCustomTransportItem(
                          onPressedAccept: () {}, onPressedReject: () {}),
                      MyCustomTransportItem(
                          onPressedAccept: () {}, onPressedReject: () {})
                    ]))
              ]))),
      Align(
              alignment: Alignment.centerLeft,
              child: CustomText("Insignias",
                  style: titleLarge.apply(fontSizeDelta: -4)))
          .paddingAll(20),
      SizedBox(height: Get.height * 0.01),
      SizedBox(
          height: Get.height * 0.25,
          width: Get.width,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            _customContainers2(
                context,
                Paths.insignia,
                "Insignia de puntualidad",
                "Este usuario a llegado a tiempo",
                "más de 100 viajes",
                Globals.principalColor),
            _customContainers2(
                context,
                Paths.insignia,
                "Insignia de puntualidad",
                "Este usuario a llegado a tiempo",
                "más de 100 viajes",
                Globals.principal2Color),
          ])),
      Column(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: CustomText("Mis ganancias",
                style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height * 0.02),
        _customContainerChart(context),
        SizedBox(height: Get.height * 0.04),
        Align(
            alignment: Alignment.centerLeft,
            child: CustomText("Tutoriales",
                style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height * 0.02),
        _customCardsStacked(),
        SizedBox(height: Get.height * 0.02),
        CustomContainer(
            backgroundColor: Globals.principalColor,
            child: Column(children: [
              Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Logros",
                          style: titleLarge.apply(fontSizeDelta: -4)))
                  .paddingAll(20),
              SizedBox(height: Get.height * 0.1),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("Mi insignia",
                            style: headlineLarge.apply(fontSizeDelta: -6)),
                        const CustomText(
                            "Conoce más sobre las insignias y los beneficios que brindan.",
                            maxLines: 3,
                            style: TextStyle(fontSize: 16))
                      ])).paddingAll(20),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: Get.height * 0.07,
                      width: Get.width * 0.15,
                      child: const CustomIconButton(
                          icon: Icons.keyboard_arrow_down_sharp,
                          size: 28,
                          backgroundColor: Colors.black)))
            ])),
        SizedBox(height: Get.height * 0.04),
        CustomContainer(
            backgroundColor: Globals.principal2Color,
            child: Column(children: [
              Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Invita y gana",
                          style: titleLarge.apply(fontSizeDelta: -4)))
                  .paddingAll(20),
              SizedBox(height: Get.height * 0.1),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("Tu invitación es poderosa",
                            style: headlineLarge.apply(fontSizeDelta: -6)),
                        const CustomText(
                            "Obtén múltiples beneficios al invitar a otros usuarios.",
                            maxLines: 3,
                            style: TextStyle(fontSize: 16))
                      ])).paddingAll(20),
              Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                      height: Get.height * 0.07,
                      width: Get.width * 0.15,
                      child: const CustomIconButton(
                          icon: Icons.keyboard_arrow_down_sharp,
                          size: 28,
                          backgroundColor: Colors.black)))
            ])),
        SizedBox(height: Get.height * 0.04),
        Align(
            alignment: Alignment.centerLeft,
            child: CustomText("¿Tienes dudas?",
                style: titleLarge.apply(fontSizeDelta: -4))),
        SizedBox(height: Get.height * 0.02),
        _customCardDoubts(
            context,
            "¿Qué tipo de cargas puedo transportar utilizando su servicio?",
            () {}),
        SizedBox(height: Get.height * 0.02),
        _customCardDoubts(
            context,
            "¿Cómo puedo garantizar la seguridad y la integridad de las cargas que transporte a través de su plataforma?",
            () {}),
        SizedBox(height: Get.height * 0.02),
        _customCardDoubts(
            context,
            "¿Cuál es el proceso para subir mis rutas disponibles y regresos vacíos en su plataforma?",
            () {})
      ]).paddingAll(20)
    ]);
  }

  //region widgets
  Widget _customContainers(BuildContext context, String title, String subtitle,
      String footer, Color color) {
    return CustomContainer(
        backgroundColor: color,
        width: Get.width * 0.8,
        child: Row(children: [
          SizedBox(width: Get.width * 0.1),
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CustomText(title, style: bodyMedium.apply(color: color == Colors.black ? Colors.white : null, fontSizeDelta: 2)),
                CustomText(subtitle, textAlign: TextAlign.start, maxLines: 4, style: bodyMedium.apply(color: color == Colors.black ? Colors.white : null)).paddingAll(1),
                Align(alignment: Alignment.topRight, child: CustomText(footer, style: titleMedium.apply(color: color == Colors.black ? Colors.white : null)))
              ]))
        ])).paddingOnly(left: 20, right: 5);
  }

  Widget _customContainers2(BuildContext context, String path, String title,
      String subtitle, String footer, Color color) {
    return CustomContainer(
        backgroundColor: color,
        width: Get.width * 0.7,
        child: Row(children: [
          SizedBox(width: Get.width * 0.05),
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(height: Get.height * 0.01),
                SizedBox(height: Get.height * 0.1, child: Image.asset(path)),
                SizedBox(height: Get.height * 0.02),
                CustomText(title,
                    style: bodyMedium.apply(
                        color: color == Colors.black ? Colors.white : null,
                        fontSizeDelta: 2,
                        fontWeightDelta: FontWeight.w500.index)),
                CustomText(subtitle,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        style: bodyMedium.apply(
                            color: color == Colors.black ? Colors.white : null,
                            fontWeightDelta: FontWeight.w300.index))
                    .paddingAll(1),
                SizedBox(height: Get.height * 0.01),
                CustomText(footer,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        style: bodyMedium.apply(
                            color: color == Colors.black ? Colors.white : null,
                            fontWeightDelta: FontWeight.w900.index))
                    .paddingAll(1)
              ]))
        ])).paddingOnly(left: 20, right: 5);
  }

  Widget _customColumnText(BuildContext context, String text, String title) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      CustomText(text, style: titleLarge),
      CustomText(title, style: bodyMedium)
    ]);
  }

  Widget _customCardDoubts(
      BuildContext context, String labelText, void Function()? onPressed) {
    return CustomCardButton(contentPadding: 10, radius: 15, children: [
      CustomText(labelText,
          maxLines: 4,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
              height: Get.height * 0.05,
              child: CustomIconButton(
                  backgroundColor: Globals.principalColor,
                  icon: Icons.add,
                  onPressed: onPressed)))
    ]);
  }

  Widget _customChart(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.2,
        child: LineChart(LineChartData(
            gridData: FlGridData(
                show: true,
                getDrawingVerticalLine: (value) =>
                    const FlLine(color: Colors.white, strokeWidth: 1),
                drawHorizontalLine: false),
            borderData: FlBorderData(
                show: true,
                border: const Border.fromBorderSide(BorderSide(
                    color: Colors.white,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside))),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 2),
                  const FlSpot(2, 1.5),
                  const FlSpot(3, 2.8),
                  const FlSpot(4, 2.5),
                  const FlSpot(5, 3.2),
                  const FlSpot(6, 3.0),
                  const FlSpot(7, 3.5),
                ],
                isCurved: true,
                color: Colors.white,
                barWidth: 2,
                belowBarData: BarAreaData(show: false),
                dotData: const FlDotData(show: true),
              )
            ],
            titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text(
                                'Jun',
                                style: TextStyle(color: Colors.white),
                              );
                            case 1:
                              return const Text('Jul',
                                  style: TextStyle(color: Colors.white));
                            case 2:
                              return const Text('Ago',
                                  style: TextStyle(color: Colors.white));
                            case 3:
                              return const Text('Sep',
                                  style: TextStyle(color: Colors.white));
                            case 4:
                              return const Text('Oct',
                                  style: TextStyle(color: Colors.white));
                            case 5:
                              return const Text('Nov',
                                  style: TextStyle(color: Colors.white));
                            case 6:
                              return const Text('Dic',
                                  style: TextStyle(color: Colors.white));
                            default:
                              return const Text('',
                                  style: TextStyle(color: Colors.white));
                          }
                        })))))).paddingOnly(left: 10);
  }

  Widget _buildCard(Color color, double width) {
    return Center(
        child: Container(
            height: Get.height * 0.2,
            width: width,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_circle_outline_outlined,
                        color: Colors.white, size: 75)))));
  }

  Widget _customCardsStacked() {
    return SizedBox(
        height: Get.height * 0.25,
        width: Get.width,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 10, child: _buildCard(Colors.grey[900]!, Get.width * 0.8)),
          Positioned(
              top: 20, child: _buildCard(Colors.grey[850]!, Get.width * 0.85)),
          Positioned(
              top: 30, child: _buildCard(Colors.grey[800]!, Get.width * 0.9))
        ]));
  }

//endregion
  //region cards
  Widget _customCardProgressProfile(BuildContext context) {
    return CustomCardButtonPrincipal(children: [
      CustomTimeLine(items: [
        const BuildTimelineTile(
            icon: Icons.account_box, text: "Registro", isActive: true),
        BuildTimelineTile(
            icon: Icons.create_new_folder_rounded,
            text: "Documentos",
            trailing: CustomButton(
                width: Get.width * 0.3,
                height: Get.height * 0.05,
                title: "Agregar",
                color: Globals.principalColor,
                onPressed: () {})),
        BuildTimelineTile(
            icon: Icons.local_shipping,
            text: "Registro camiones",
            trailing: CustomButton(
                width: Get.width * 0.3,
                height: Get.height * 0.05,
                title: "Agregar",
                color: Globals.principalColor,
                onPressed: () {})),
        BuildTimelineTile(
            icon: Icons.group,
            text: "Registro conductores",
            trailing: CustomButton(
                width: Get.width * 0.3,
                height: Get.height * 0.05,
                title: "Agregar",
                color: Globals.principalColor,
                onPressed: () {}))
      ]).paddingAll(5)
    ]);
  }

  Widget _customCardDataPersonal(BuildContext context) {
    return CustomCardButtonExpanded(
        contentPadding: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomText("Datos generales", style: titleMedium),
              SizedBox(
                  height: Get.height * 0.05,
                  width: Get.width * 0.12,
                  child: CustomIconButton(
                      onPressed: () =>
                          controller.isActive(!controller.isActive()),
                      backgroundColor: Globals.principalColor,
                      icon: Icons.edit,
                      size: 24))
            ]),
        children: [
          Obx(() => ReactiveForm(
              formGroup: controller.formGeneral(),
              child: Column(children: [
                CustomReactiveTextField(Keys.name,
                    labelText: "Nombre",
                    isActive: controller.isActive(),
                    keyboard: TextInputType.text),
                CustomReactiveTextField(Keys.email,
                    labelText: "Correo",
                    isActive: controller.isActive(),
                    keyboard: TextInputType.text),
                CustomReactiveTextField(Keys.phone,
                    labelText: "Teléfono",
                    isActive: controller.isActive(),
                    keyboard: TextInputType.phone),
                CustomReactiveTextField(Keys.user,
                    labelText: "Usuario",
                    isActive: controller.isActive(),
                    keyboard: TextInputType.text),
                CustomReactiveTextField(Keys.pass,
                    labelText: "Contraseña",
                    isActive: controller.isActive(),
                    isPass: true,
                    keyboard: TextInputType.text),
                Visibility(
                    visible: controller.isActive(),
                    child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                                title: "Guardar",
                                width: Get.width * 0.4,
                                height: Get.height * 0.05,
                                color: Colors.black,
                                onPressed: controller.isValid()
                                    ? () => controller.onFinishGeneralCard()
                                    : null))
                        .paddingOnly(top: 10, left: 10))
              ])))
        ]);
  }

  Widget _customCardDirection(BuildContext context) {
    return CustomCardButtonExpanded(
        contentPadding: 0,
        title: CustomText("Dirección", style: titleMedium),
        children: const []);
  }

  Widget _customCardDocuments(BuildContext context) {
    return CustomCardButtonExpanded(
        contentPadding: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomText("Documentos", style: titleMedium),
              SizedBox(width: Get.width * 0.04),
              SizedBox(
                  height: Get.height * 0.03,
                  child: const CircleAvatar(
                      backgroundColor: Globals.principalColor))
            ]),
        children: const []);
  }

  Widget _customContainerChart(BuildContext context) {
    return CustomContainer(
        backgroundColor: Colors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomText("Estadísticas",
                  style: titleLarge.apply(
                      color: Colors.white, fontSizeDelta: -4))),
          Column(children: [
            _customChart(context),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomText("Viajes realizados",
                    style: headlineLarge.apply(
                        color: Colors.white, fontSizeDelta: -6)))
          ]).paddingAll(10),
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  width: Get.width * 0.15,
                  height: Get.height * 0.07,
                  child: CustomIconButton(
                      backgroundColor: Globals.principalColor,
                      onPressed: () {},
                      icon: Icons.arrow_forward)))
        ]));
  }

  Future<bool> _customDialogMoreOptions() {
    return DialogUtils.dialog(
        align: Alignment.topCenter,
        child: ListView(shrinkWrap: true, children: [
          const CustomText("Mensajes",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.02),
          const CustomText("Notificaciones",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.02),
          const CustomText("Listas de guardados",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.02),
          const CustomText("Cuenta",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.05),
          const CustomText("Centro de ayuda",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.02),
          const CustomText("Privacidad y seguridad",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: Get.height * 0.02),
          const CustomText("Ajustes",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500))
        ]));
  }
//endregion
}
