﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scriptscale : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		transform.localScale += new Vector3(0.1f, 0.0f, 0.0f);
	}
}
