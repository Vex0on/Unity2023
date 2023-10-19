using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Z6 : MonoBehaviour
{
    public Transform target;
    public float speed = 150;
    private Vector3 velocity = Vector3.zero;

    private void Update()
    {
        transform.position = Vector3.SmoothDamp(transform.position, target.position, ref velocity, speed * Time.deltaTime);
    }
}