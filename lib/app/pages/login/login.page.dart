import 'package:camionesm/app/widgets/button.widget.dart';
import 'package:camionesm/app/widgets/reactive_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const int emailQuantityMinLength = 5;
  static const int passQuantityMinLength = 4;


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isPasswordVisible = false;
  late var loginForm=FormGroup({});

  @override
  void initState() {
    super.initState();
    loginForm=FormGroup({
      'user': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(LoginPage.emailQuantityMinLength)
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(LoginPage.passQuantityMinLength)
      ]),
    }, validators: [
      Validators.required
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Container(padding:const EdgeInsets.all(50)),
            Padding(padding: const EdgeInsets.only(left: 10), child: Align(alignment: Alignment.centerLeft, child: _labelText("Inicia Sesión", style: Theme.of(context).textTheme.titleLarge))),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 60,top: 20,bottom: 20),
          child: Align(
              alignment: Alignment.centerLeft, child: _labelText("Ingresa los datos requeridos para inciar sesión", style: Theme.of(context).textTheme.titleMedium)
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child: ReactiveForm(
              formGroup: loginForm,
              child: Column(children: [
                CustomReactiveTextField("user",
                    minLength: LoginPage.emailQuantityMinLength,
                    labelText: "Usuario",
                    hintText: "Introduce usuario o correo electrónico",
                    keyboard: TextInputType.emailAddress),
                CustomReactiveTextField("password",
                    minLength: LoginPage.passQuantityMinLength,
                    iconSuffix: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onSuffixIconTap: () => _changePasswordVisibility(),
                    labelText: "Contraseña",
                    hintText: "Introduce tu contraseña",
                    keyboard: TextInputType.text,
                    isPass: !isPasswordVisible,
                    onSubmitted: (resp) => {})
              ])),
        ),
            Padding(
                padding: const EdgeInsets.only(bottom: 20,top: 10,right: 10,left: 10),
                child: CustomButton(title:"Entrar",onPressed:() {})),
            Row(
              mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_labelText("¿Olvidaste tu contraseña? ", style: Theme.of(context).textTheme.bodyMedium), _labelText("Recuperar", style: Theme.of(context).textTheme.bodyMedium!.apply(fontWeightDelta: FontWeight.bold.value))]),
            const Padding(padding: EdgeInsets.all(10), child: Divider(height: 2,thickness: 1,)),
            Align(alignment: Alignment.center, child: _labelText("Aun no tienes cuenta, crea una", style: Theme.of(context).textTheme.bodySmall)),
            Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 20,right: 10,left: 10),
                child: CustomButton(title: "Crear cuenta",color: Colors.black,onPressed:  () {})),
      ]),
    );
  }

  //#region Functions
  _changePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
  //endregion

//#region Widgets
  Widget _labelText(String title, {TextStyle? style}) {
    return Text(title,
        style: style, maxLines: 2, overflow: TextOverflow.ellipsis);
  }

  //endregion
}
