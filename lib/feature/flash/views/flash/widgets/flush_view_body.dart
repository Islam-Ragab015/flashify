import 'package:flashy/feature/flash/views/flash/widgets/build_item_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/images_manager.dart';
import '../../../manage/flash_cubit.dart';

class FlashViewBody extends StatelessWidget {
  const FlashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlashCubit(),
      child: BlocBuilder<FlashCubit, bool>(
        builder: (context, isTorchOn) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 532,
                child: isTorchOn
                    ? Image.asset(
                        ImagesManager.lightPiece,
                        width: 360,
                      )
                    : const SizedBox(
                        height: 10,
                      ),
              ),
              const BuildItemPositioned(
                positioned: 488,
                width: 227,
                image: ImagesManager.topPiece,
              ),
              const BuildItemPositioned(
                positioned: 510,
                width: 197,
                image: ImagesManager.line,
              ),
              const BuildItemPositioned(
                positioned: 439,
                width: 217,
                image: ImagesManager.secondTopPiece,
              ),
              const BuildItemPositioned(
                positioned: 461,
                width: 197,
                image: ImagesManager.line,
              ),
              const BuildItemPositioned(
                positioned: 364,
                width: 227,
                image: ImagesManager.bodyOnePiece,
              ),
              const BuildItemPositioned(
                positioned: 325,
                width: 227,
                image: ImagesManager.bodyTopPiece,
              ),
              const BuildItemPositioned(
                positioned: 25,
                width: 170,
                image: ImagesManager.bodyMainPiece,
              ),
              Positioned(
                bottom: 140,
                child: GestureDetector(
                  onTap: () {
                    context.read<FlashCubit>().toggleTorch();
                  },
                  child: Image.asset(
                    isTorchOn ? ImagesManager.flashOn : ImagesManager.flashOff,
                    width: 60,
                  ),
                ),
              ),
              const BuildItemPositioned(
                positioned: 70,
                width: 60,
                image: ImagesManager.logoPiece,
              ),
              const BuildItemPositioned(
                positioned: 20,
                width: 160,
                image: ImagesManager.line,
              ),
              const BuildItemPositioned(
                positioned: 0,
                width: 170,
                image: ImagesManager.bodyBottomPiece,
              ),
            ],
          );
        },
      ),
    );
  }
}
