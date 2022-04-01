// ignore_for_file: unused_local_variable

part of '../../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool? isLoadingProcess = false;
    bool? isLoginError = false;
    bool? isLoginSuccess = false;
    bool isEmailValid = true;
    String emailValidationMessage = "";
    bool isPasswordValid = true;
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    List<String> resultPassword = [];
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Sign In to Continue",
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_email.png",
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validateEmail(value);
                      },
                      controller: _email,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
            BlocBuilder<ValidatorCubit, ValidatorState>(
                builder: (context, state) {
              if (state is IsEmailValid) {
                emailValidationMessage = state.message!;

                return Visibility(
                  visible: emailValidationMessage.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 15,
                    child: Text(
                      emailValidationMessage,
                      style: priceTextStyle.copyWith(
                        color: secondaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_password.png",
                      width: 17,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validatePassword(value);
                      },
                      controller: _password,
                      style: primaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
            BlocBuilder<ValidatorCubit, ValidatorState>(
                builder: (context, state) {
              if (state is IsPasswordValid) {
                return Visibility(
                  visible: resultPassword.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 15,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: resultPassword.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Text(
                              resultPassword[index],
                              style: priceTextStyle.copyWith(
                                color: secondaryColor,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      );
    }

    Widget signInButton() {
      return BlocBuilder<ValidatorCubit, ValidatorState>(
        builder: (context, state) {
          if (state is ValidatorInitial) {
            emailValidationMessage = "";
            resultPassword = [];
          } else if (state is IsEmailValid) {
            emailValidationMessage = state.message!;
            resultPassword = [];
          } else if (state is IsPasswordValid) {
            resultPassword = state.result!;
          } else {
            emailValidationMessage = "";
            resultPassword = [];
          }
          return Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: (resultPassword.isEmpty &&
                          emailValidationMessage.isEmpty &&
                          (_email.text.isNotEmpty && _password.text.isNotEmpty))
                      ? primaryColor
                      : secondaryTextColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: (resultPassword.isEmpty &&
                      emailValidationMessage.isEmpty &&
                      (_email.text.isNotEmpty && _password.text.isNotEmpty))
                  ? () {
                      BlocProvider.of<LoginCubit>(context)
                          .loginUser(_email.text, _password.text);
                    }
                  : () {},
              child: Text(
                "Sign In",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          );
        },
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don 't have an account? ",
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<RouterCubit>(context).onSignUpPage();
              },
              child: Text(
                "Sign up",
                style:
                    purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    void handleError(String error) {
      isLoadingProcess = false;
      isLoginError = true;
      Future.microtask(() => sl<ToastHelper>().toastError(context, error));
    }

    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginOnProcess) {
        isLoadingProcess = true;
      } else if (state is LoginError) {
        handleError((state.errorMessage as ServerFailures).errorMessage!);
      } else if (state is LoginSuccess) {
        isLoadingProcess = false;
        isLoginSuccess = true;
        BlocProvider.of<RouterCubit>(context).onHomePage();
      }

      return ModalProgressHUD(
        inAsyncCall: isLoadingProcess!,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor1,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  header(),
                  emailInput(),
                  passwordInput(),
                  signInButton(),
                ],
              )),
            ),
          ),
          bottomNavigationBar: footer(),
        ),
      );
    });
  }
}
