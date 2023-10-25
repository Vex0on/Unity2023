using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using Random = UnityEngine.Random;

public class Z1 : MonoBehaviour
{
    public int objectsNr = 10;
    public Material[] materials;
    public GameObject block;

    private void Start()
    {
        List<Vector3> positions = GenerujPozycje();
        StartCoroutine(GenerujObiekt(positions));
    }

    private List<Vector3> GenerujPozycje()
    {
        List<Vector3> positions = new List<Vector3>();
        Transform platformTransform = transform;

        for (int i = 0; i < objectsNr; i++)
        {
            float randomX = Random.Range(platformTransform.position.x - 5f, platformTransform.position.x + 5f);
            float randomZ = Random.Range(platformTransform.position.z - 5f, platformTransform.position.z + 5f);
            positions.Add(new Vector3(randomX, 5, randomZ));
        }

        return positions;
    }

    private IEnumerator GenerujObiekt(List<Vector3> positions)
    {
        Debug.Log("Wywo³ano coroutine");

        for (int i = 0; i < objectsNr; i++)
        {
            Vector3 position = positions[i];
            GameObject newObject = Instantiate(block, position, Quaternion.identity);
            newObject.GetComponent<Renderer>().material = materials[Random.Range(0, materials.Length)];

            yield return new WaitForSeconds(3.0f);
        }

        Debug.Log("Kuniec skryptu");
    }
}