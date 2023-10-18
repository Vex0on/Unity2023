using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Z2 : MonoBehaviour
{
    public float speed = 10f;
    private Vector3 startPos;
    private int direction = 1;

    private void Start()
    {
        startPos = transform.position;
    }

    private void Update()
    {
        transform.Translate(Vector3.right * speed * direction * Time.deltaTime);

        if (Mathf.Abs(transform.position.x - startPos.x) >= 10f)
        {
            direction *= -1;
        }
    }
}
