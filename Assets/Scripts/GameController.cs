using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour {
  public int episode;
  public int level;

  public void RestartLevel() {
    SceneManager.LoadScene("Level_" + episode + "_" + level);
  }

  public void FinishLevel() {
    SaveGame.BeatLevel(episode, level);
    LeaveLevel();
  }

  public void LeaveLevel() {
    SceneManager.LoadScene("Menu");
  }

  public void FixedUpdate() {
    if (Input.GetKeyDown(KeyCode.R)) {
      RestartLevel();
    }
    if (Input.GetKeyDown(KeyCode.Escape)) {
      LeaveLevel();
    }
  }
}
