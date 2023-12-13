using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SceneSwitcher : MonoBehaviour
{
    public Image image1;
    public Image image2;

    void Start()
    {
        image1.gameObject.SetActive(true);

        Invoke("SwitchToSecondImage", 5f);

        Invoke("SwitchToGameScene", 10f);
    }

    void SwitchToSecondImage()
    {
        image1.gameObject.SetActive(false);

        image2.gameObject.SetActive(true);
    }

    void SwitchToGameScene()
    {
        SceneManager.LoadScene("SampleScene");
    }
}
