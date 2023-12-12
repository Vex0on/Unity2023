using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum PipeType
{
    none = 0,
    single,
    elbow,
    triple,
    straight,
    cross,
}

public enum PipeRotation
{
    down = 0,
    right,
    up,
    left,
}

[System.Serializable]
public class Tile
{
    public string name;
    public PipeType type;
    public PipeRotation rotation;
}

[CreateAssetMenu(fileName = "Level", menuName = "Level")]
public class Level : ScriptableObject
{
    public int Row;
    public int Col;
    public List<Tile> Data;
}
