using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("Speed Values")]
    public float speed;
    public float jumpForce = 1.0f;
    public PlayerCam playerCam;
    private float horizontalInput;
    private float verticalInput;
    public Rigidbody rb;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        horizontalInput = Input.GetAxis("Horizontal");
        verticalInput = Input.GetAxis("Vertical");

        Vector3 movement = new Vector3(horizontalInput, 0, verticalInput).normalized;
        Vector3 orientedMovement = playerCam.orientation.TransformDirection(movement);

        if (Input.GetKeyDown(KeyCode.Space))
        {
            Jump();
        }

        rb.MovePosition(transform.position + orientedMovement * speed * Time.fixedDeltaTime);
    }

    void Jump()
    {
        rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
    }
}
