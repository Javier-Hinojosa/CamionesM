import 'package:camionesm/app/pages/login/login.controller.dart';
import 'package:camionesm/app/widgets/buttons/button.widget.dart';
import 'package:camionesm/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:camionesm/app/widgets/text.widget.dart';
import 'package:camionesm/core/values/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Container(padding: const EdgeInsets.all(50)),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText("Inicia Sesión", style: titleLarge))),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 20, bottom: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        "Ingresa los datos requeridos para inciar sesión",
                        style: titleMedium))),
            Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ReactiveForm(
                    formGroup: controller.loginForm(),
                    child: Column(children: [
                      CustomReactiveTextField("user",
                          minLength: LoginController.emailQuantityMinLength,
                          labelText: "Usuario",
                          hintText: "Introduce usuario o correo electrónico",
                          keyboard: TextInputType.emailAddress),
                      Obx(
                        () => CustomReactiveTextField("password",
                            minLength: LoginController.passQuantityMinLength,
                            iconSuffix: controller.isPasswordVisible()
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIconTap: () =>
                                controller.changePasswordVisibility(),
                            labelText: "Contraseña",
                            hintText: "Introduce tu contraseña",
                            keyboard: TextInputType.text,
                            isPass: !controller.isPasswordVisible(),
                            onSubmitted: (resp) => controller.onLogin()),
                      )
                    ]))),
            Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 10, right: 10, left: 10),
                child: CustomButton(
                    title: "Entrar", onPressed: () => controller.onLogin())),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText("¿Olvidaste tu contraseña? ", style: bodyMedium),
                  CustomText("Recuperar",
                      style: bodyMedium.apply(
                          fontWeightDelta: FontWeight.bold.value))
                ]),
            const Padding(
                padding: EdgeInsets.all(10),
                child: Divider(
                  height: 2,
                  thickness: 1,
                )),
            Align(
                alignment: Alignment.center,
                child: CustomText("Aun no tienes cuenta, crea una",
                    style: bodySmall)),
            Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, top: 20, right: 10, left: 10),
                child: CustomButton(
                    title: "Crear cuenta",
                    backgroundColor: Colors.black,
                    onPressed: () => controller.onSingUp())),
          ]),
    );
  }
}
