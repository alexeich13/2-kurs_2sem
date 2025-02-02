﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletFlight : MonoBehaviour {

	public float bulletSpeed = 5f;

    public GameObject explosion;

    // Start is called before the first frame update
    void Start()
    {
        Destroy(gameObject, 5f);   
    }

    // Update is called once per frame
    void Update()
    {
        transform.position += transform.TransformDirection(Vector3.up * bulletSpeed);
    }

    private void OnCollisionEnter(Collision other)
    {
        if (other.gameObject.tag == "Player")
        {
            other.gameObject.GetComponent<Renderer>().material.color = new Color(Random.Range(.0f, 1.0f),Random.Range(.0f, 1.0f), Random.Range(.0f, 1.0f));
            gameObject.GetComponent<Renderer>().enabled = false;
            Instantiate(explosion, other.transform.position, Quaternion.identity);
            var audioSource = other.gameObject.GetComponent<AudioSource>();
            audioSource.PlayOneShot(audioSource.clip);
        }
    }
}
