using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class FinishLevel : MonoBehaviour
{
    public TextMeshProUGUI finishText;
    public PlayerMovement player;
    public GameObject finishFlag;

    private bool levelFinished = false;

    private void Start()
    {
        finishText.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (!levelFinished && IsPlayerNearFlag())
        {
            FinishLevelAction();
        }
    }

    private bool IsPlayerNearFlag()
    {
        float distance = Vector3.Distance(player.transform.position, finishFlag.transform.position);
        return distance < 2.0f;
    }

    private void FinishLevelAction()
    {
        levelFinished = true;
        player.enabled = false;
        finishText.gameObject.SetActive(true); 
    }
}
