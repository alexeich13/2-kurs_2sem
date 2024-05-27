using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotation_Quaternion : MonoBehaviour {

	Quaternion orig;
    float angl;
	float andl2;

	// Use this for initialization
	void Start () {
		orig = transform.rotation;
	}
	
	// Update is called once per frame
	void Update () {
		angl += 5.0f;
		andl2 += 5.0f;
        Quaternion rotX = Quaternion.AngleAxis(angl, Vector3.right);
		Quaternion rotZ = Quaternion.AngleAxis(andl2, Vector3.forward);
		transform.rotation = orig * rotX * rotZ; 
	}
}
