using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightTrigger : MonoBehaviour {

	public Light light;
    private void OnTriggerEnter(Collider other)
    {
        light.intensity = 100;
    }

    private void OnTriggerExit(Collider other)
    {
        light.intensity = 0;
    }
}
