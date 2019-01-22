import 'package:flute_music_player/flute_music_player.dart';
import 'dart:math';
import './PlayerStateEnum.dart';
class SongData {
  List<Song> _songs;
  int _currentSongIndex = -1;
  PlayerState playerState= PlayerState.stopped;
  MusicFinder musicFinder;
  SongData(this._songs) {
    musicFinder = new MusicFinder();
  }

  List<Song> get songs => _songs;
  int get length => _songs.length;
  int get songNumber => _currentSongIndex + 1;

  setCurrentIndex(int index) {
    _currentSongIndex = index;
  }

  int get currentIndex => _currentSongIndex;

  Song get nextSong {
    if (_currentSongIndex < length) {
      _currentSongIndex++;
    }
    if (_currentSongIndex >= length) return null;
    return _songs[_currentSongIndex];
  }

  Song get randomSong {
    Random r = new Random();
    return _songs[r.nextInt(_songs.length)];
  }

  Map get randomSongMap {
    Random r = new Random();
    var index = r.nextInt(_songs.length);
    return {"song":_songs[index],"index":index };
  }

  Song get prevSong {
    if (_currentSongIndex > 0) {
      _currentSongIndex--;
    }
    if (_currentSongIndex < 0) return null;
    return _songs[_currentSongIndex];
  }

  MusicFinder get audioPlayer => musicFinder;
}
