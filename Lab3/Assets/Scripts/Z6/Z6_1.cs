using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Z6_1 : MonoBehaviour
{
    public Transform target;
    public float speed = 1;

    private void LateUpdate()
    {
        transform.position = Vector3.Lerp(transform.position, target.position, speed * Time.deltaTime);
    }
}