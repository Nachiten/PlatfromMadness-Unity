using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public class DoorManager : MonoBehaviour
{
    //bool doorOpen = false;

    SpriteRenderer lockObject;
    SpriteRenderer lockBackground;
    GameObject doorClosedObject;
    SoundManager soundManager;

    BoxCollider2D colliderObject;

    LevelLoader levelLoader;

    public bool esPuertaAlSiguienteNivel = false;

    int indexActual;

    void Awake()
    {
        foreach (Transform unHijo in transform)
        {
            if (unHijo.gameObject.name == "DoorClosed")
            {
                doorClosedObject = unHijo.gameObject;
            }
            if (unHijo.gameObject.name == "Lock")
            {
                lockObject = unHijo.gameObject.GetComponent<SpriteRenderer>();
            }
            if (unHijo.gameObject.name == "LockBackground")
            {
                lockBackground = unHijo.gameObject.GetComponent<SpriteRenderer>();
            }
        }

        try
        {
            colliderObject = GetComponent<BoxCollider2D>();

            colliderObject.isTrigger = false;

            soundManager = GameObject.Find("SoundManager").GetComponent<SoundManager>();

            levelLoader = GameObject.Find("GameManager").GetComponent<LevelLoader>();

            indexActual = SceneManager.GetActiveScene().buildIndex;

            if (doorClosedObject == null) 
            {
                throw new Exception("doorClosedObject");
            }
            if (lockObject == null)
            {
                throw new Exception("lockObject");
            }
            if (lockBackground == null)
            {
                throw new Exception("lockBackground");
            }

            
        }
        catch (Exception e) {
            Debug.LogError("[DoorManager] Error al asignar variable: " + e.Message);
        }
    }

    public void abrirPuerta()
    {
        //doorOpen = true;
        doorClosedObject.SetActive(false);
        colliderObject.isTrigger = true;
    }

    void OnTriggerEnter2D(Collider2D collision)
    {
        if (!esPuertaAlSiguienteNivel)
            return;
        
        Debug.Log("La puerta esta ABIERTA");
        levelLoader.cargarNivel(indexActual + 1);
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        Debug.Log("La puerta esta CERRADA");
        soundManager.reproducirSonido(3);
        if (!animacionEnEjecucion)
            ponerCandado();
    }

    float animationTime = 0.3f;
    float animationsDelay = 0.6f;
    float alphaFinal = 0.35f;

    Color backgroundColor = new Color(200,200,200);

    bool animacionEnEjecucion = false;

    void ponerCandado() {
        animacionEnEjecucion = true;
        LeanTween.value(gameObject, 0, alphaFinal, animationTime).setOnUpdate(cambiarAlfaBackground).setOnComplete(quitarCandado);
        LeanTween.value(gameObject, 0, 1, animationTime).setOnUpdate(cambiarAlfaLock).setOnComplete(quitarCandado);
    }

    void cambiarAlfaBackground(float val) 
    {
        Color color = new Color(backgroundColor.r, backgroundColor.g, backgroundColor.b, val);

        lockBackground.color = color;
    }

    void cambiarAlfaLock(float val)
    {
        Color color = new Color(backgroundColor.r, backgroundColor.g, backgroundColor.b, val);

        lockObject.color = color;
    }

    void quitarCandado() 
    {
        LeanTween.value(gameObject, alphaFinal, 0, animationTime).setOnUpdate(cambiarAlfaBackground).setDelay(animationsDelay);
        LeanTween.value(gameObject, 1, 0, animationTime).setOnUpdate(cambiarAlfaLock).setDelay(animationsDelay).setOnComplete(terminarAnimacion);
    }

    void terminarAnimacion() 
    {
        animacionEnEjecucion = false;
    }
}
