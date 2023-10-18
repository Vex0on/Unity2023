using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Z3 : MonoBehaviour
{
    public float speed = 10f;
    private Vector3[] edges;
    private int edgeIDX = 0;

    private void Start()
    {
        edges = new Vector3[]
        {
            new Vector3(10f, 0f, 0f),
            new Vector3(10f, 0f, 10f),
            new Vector3(0f, 0f, 10f),
            new Vector3(0f, 0f, 0f)
        };
    }

    private void Update()
    {
        MoveBetweenEdges(edges[edgeIDX]);

        if (Vector3.Distance(transform.position, edges[edgeIDX]) < 0.1f)
        {
            RotateAfterReachingEdge();
            edgeIDX = (edgeIDX + 1) % edges.Length;
        }
    }

    private void MoveBetweenEdges(Vector3 edge)
    {
        transform.position = Vector3.MoveTowards(transform.position, edge, speed * Time.deltaTime);
    }

    private void RotateAfterReachingEdge()
    {
        Vector3 currEdge = edges[edgeIDX];
        Vector3 prevEdge = edges[(edgeIDX - 1 + edges.Length) % edges.Length];
        Vector3 dir = currEdge - prevEdge;
        Quaternion rotate = Quaternion.LookRotation(dir);
        transform.rotation = Quaternion.RotateTowards(transform.rotation, rotate, 90f);
    }
}
