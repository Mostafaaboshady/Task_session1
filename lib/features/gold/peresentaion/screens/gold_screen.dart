import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/core/constants/app_colors.dart';
import 'package:goldex/core/constants/app_images.dart';
import 'package:goldex/features/gold/data/repo/gold_repo.dart' show GoldRepo;
import 'package:goldex/features/gold/peresentaion/cubit/gold_cubit.dart'
    show GoldCubit;
import 'package:goldex/features/gold/peresentaion/cubit/gold_states.dart';
import 'package:goldex/features/gold/peresentaion/screens/widgets/custom_widget_screen.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(goldRepo: GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Gold',
            style: TextStyle(
              color: AppColors.goldColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<GoldCubit, GoldStates>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.goldColor),
              );
            }

            if (state is GoldErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.redAccent,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.error,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldColor,
                      ),
                      onPressed: () {
                        context.read<GoldCubit>().getGold();
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (state is GoldSuccessState) {
              final gold = state.goldModel;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Logo
                    Image.asset(AppImages.GOLD, height: 110),

                    const SizedBox(height: 40),

                    /// Gold Card
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1A1404), Color(0xFF2C2108)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.goldColor.withOpacity(0.5),
                            blurRadius: 25,
                            spreadRadius: 2,
                          ),
                          const BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.goldColor.withOpacity(0.3),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Current Gold Price",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                gold.price!.toStringAsFixed(2),
                                style: const TextStyle(
                                  color: AppColors.goldColor,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                gold.symbol!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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

            return const SizedBox();
          },
        ),
      ),
    );
  }

  GoldPriceWidget({
    required String imagePath,
    required String price,
    required currency,
    required Color color,
  }) {
    return CustomPriceWidget(
      imagePath: imagePath,
      price: price,
      currency: currency,
      color: color,
    );
  }
}
