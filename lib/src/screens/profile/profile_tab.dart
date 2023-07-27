import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/shared/data/app_data.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/custom_elevated_button_widget.dart';
import 'package:greengrocer/src/shared/widgets/custom_text_field_widget.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final UserModel _user = AppData().user;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _oldPasswordConfirmController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  bool isNotEqual = false;
  bool isNotComplete1 = false;
  bool isNotComplete2 = false;
  bool isNotComplete3 = false;

  @override
  void initState() {
    _emailController.value = TextEditingValue(text: _user.email);
    _fullNameController.value = TextEditingValue(text: _user.fullName);
    _phoneNumberController.value = TextEditingValue(text: _user.phoneNumber);
    _cpfController.value = TextEditingValue(text: _user.cpf);
    _userNameController.value = TextEditingValue(text: _user.userName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil do Usuário',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.customContrastColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //USERNAME
          CustomTextFieldWidget(
            label: 'Nome de Usuário',
            icon: Icons.person,
            isSecret: false,
            controller: _userNameController,
            hintText: 'Ex: João123',
            isReadOnly: true,
          ),

          //FULLNAME
          CustomTextFieldWidget(
            label: 'Nome Completo',
            icon: Icons.person,
            isSecret: false,
            controller: _fullNameController,
            hintText: 'Ex: João Silva',
            isReadOnly: true,
          ),

          //EMAIL
          CustomTextFieldWidget(
            label: 'Email',
            icon: Icons.email_rounded,
            isSecret: false,
            controller: _emailController,
            hintText: 'Ex: joão@email.com',
            isReadOnly: true,
          ),

          //PHONE NUMBER
          CustomTextFieldWidget(
            label: 'Celular',
            icon: Icons.phone,
            isSecret: false,
            controller: _phoneNumberController,
            hintText: 'Ex: (99) 99999-9999',
            formatter: PhoneInputFormatter(
              defaultCountryCode: 'BR',
            ),
            maxLength: 15,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            isReadOnly: true,
          ),

          //CPF
          CustomTextFieldWidget(
            label: 'CPF',
            icon: Icons.file_copy,
            isSecret: true,
            controller: _cpfController,
            hintText: 'Ex: 999.999.999-99',
            formatter: MaskedInputFormatter('###.###.###-##'),
            maxLength: 14,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            isReadOnly: true,
          ),

          //BUTTON FOR UPDATE PASSWORD
          CustomElevatedButtonWidget(
            height: 50,
            backgroundColor: Colors.green,
            title: 'Atualizar Senha',
            hasIcon: true,
            onPressed: () {
              updatePassword(setStateFunction: () {
                setState(() {});
              });
            },
            width: double.infinity,
            iconData: Icons.password_rounded,
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword({required VoidCallback setStateFunction}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //TITLE
              Text(
                'Atualização da Senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //OLD PASSWORD
              CustomTextFieldWidget(
                label: 'Senha Atual',
                icon: Icons.lock_rounded,
                isSecret: true,
                controller: _oldPasswordController,
                hintText: '',
                hasErrorController: true,
                hasError: isNotComplete1,
                errorMessage: 'Não pode estar vazio',
              ),

              //CONFIRMER OLD PASSWORD
              CustomTextFieldWidget(
                label: 'Repita a Senha Atual',
                icon: Icons.lock_outline_rounded,
                isSecret: true,
                controller: _oldPasswordConfirmController,
                hintText: '',
                hasErrorController: true,
                hasError: isNotComplete2,
                errorMessage: 'Não pode estar vazio',
              ),

              //NEW PASSWORD
              CustomTextFieldWidget(
                label: 'Nova Senha',
                icon: Icons.lock_outline_rounded,
                isSecret: true,
                controller: _newPasswordController,
                hintText: '',
                hasErrorController: true,
                hasError: isNotComplete3,
                errorMessage: 'Não pode estar vazio',
              ),

              //BUTTON FOR UPDATE PASSWORD
              CustomElevatedButtonWidget(
                height: 50,
                backgroundColor: Colors.green,
                title: 'Atualizar',
                hasIcon: true,
                onPressed: () {},
                width: double.infinity,
                iconData: Icons.password_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
