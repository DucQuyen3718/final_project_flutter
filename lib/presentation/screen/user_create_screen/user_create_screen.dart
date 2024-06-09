import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:risky_coin/presentation/common/text_field_common.dart';
import 'package:risky_coin/presentation/screen/user_create_screen/bloc/user_create_bloc.dart';
import 'package:risky_coin/presentation/utils/color_utils.dart';
import 'package:risky_coin/presentation/utils/text_style_utils.dart';

@RoutePage()
class UserCreateScreen extends StatelessWidget {
  UserCreateScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCreateBloc()..add(UserCreateInitEvent()),
      child: BlocConsumer<UserCreateBloc, UserCreateState>(
        listener: (context, state) {
          if(state is UserCreateSuccess) {
            AutoRouter.of(context).maybePop(true);
          }
          if(state is UserCreateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if(state is UserCreateLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if(state is UserCreateLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Thêm mới nhân viên",
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _input("Tên", nameController),
                      const SizedBox(height: 16.0),
                      _input("Email", emailController),
                      const SizedBox(height: 16.0),
                      _input("Số điện thoại", phoneController),
                      const SizedBox(height: 16.0),
                      _input("Địa chỉ", addressController),
                      const SizedBox(height: 16.0),
                      _buttonAdd(context),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _input(String title, TextEditingController controller) {
    return TextFieldCommon(
      style: TextStyleUtils.textStyleNunitoS18W500Black,
      hintText: title,
      prefixIcon: const Icon(
        FontAwesomeIcons.receipt,
        color: ColorUtils.primaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorUtils.primaryColor),
      ),
      controller: controller,
    );
  }

  Widget _buttonAdd(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UserCreateBloc>().add(
          UserCreateAddEvent(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            address: addressController.text,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorUtils.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Thêm mới",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
