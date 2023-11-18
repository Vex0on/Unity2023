using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingPlatformWithWaypoints : MonoBehaviour
{
    public List<GameObject> waypoints = new List<GameObject>();
    public float speed = 2.0f;

    private int currentWaypointIdx = 0;
    private bool moveForward = true;

    void Update()
    {
        if (waypoints.Count == 0)
        {
            Debug.LogError("There are no waypoints on list. Add some in Inspector.");
            return;
        }

        MovePlatform();
    }

    void MovePlatform()
    {
        GameObject currentWaypoint = waypoints[currentWaypointIdx];
        Vector3 targetPosition = currentWaypoint.transform.position;
        transform.position = Vector3.MoveTowards(transform.position, targetPosition, speed * Time.deltaTime);

        if (transform.position == targetPosition)
        {
            if (moveForward)
            {
                currentWaypointIdx++;

                if (currentWaypointIdx >= waypoints.Count)
                {
                    currentWaypointIdx = waypoints.Count - 2;
                    moveForward = false;
                }
            }
            else
            {
                currentWaypointIdx--;

                if (currentWaypointIdx < 0)
                {
                    currentWaypointIdx = 1;
                    moveForward = true;
                }
            }
        }
    }
}
