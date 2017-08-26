using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LevelButton : MonoBehaviour {
  public int episode;
  public int level;

  private string LevelNumber {
    get {
      return (level + 1).ToString();
    }
  }

  void Start() {
    name = "Level " + LevelNumber + " Button";
    transform.Find("Text").GetComponent<Text>().text = LevelNumber;

    Button button = GetComponent<Button>();

    // disable if level locked
    if (SaveGame.IsLevelLocked(episode, level)) {
      button.interactable = false;
    }

    button.onClick.AddListener(LoadLevel);
  }

  void LoadLevel() {
    SceneManager.LoadScene("Level_" + episode + "_" + level);
  }
}
