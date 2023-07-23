import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/custom_text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.customSwatchColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                    ),

                    //Formulary
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //USERNAME
                          CustomTextFieldWidget(
                            label: 'Nome de Usuário',
                            icon: Icons.person,
                            isSecret: false,
                            controller: _userNameController,
                            hintText: 'Ex: João123',
                          ),

                          //FULLNAME
                          CustomTextFieldWidget(
                            label: 'Nome Completo',
                            icon: Icons.person,
                            isSecret: false,
                            controller: _fullNameController,
                            hintText: 'Ex: João Silva',
                          ),

                          //EMAIL
                          CustomTextFieldWidget(
                            label: 'Email',
                            icon: Icons.email_rounded,
                            isSecret: false,
                            controller: _emailController,
                            hintText: 'Ex: joão@email.com',
                          ),

                          //PASSWORD
                          CustomTextFieldWidget(
                            label: 'Senha',
                            icon: Icons.lock,
                            isSecret: true,
                            controller: _passwordController,
                            hintText: 'Ex: João@123',
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
                          ),

                          //CPF
                          CustomTextFieldWidget(
                            label: 'CPF',
                            icon: Icons.file_copy,
                            isSecret: false,
                            controller: _cpfController,
                            hintText: 'Ex: 999.999.999-99',
                            formatter: MaskedInputFormatter('###.###.###-##'),
                            maxLength: 14,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: false,
                              signed: false,
                            ),
                          ),

                          //SIGNUP
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder?>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Cadastrar Usuário",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
