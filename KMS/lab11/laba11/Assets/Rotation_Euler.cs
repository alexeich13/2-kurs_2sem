using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotation_Euler : MonoBehaviour {
	
	float angl;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		angl+=5.0f;
	    transform.eulerAngles=new Vector3(angl,0,angl);
	}
}
