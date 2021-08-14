using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    TMP_Text textoNivel;
    
    /* -------------------------------------------------------------------------------- */
    
    private void Awake()
    {
        textoNivel = GameObject.Find("TextoNivel").GetComponent<TMP_Text>();
    }

    /* -------------------------------------------------------------------------------- */
    
    void Start()
    {
        string nombreNivel = SceneManager.GetActiveScene().name;
        
        textoNivel.text = nombreNivel;
    }

    /* -------------------------------------------------------------------------------- */
    
    public static void manejarPausa() 
    {
        GameObject.Find("Jugador").GetComponent<PlayerMovement>().manejarPausa();
    }
}