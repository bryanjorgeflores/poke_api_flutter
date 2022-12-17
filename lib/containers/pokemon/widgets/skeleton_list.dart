import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poke_test/domain/common/data/colors.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              right: -45,
              top: -45,
              child: Image.asset(
                'assets/images/logo.png',
                height: 240,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Ink(
              height: 120,
              decoration: BoxDecoration(
                color: PokemonColors.values
                    .elementAt(Random().nextInt(PokemonColors.values.length))
                    .color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 30,
                            ),
                          ),
                          SizedBox(height: 5),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 80,
                        width: 80,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (double kind in [0, 1])
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        width: (80 + kind),
                        padding: const EdgeInsets.only(right: 8),
                      ),
                    ),
                ],
              ),
            ),
            const Positioned(
              right: 10,
              top: 10,
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
