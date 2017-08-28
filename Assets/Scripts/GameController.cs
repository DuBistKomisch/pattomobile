using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour {
  public int episode;
  public int level;
  public Rect bounds;

  private Car car;
  private Camera mainCamera;

  public void Start() {
    // speed up physics slightly
    Time.timeScale = 1.33333f;

    car = GameObject.FindWithTag("Player").GetComponent<Car>();
    mainCamera = GameObject.FindWithTag("MainCamera").GetComponent<Camera>();
  }

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

  void LateUpdate() {
    float halfHeight = mainCamera.orthographicSize;
    float halfWidth = halfHeight * mainCamera.aspect;

    Vector3 position = mainCamera.transform.position;
    position.x = Math.Min(Math.Max(bounds.xMin + halfWidth, car.Position.x), bounds.xMax - halfWidth);
    position.y = Math.Min(Math.Max(bounds.yMin + halfHeight, car.Position.y), bounds.yMax - halfHeight);
    mainCamera.transform.position = position;
  }
}
