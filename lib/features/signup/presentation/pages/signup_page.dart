// ignore_for_file: prefer_const_constructors
part of '../../signup.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _userNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    String isNameValid = "";
    String isUserNameValid = "";
    String isEmailValid = "";
    List<String> resultPassword = [];
    bool isLoading = false;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Register and Happy Shopping",
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_name.png",
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validateNameInput(value);
                      },
                      controller: _nameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Full Name",
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
            BlocBuilder<ValidatorCubit, ValidatorState>(
                builder: (context, state) {
              if (state is NameIsEmpty) {
                isNameValid = state.message!;
                return Visibility(
                  visible: isNameValid.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 15,
                    child: Text(
                      isNameValid,
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

    Widget userNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_username.png",
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validateUserNameInput(value);
                      },
                      controller: _userNameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
                          hintStyle: subtitleTextStyle),
                    ))
                  ],
                ),
              ),
            ),
            BlocBuilder<ValidatorCubit, ValidatorState>(
                builder: (context, state) {
              if (state is UserNameIsEmpty) {
                isUserNameValid = state.message!;
                return Visibility(
                  visible: isUserNameValid.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 15,
                    child: Text(
                      isUserNameValid,
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validateEmail(value);
                      },
                      controller: _emailController,
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
                isEmailValid = state.message!;
                return Visibility(
                  visible: isEmailValid.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 15,
                    child: Text(
                      isEmailValid,
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
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ValidatorCubit>(context)
                            .validatePassword(value);
                      },
                      controller: _passwordController,
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
                resultPassword = state.result!;
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
            isNameValid = "";
            isEmailValid = "";
            isUserNameValid = "";
            resultPassword = [];
          } else if (state is IsEmailValid) {
            isEmailValid = state.message!;
          } else if (state is NameIsEmpty) {
            isNameValid = state.message!;
          } else if (state is UserNameIsEmpty) {
            isUserNameValid = state.message!;
          } else if (state is IsPasswordValid) {
            resultPassword = state.result!;
          } else {
            isNameValid = "";
            isEmailValid = "";
            isUserNameValid = "";
            resultPassword = [];
          }
          return Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: (resultPassword.isEmpty &&
                          isEmailValid.isEmpty &&
                          isUserNameValid.isEmpty &&
                          isNameValid.isEmpty &&
                          (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty &&
                              _nameController.text.isNotEmpty &&
                              _userNameController.text.isNotEmpty))
                      ? primaryColor
                      : secondaryTextColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: (resultPassword.isEmpty &&
                      isEmailValid.isEmpty &&
                      isUserNameValid.isEmpty &&
                      isNameValid.isEmpty &&
                      (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _nameController.text.isNotEmpty &&
                          _userNameController.text.isNotEmpty))
                  ? () {
                      BlocProvider.of<SignupCubit>(context).signUpUser(
                        name: _nameController.text,
                        email: _emailController.text,
                        userName: _userNameController.text,
                        password: _passwordController.text,
                      );
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
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<RouterCubit>(context).onSignInPage();
              },
              child: Text(
                "Sign in",
                style:
                    purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    void handleError(String error) {
      isLoading = false;
      Future.microtask(() => sl<ToastHelper>().toastError(context, error));
    }

    void handleSuccess() {
      isLoading = false;
      Future.microtask(() => sl<ToastHelper>()
          .toastSuccess(context, ConstantHelper.REGISTRASI_SUCCESS));
      Future.delayed(Duration(seconds: 2), () {
        BlocProvider.of<RouterCubit>(context).onSignInPage();
      });
    }

    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<RouterCubit>(context).onSignInPage();
        return Future.value(false);
      },
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          if (state is OnSignupLoading) {
            isLoading = true;
          } else if (state is OnSignupSuccess) {
            handleSuccess();
          } else if (state is OnSignupError) {
            handleError((state.errorMessage as ServerFailures).errorMessage!);
          }
          return ModalProgressHUD(
            inAsyncCall: isLoading,
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
                        nameInput(),
                        userNameInput(),
                        emailInput(),
                        passwordInput(),
                        signInButton(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: footer(),
            ),
          );
        },
      ),
    );
  }
}
