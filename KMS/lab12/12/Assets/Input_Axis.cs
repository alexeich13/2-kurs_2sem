using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Input_Axis : MonoBehaviour {

	public float MoveSpeed = 5f;
    public float LookSensitivity = 3f;

    private float _xRotation;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		var horizontal = Input.GetAxis("Horizontal");
        var vertical = Input.GetAxis("Vertical");
        var mouseX = Input.GetAxis("Mouse X");
        var mouseY = Input.GetAxis("Mouse Y");

        var moveDirection = new Vector3(horizontal, 0, vertical);
        transform.Translate(moveDirection.normalized * MoveSpeed * Time.deltaTime);

        transform.Rotate(0, mouseX * LookSensitivity, 0);

        _xRotation -= mouseY * LookSensitivity;
        _xRotation = Mathf.Clamp(_xRotation, 0, 90);
        transform.localRotation = Quaternion.Euler(_xRotation, transform.localRotation.eulerAngles.y, 0);
	}
	void OnCollisionEnter(Collision col){
		Color color1 = new Color(1,0,0);
		Color color2 = new Color(0,0,1);
		if(col.gameObject.name == "Cube1"){
			col.gameObject.GetComponent<Renderer>().material.color = color1;
		}
		if(col.gameObject.name == "Cube2"){
			col.gameObject.GetComponent<Renderer>().material.color = color2;
		}
	}
}
