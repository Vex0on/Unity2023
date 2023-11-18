using UnityEngine;

public class MovingPlatform : MonoBehaviour
{
    public Transform startPoint;
    public Transform endPoint;
    public float speed;
    private bool shouldMove = false;
    private PlayerMovement player;

    void Start()
    {
        player = null;
    }

    void OnCollisionEnter(Collision collision)
    {
            player = collision.gameObject.GetComponent<PlayerMovement>();
            if (player != null)
            {
                Debug.Log("Gracz na platformie");
                shouldMove = true;
            }
    }

    void OnCollisionExit(Collision collision)
    {
            PlayerMovement collidedPlayer = collision.gameObject.GetComponent<PlayerMovement>();
            if (collidedPlayer != null && collidedPlayer == player)
            {
                Debug.Log("Gracz poza platform¹");
                shouldMove = false;
                player = null; 
            }
    }

    void Update()
    {
        if (shouldMove)
        {
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
