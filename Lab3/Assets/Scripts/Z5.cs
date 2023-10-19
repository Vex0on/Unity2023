using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Z5 : MonoBehaviour
{
    public GameObject cubee;

    private void Start()
    {
        for (int i = 0; i < 10; i++)
        {
            Vector3 randomPosition = RandomPos(i);
            Instantiate(cubee, randomPosition + Vector3.up * 20, Quaternion.identity);
        }
    }

    private Vector3 RandomPos(int index)
    {
        float x = Random.Range(-10, 10) + index * 3;
        float z = Random.Range(-10, 10) + index * 3;
        return new Vector3(x, 0f, z);
    }
}
