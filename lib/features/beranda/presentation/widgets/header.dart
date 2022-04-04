part of '../../beranda.dart';

class HeaderBeranda extends StatelessWidget {
  const HeaderBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileOnProcess) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: secondaryTextColor,
                        highlightColor: Colors.grey[300]!,
                        period: const Duration(seconds: 2),
                        child: Container(
                          width: 128,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Colors.grey[400]!,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: secondaryTextColor,
                        highlightColor: Colors.grey[300]!,
                        period: const Duration(seconds: 2),
                        child: Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 92,
                          height: 24,
                          decoration: BoxDecoration(
                              color: Colors.grey[400]!,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      )
                    ],
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: secondaryTextColor,
                  highlightColor: Colors.grey[300]!,
                  period: const Duration(seconds: 2),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.grey[400]!,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            );
          } else if (state is ProfileSuccess) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.userModel.name!,
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        state.userModel.email!,
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).userLogout(context);
                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: state.userModel.profilePhotoUrl!,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: secondaryTextColor,
                          highlightColor: Colors.grey[300]!,
                          period: const Duration(seconds: 2),
                          child: Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.grey[400]!,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
