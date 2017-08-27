using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Car : CarPart {
  public GameController gameController;
  public float speed;
  public float maxSpeed;

  private Rigidbody2D leftWheel;
  private Rigidbody2D rightWheel;

  void Start() {
    leftWheel = transform.Find("LeftWheel").GetComponent<Rigidbody2D>();
    rightWheel = transform.Find("RightWheel").GetComponent<Rigidbody2D>();

    // since the wheels and axle are joined via bearings, we need to ignore collisions manually
    Transform axle = transform.Find("Axle");
    Physics2D.IgnoreCollision(leftWheel.GetComponent<CircleCollider2D>(), axle.GetComponent<BoxCollider2D>());
    Physics2D.IgnoreCollision(rightWheel.GetComponent<CircleCollider2D>(), axle.GetComponent<BoxCollider2D>());
  }

  void FixedUpdate() {
    float torque = -1.0f * Input.GetAxis("Horizontal") * speed;
    if (Math.Abs(leftWheel.angularVelocity) < maxSpeed || Math.Sign(leftWheel.angularVelocity) != Math.Sign(torque)) {
      leftWheel.AddTorque(torque);
    }
    if (Math.Abs(rightWheel.angularVelocity) < maxSpeed || Math.Sign(rightWheel.angularVelocity) != Math.Sign(torque)) {
      rightWheel.AddTorque(torque);
    }
  }

  public void OnTriggerEnter2D(Collider2D other) {
    if (other.gameObject.CompareTag("Kill")) {
      gameController.RestartLevel();
    }
    if (other.gameObject.CompareTag("Finish")) {
      gameController.FinishLevel();
    }
  }
}
