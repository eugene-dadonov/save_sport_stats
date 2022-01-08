// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
// import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
// import 'package:sport_stats_live/features/screen_match/presentation_new/page/match_page.dart';
// import 'package:sport_stats_live/features/screen_match_list/presentation/ui/view/empty_match_list_view.dart';
// import 'package:sport_stats_live/features/screen_match_list/presentation/ui/view/match_list_view.dart';
//
// import '../screen_matches.dart';
//
// class MatchListPage extends StatefulWidget {
//   const MatchListPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MatchListPage> createState() => _MatchListPageState();
//
//   static Route route(MatchBloc matchBloc) {
//     return MaterialPageRoute<void>(
//       builder: (_) => BlocProvider.value(
//         value: matchBloc,
//         /// Если что, то поменяно тут:
//         child: const ScreenMatches(),
//       ),
//     );
//   }
//
//   static Widget view(MatchBloc matchBloc) {
//     return BlocProvider.value(
//       value: matchBloc,
//       // child: const MatchListPage(),
//       /// Если что, то поменяно тут:
//       child: const ScreenMatches(),
//     );
//   }
// }
//
//
// class _MatchListPageState extends State<MatchListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ThemeHolder.of(context).background1,
//       body: BlocProvider(
//         create: (BuildContext context) => MatchListBloc(
//           matchRepository: context.read<MatchRepositoryImpl>(),
//           matchBloc: context.read<MatchBloc>(),
//         )..add(OnInitialization()),
//         child: BlocConsumer<MatchListBloc, MatchListState>(
//           listenWhen: (oldState, newState) => newState is OpenMatch,
//           listener: (context, state) {
//             if (state is OpenMatch) {
//               Navigator.push(
//                 context,
//                 MatchRedesignedPage.route(
//                   matchBloc: BlocProvider.of<MatchBloc>(context),
//                   matchId: state.matchId,
//                 ),
//               );
//             }
//           },
//           buildWhen: (oldState, newState) {
//             return newState is Data ||
//                 newState is EmptyList ||
//                 newState is Error;
//           },
//           builder: (BuildContext context, MatchListState state) {
//             if (state is Data) {
//               return MatchListView(matches: state.matches);
//             } else if (state is EmptyList) {
//               return const EmptyMatchesListView();
//             } else if (state is Loading) {
//               return Container(color: ThemeHolder.of(context).background1);
//             } else {
//               return Container(color: ThemeHolder.of(context).warning);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
