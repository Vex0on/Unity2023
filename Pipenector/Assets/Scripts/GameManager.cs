using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    [SerializeField] private Level _level;
    [SerializeField] private Pipe _cellPrefab;

    public static GameManager Instance;

    [SerializeField] private bool isLvlFinished;
    private Pipe[,] pipes;
    private List<Pipe> pipeList;

    private void Awake()
    {
        Instance = this;
        SpawnLevel();
    }

    public void SpawnLevel()
    {
        pipes = new Pipe[_level.Row, _level.Col];
        pipeList = new List<Pipe>();

        for (int i = 0; i < _level.Row; i++)
        {
            for (int j = 0; j < _level.Col; j++)
            {
                Vector2 spawnPos = new Vector2(j, -i);
                Pipe tempPipe = Instantiate(_cellPrefab, spawnPos, Quaternion.identity);
                bool lastPipe = i == _level.Row - 1 && j == _level.Col - 1;
                tempPipe.Init(_level.Data[i * _level.Col + j], lastPipe);
                pipes[i, j] = tempPipe;
                if (tempPipe.PipeType == 1 && !lastPipe)
                {
                    pipeList.Add(tempPipe);
                }
            }
        }

        Camera.main.orthographicSize = Mathf.Max(_level.Row, _level.Col);
        Vector3 cameraPos = Camera.main.transform.position;
        cameraPos.x = _level.Col * 0.5f;
        cameraPos.y = -_level.Row * 0.5f;
        Camera.main.transform.position = cameraPos;
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        for(int i = 0; i < _level.Row; i++)
        {
            for (int j = 0; j < _level.Col; j++)
            {
                Vector2 spawnPos = new Vector2(j, -i);
                Gizmos.DrawWireCube(spawnPos, Vector2.one);
            }
        }
    }

    public void DestroyLevel()
    {
        foreach (Pipe pipe in pipeList)
        {
            if (pipe == null) continue;
            Destroy(pipe.gameObject);
        }

        for (int i = 0; i < pipes.GetLength(0); i++)
        {
            for (int j = 0; j < pipes.GetLength(1); j++)
            {
                if (pipes[i, j] == null) continue;
                Destroy(pipes[i, j].gameObject);
                pipes[i, j] = null;
            }
        }
    }

    private void Update()
    {
        if (isLvlFinished) return;

        Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        mousePos.x += 0.5f;
        mousePos.y += -0.5f;
        float oldMouseY = mousePos.y;

        int row = Mathf.FloorToInt(Mathf.Abs(mousePos.y));
        int col = Mathf.FloorToInt(mousePos.x);
        if (row < 0 || col < 0) return;
        if (row >= _level.Row) return;
        if (col >= _level.Col) return;

        if (oldMouseY > 0) return;
        if (Input.GetMouseButtonDown(0))
        {
            pipes[row, col].UpdateInput();
            StartCoroutine(ShowHint());
        }
    }

    private IEnumerator ShowHint()
    {
        yield return new WaitForSeconds(0.1f);
        CheckFill();
        CheckWin();
    }

    private void CheckFill()
    {
        for (int i = 0; i < _level.Row; i++)
        {
            for (int j = 0; j < _level.Col; j++)
            {
                Pipe tempPipe = pipes[i, j];
                if (tempPipe.PipeType != 0)
                {
                    tempPipe.isFilled = false;
                }
            }
        }

        Queue<Pipe> check = new Queue<Pipe>();
        HashSet<Pipe> finished = new HashSet<Pipe>();
        foreach (var pipe in pipeList)
        {
            check.Enqueue(pipe);
        }

        while (check.Count > 0)
        {
            Pipe pipe = check.Dequeue();
            finished.Add(pipe);
            List<Pipe> connected = pipe.ConnectedPipes();
            foreach (var connectedPipe in connected)
            {
                if (!finished.Contains(connectedPipe))
                {
                    check.Enqueue(connectedPipe);
                }
            }
        }

        foreach (var filled in finished)
        {
            filled.isFilled = true;
        }

        for (int i = 0; i < _level.Row; i++)
        {
            for (int j = 0; j < _level.Col; j++)
            {
                Pipe tempPipe = pipes[i, j];
                tempPipe.UpdateFilled();
            }
        }

    }

    private void CheckWin()
    {
        for (int i = 0; i < _level.Row; i++)
        {
            for (int j = 0; j < _level.Col; j++)
            {
                if (!pipes[i, j].isFilled)
                {
                    return;
                }
            }
        }
        isLvlFinished = true;
        StartCoroutine(GameFinish());
    }

    private IEnumerator GameFinish()
    {
        yield return new WaitForSeconds(2f);
        UnityEngine.SceneManagement.SceneManager.LoadScene(0);
    }
}
