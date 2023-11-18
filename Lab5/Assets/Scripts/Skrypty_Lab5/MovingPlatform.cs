using UnityEngine;

public class MovingPlatform : MonoBehaviour
{
    public Transform startPoint;
    public Transform endPoint;
    public float speed;
    private bool shouldMove = false;
    private PlayerMovement player;

    private Vector3 playerOffset;

    void OnCollisionEnter(Collision collision)
    {
        player = collision.gameObject.GetComponent<PlayerMovement>();
        if (player != null)
        {
            Debug.Log("Player on platform");
            shouldMove = true;
            playerOffset = player.transform.position - transform.position;
        }
    }

    void OnCollisionExit(Collision collision)
    {
        PlayerMovement collidingPlayer = collision.gameObject.GetComponent<PlayerMovement>();
        if (collidingPlayer != null && collidingPlayer == player)
        {
            Debug.Log("Player not on platform");
            shouldMove = false;
            player = null;
        }
    }

    void Update()
    {

        if (shouldMove)
        {
            player.transform.position = new Vector3(transform.position.x + playerOffset.x, player.transform.position.y, player.transform.position.z);
            transform.position = Vector3.MoveTowards(transform.position, endPoint.position, speed * Time.deltaTime);

            if (transform.position == endPoint.position)
            {
                shouldMove = false;
            }
        }
        else
        {
            transform.position = Vector3.MoveTowards(transform.position, startPoint.position, speed * Time.deltaTime);

            if (transform.position == startPoint.position)
            {   
                shouldMove = false;
            }
        }
    }
}
