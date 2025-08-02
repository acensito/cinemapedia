

import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
    final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final step2 = ref.watch(popularMoviesProvider).isEmpty;
    final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
    final step4 = ref.watch(upcomingMoviesProvider).isEmpty;
    
    // If any of the steps is still loading, we return true
    // indicating that the initial loading is not yet complete.
    if (step1 || step2 || step3 || step4) return true;

    return false; // Default value, can be changed based on your logic.
});