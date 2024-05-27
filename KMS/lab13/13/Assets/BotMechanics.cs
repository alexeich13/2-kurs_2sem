using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BotMechanics : MonoBehaviour
{
	float moveSpeed = 0.5f;   
	float rotationSpeedTank = 0.8f;  
	float rotationSpeedMuzzle = 0.5f;  
	float BulletSpeed = 5f;       
	public Transform tower;  
	public Transform muzzle; 
	public GameObject bullet; 

	public AudioClip vystrel;
	bool canShoot = true;  
	int life = 3;           
	private void OnTriggerStay(Collider other)
	{
		if (other.gameObject.tag == "player")
		{
			Vector3 relativePos = other.transform.position - transform.position;
			Quaternion newrot = Quaternion.LookRotation(relativePos) * Quaternion.AngleAxis(0, Vector3.down);
			tower.rotation = Quaternion.Slerp(tower.rotation, newrot, Time.deltaTime * rotationSpeedMuzzle);
            RaycastHit hit;
			if (Physics.Raycast(muzzle.position, muzzle.TransformDirection(new Vector3(0,0,1)), out hit))
			{	
				if ((hit.transform.tag == "player") && canShoot)
					StartCoroutine(BotShoot());	
			}

			float distance = Vector3.Distance(other.transform.position, transform.position);
			if (distance > 10 && distance < 50)
			{	
				transform.rotation = Quaternion.Slerp(transform.rotation, newrot, Time.deltaTime * rotationSpeedTank);
				transform.position = Vector3.Lerp(transform.position, other.transform.position, Time.deltaTime * moveSpeed);
            }
        }
	}
	IEnumerator BotShoot()
	{
		canShoot = false;
		Vector3 MuzzleForward = muzzle.transform.position + muzzle.transform.TransformDirection(Vector3.forward*5f);
		Vector3 muzzleRot = muzzle.rotation.eulerAngles;
		muzzleRot = new Vector3(muzzleRot.x + 90, muzzleRot.y, muzzleRot.z);
		Instantiate(bullet, MuzzleForward, Quaternion.Euler(muzzleRot));
		yield return new WaitForSeconds(3f);
		canShoot = true;
	}

	private void OnCollisionEnter(Collision collision)
	{
		if (collision.gameObject.tag == "goal")
		{
			life--;
			if (life < 1) Destroy(gameObject);
		}
	}

}
