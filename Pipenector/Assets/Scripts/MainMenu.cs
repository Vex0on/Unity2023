using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class MainMenu : MonoBehaviour
{
    public GameObject optionsModal;
    public Toggle fullscreenToggle;
    public Toggle vsyncToggle;
    public TMP_Dropdown resolutionDropdown;
    public Slider gameVolumeSlider;

    private void Start()
    {
        optionsModal.SetActive(false);
    }

    public void PlayGame()
    {
        SceneManager.LoadScene("SampleScene");
    }

    public void OpenOptions()
    {
        UpdateResolutionDropdown();
        fullscreenToggle.isOn = Screen.fullScreen;
        vsyncToggle.isOn = QualitySettings.vSyncCount > 0;
        resolutionDropdown.value = GetResolutionIndex(Screen.currentResolution);
        gameVolumeSlider.value = AudioListener.volume;

        optionsModal.SetActive(true);
    }

    private void UpdateResolutionDropdown()
    {
        resolutionDropdown.ClearOptions();

        Resolution[] resolutions = Screen.resolutions;

        List<string> resolutionOptions = new List<string>();
        foreach (Resolution resolution in resolutions)
        {
            resolutionOptions.Add($"{resolution.width}x{resolution.height}");
        }

        resolutionDropdown.AddOptions(resolutionOptions);
    }

    public void CloseOptions()
    {
        optionsModal.SetActive(false);
    }

    public void ExitGame()
    {
        Application.Quit();
    }

    public void ToggleFullscreen()
    {
        Screen.fullScreen = fullscreenToggle.isOn;
    }

    public void ToggleVsync()
    {
        QualitySettings.vSyncCount = vsyncToggle.isOn ? 1 : 0;
    }

    public void SetResolution()
    {
        Resolution resolution = Screen.resolutions[resolutionDropdown.value];
        Screen.SetResolution(resolution.width, resolution.height, Screen.fullScreen);
    }

    public void SetGameVolume()
    {
        AudioListener.volume = gameVolumeSlider.value;
    }

    private int GetResolutionIndex(Resolution targetResolution)
    {
        Resolution[] resolutions = Screen.resolutions;
        for (int i = 0; i < resolutions.Length; i++)
        {
            if (resolutions[i].width == targetResolution.width && resolutions[i].height == targetResolution.height)
            {
                return i;
            }
        }
        return 0;
    }
}
