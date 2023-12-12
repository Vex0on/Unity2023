using System.Collections.Generic;
using UnityEngine;

public class Pipe : MonoBehaviour
{
    public int PipeType;
    public bool isFilled;
    public bool lastTile;

    [SerializeField] private Transform[] _pipePref;

    [SerializeField] private Transform actualPipe;
    private int rotation;

    [SerializeField] private SpriteRenderer emptyPipeSprite;
    [SerializeField] private SpriteRenderer fullPipeSprite;
    private List<Transform> connectBox;

    private const int minRotation = 0;
    private const int maxRotation = 3;
    private const int rotationMultiplier = 90;


    public void Init(Tile tile, bool lastTile)
    {
        this.lastTile = lastTile;
        PipeType = (int)tile.type;
        actualPipe = Instantiate(_pipePref[PipeType], transform);
        actualPipe.transform.localPosition = Vector3.zero;
        if (PipeType == 1 || PipeType == 2 || PipeType == 3 || PipeType == 4)
            rotation = (int)tile.rotation;

        actualPipe.transform.eulerAngles = new Vector3(0, 0, rotation * rotationMultiplier);

        if (PipeType == 0 || (PipeType == 1 || lastTile)) isFilled = true;
        if (PipeType == 0) return;
        if (lastTile) isFilled = false;

        emptyPipeSprite = actualPipe.GetChild(0).GetComponent<SpriteRenderer>();
        emptyPipeSprite.gameObject.SetActive(!isFilled);
        fullPipeSprite = actualPipe.GetChild(1).GetComponent<SpriteRenderer>();
        fullPipeSprite.gameObject.SetActive(isFilled);

        connectBox = new List<Transform>();
        for (int i = 0; i < actualPipe.childCount; i++)
        {
            connectBox.Add(actualPipe.GetChild(i));
        }
    }

    public void UpdateFilled()
    {
        if (PipeType == 0 || emptyPipeSprite == null) return;
        emptyPipeSprite.gameObject.SetActive(!isFilled);
        fullPipeSprite.gameObject.SetActive(isFilled);
    }

    public List<Pipe> ConnectedPipes()
    {
        List<Pipe> result = new List<Pipe>();

        foreach (var box in connectBox)
        {
            RaycastHit2D[] hit = Physics2D.RaycastAll(box.transform.position, Vector2.zero, 0.1f);
            for (int i = 0; i < hit.Length; i++)
            {
                result.Add(hit[i].collider.transform.parent.parent.GetComponent<Pipe>());
            }
        }

        return result;
    }

    public void UpdateInput()
    {
        if (PipeType == 0 || PipeType == 1 || PipeType == 5) return;

        rotation = (rotation + 1) % (maxRotation + 1);
        actualPipe.transform.eulerAngles = new Vector3(0, 0, rotation * rotationMultiplier);
    }
}
