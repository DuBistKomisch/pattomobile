using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EpisodesPanel : MonoBehaviour {
  public Transform episodePanelPrefab;
  public string[] episodeNames;

  private const int LEVEL_COUNT = 4;

  void Start() {
    // add episode panels
    Transform content = transform.Find("Viewport/Content");
    for (int episode = 0; episode < episodeNames.Length; episode++) {
      // unlock first level if locked and last episode beaten
      if (SaveGame.IsLevelLocked(episode, 0) &&
          (episode == 0 || SaveGame.IsLevelBeaten(episode - 1, LEVEL_COUNT - 1))) {
        SaveGame.UnlockLevel(episode, 0);
      }

      Transform episodePanel = MonoBehaviour.Instantiate(episodePanelPrefab, content);
      episodePanel.GetComponent<EpisodePanel>().episode = episode;
      episodePanel.GetComponent<EpisodePanel>().levelCount = LEVEL_COUNT;
      episodePanel.GetComponent<EpisodePanel>().episodeName = episodeNames[episode];
    }
  }
}
