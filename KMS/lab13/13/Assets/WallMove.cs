using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WallMove : MonoBehaviour {

	public GameObject item;
    public float movingSpeed = 1f;

    private void Start()
    {
   
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.name == "tank2")
        {
            item.gameObject.GetComponent<Transform>().Rotate(new Vector3(0, 45, 0) * Time.deltaTime);  
        }
    }
}
