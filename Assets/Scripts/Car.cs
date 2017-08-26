using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Car : CarPart {
  public GameController gameController;
  public float damping;
  public float speed;
  public float maxSpeed;

  private WheelJoint2D leftWheel;
  private WheelJoint2D rightWheel;

  void Start() {
    leftWheel = transform.Find("LeftWheel").GetComponent<WheelJoint2D>();
    rightWheel = transform.Find("RightWheel").GetComponent<WheelJoint2D>();
  }

  void FixedUpdate() {
    JointMotor2D motor = leftWheel.motor;
    motor.motorSpeed = Math.Min(Math.Max(-maxSpeed, motor.motorSpeed * damping + Input.GetAxis("Horizontal") * speed), maxSpeed);
    leftWheel.motor = motor;
    rightWheel.motor = motor;
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
