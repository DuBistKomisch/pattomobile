using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EpisodePanel : MonoBehaviour {
  public Transform levelButtonPrefab;
  public int episode;
  public int levelCount;
  public string episodeName;

  private string EpisodeNumber {
    get {
      return (episode + 1).ToString();
    }
  }

  void Start() {
    name = "Episode " + EpisodeNumber + " Panel";

    // disable if episode locked
    Text episodeTitle = transform.Find("Title").GetComponent<Text>();
    episodeTitle.text = "Episode " + EpisodeNumber + " - ";
    if (SaveGame.IsLevelLocked(episode, 0)) {
      episodeTitle.text += "Locked";
      Color color = episodeTitle.color;
      color.a = 0.5f;
      episodeTitle.color = color;
    } else {
      episodeTitle.text += episodeName;
    }

    // add level buttons
    Transform levels = transform.Find("Levels");
    for (int level = 0; level < levelCount; level++) {
      // unlock level if locked and last level beaten
      if (SaveGame.IsLevelLocked(episode, level) &&
          level > 0 && SaveGame.IsLevelBeaten(episode, level - 1)) {
        SaveGame.UnlockLevel(episode, level);
      }

      Transform levelButton = MonoBehaviour.Instantiate(levelButtonPrefab, levels);
      levelButton.GetComponent<LevelButton>().episode = episode;
      levelButton.GetComponent<LevelButton>().level = level;
    }
  }
}
