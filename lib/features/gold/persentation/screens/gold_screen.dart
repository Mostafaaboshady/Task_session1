import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/core/constants/app_images.dart';
import 'package:goldex/features/gold/data/repo/goldrepo.dart';
import 'package:goldex/features/gold/persentation/cubit/gold_cubit.dart';
import 'package:goldex/features/gold/persentation/cubit/gold_state.dart';
import 'package:goldex/features/gold/persentation/screens/widgets/customtext.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(Goldrepo())..getGold(),
      child: Scaffold(
        backgroundColor: const Color(0xFF0E0B03),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E0B03),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Gold Tracker',
            style: TextStyle(
              color: Color(0xFFEEC430),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            /// 🔄 Loading
            if (state is GoldLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFEEC430)),
              );
            }

            /// ❌ Error
            if (state is GoldError) {
              return Center(
                child: Text(
                  state.mserror,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }

            /// ✅ Success
            if (state is GoldSuccess) {
              final gold = state.goldmodel;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Logo
                    Image.asset(AppImages.logo, height: 120),

                    const SizedBox(height: 40),

                    /// Gold Price Card
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1606),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFEEC430).withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Current Gold Price',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Customtext(
                                text: gold.price.toString(),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFEEC430),
                              ),
                              const SizedBox(width: 8),
                              Customtext(
                                text: gold.currency,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            /// الحالة الابتدائية
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
