using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SaveGame {
  public enum LevelState {
    Locked,
    Unlocked,
    Beaten
  }

  public static LevelState GetLevelState(int episode, int level) {
    return (LevelState)PlayerPrefs.GetInt("level_" + episode + "_" + level, 0);
  }

  public static bool IsLevelLocked(int episode, int level) {
    return GetLevelState(episode, level) == LevelState.Locked;
  }

  public static bool IsLevelBeaten(int episode, int level) {
    return GetLevelState(episode, level) == LevelState.Beaten;
  }

  public static void SetLevelState(int episode, int level, LevelState levelState) {
    PlayerPrefs.SetInt("level_" + episode + "_" + level, (int)levelState);
    PlayerPrefs.Save();
  }

  public static void UnlockLevel(int episode, int level) {
    SetLevelState(episode, level, LevelState.Unlocked);
  }

  public static void BeatLevel(int episode, int level) {
    SetLevelState(episode, level, LevelState.Beaten);
  }
}
