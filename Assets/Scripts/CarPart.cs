using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CarPart : MonoBehaviour {
  // bubble message up
  void OnTriggerEnter2D(Collider2D other) {
    transform.parent.GetComponent<Car>().OnTriggerEnter2D(other);
  }
}
