using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorMechanism : MonoBehaviour
{

    public PlayerMovement player;
    public GameObject doors;
    public float speed = 2.0f;


    void Update()
    {
        if (IsPlayerNearDoors())
        {
            Debug.Log("Blisko drzwi");
            OpenDoors();
        }
    }

    private bool IsPlayerNearDoors()
    {
        float distance = Vector3.Distance(player.transform.position, doors.transform.position);
        return distance < 4.0f;
    }

    private void OpenDoors()
    {
        Vector3 targetPos = doors.transform.position + Vector3.up * 4.0f;
        doors.transform.position = Vector3.MoveTowards(doors.transform.position, targetPos, speed * Time.deltaTime);
    }
}
