import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:risky_coin/domain/entity/user_entity.dart';
import 'package:risky_coin/presentation/common/text_field_common.dart';
import 'package:risky_coin/presentation/screen/user_detail_screen/bloc/user_detail_bloc.dart';
import 'package:risky_coin/presentation/utils/color_utils.dart';
import 'package:risky_coin/presentation/utils/text_style_utils.dart';

@RoutePage()
class UserDetailScreen extends StatelessWidget {
  UserDetailScreen({super.key, required this.id});
  final String id;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailBloc()..add(UserDetailInitEvent(id: id)),
      child: BlocConsumer<UserDetailBloc, UserDetailState>(
        listener: (context, state) {
          if(state is UserDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if(state is UserDetailDeleted) {
            AutoRouter.of(context).maybePop(true);
          }
          if(state is UserDetailUpdated) {
            AutoRouter.of(context).maybePop(true);
          }
          if(state is UserDetailLoaded) {
            nameController.text = state.userEntity.name;
            emailController.text = state.userEntity.email;
            phoneController.text = state.userEntity.phone;
            addressController.text = state.userEntity.address;
          }
        },
        builder: (context, state) {
          if(state is UserDetailLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if(state is UserDetailLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Chi tiết nhân viên",
                  style: TextStyle(
                    fontSize: 28,
                    color: ColorUtils.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _item("Tên", nameController),
                        const SizedBox(height: 16.0),
                        _item("Email", emailController),
                        const SizedBox(height: 16.0),
                        _item("Số điện thoại", phoneController),
                        const SizedBox(height: 16.0),
                        _item("Địa chỉ", addressController),
                        const SizedBox(height: 32.0),
                        _button(context),
                      ],
                    ),
                  )
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _item(String title, TextEditingController controller) {
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

  Widget _button(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            context.read<UserDetailBloc>().add(
              UserDetailUpdateEvent(
                userEntity: UserEntity(
                  id: id,
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  address: addressController.text,
                ),
              ),
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
              color: ColorUtils.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              border: Border.all(color: Colors.red, width: 4),
            ),
            child: Text(
              "Sửa",
              style: TextStyleUtils.textStyleNunitoS20W600White,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        InkWell(
          onTap: () {
            print(("TrungLQ: " + id));
            context.read<UserDetailBloc>().add(UserDetailDeleteEvent(id: id));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            decoration: BoxDecoration(
              color: ColorUtils.red,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
              border: Border.all(color: Colors.red, width: 4),
            ),
            child: Text(
              "Xóa",
              style: TextStyleUtils.textStyleNunitoS20W600White,
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
