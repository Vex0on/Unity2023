#if UNITY_EDITOR

using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Level))]
public class LevelEditor : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        Level level = (Level)target;

        if (GUILayout.Button("Edit"))
        {
            if (GameManager.Instance == null) return;

            GameManager.Instance.DestroyLevel();
            GameManager.Instance.SpawnLevel();
        }

        if (GUILayout.Button("reset array"))
        {
            if (level.Data == null) level.Data = new();

            int count = (level.Row * level.Col) - level.Data.Count;
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                    level.Data.Add(new Tile());
            }else
            {
                count = Mathf.Abs(count);
                for (int i = 0; i < count; i++)
                {
                    level.Data.RemoveAt(level.Data.Count - 1);
                }
            }

            for (int i = 0; i < level.Data.Count; i++)
            {
                var current = level.Data[i];

                int y = i / level.Row;
                int x = i % level.Col;

                current.name = $"row: {y + 1}, col: {x + 1}";
            }
        }
    }
}

#endif