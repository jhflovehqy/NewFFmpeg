package cn.jin.newffmpeg

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.TextView
import cn.jin.newffmpeg.databinding.ActivityMainBinding
import java.lang.Exception
import java.util.logging.Logger

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Example of a call to a native method
        binding.sampleText.text = getConfigurations()
        Log.d("load" ,"load so success ====${getConfigurations()}")
    }

    /**
     * A native method that is implemented by the 'newffmpeg' native library,
     * which is packaged with this application.
     */
   // external fun stringFromJNI(): String

    external fun getConfigurations() :String

    companion object {
        // Used to load the 'newffmpeg' library on application startup.
        init {
            try {
                System.loadLibrary("newffmpeg")


                Log.d("load" ,"load so success ====")
            }catch (e : Exception){
                Log.d("load" ,"load so fail ====> $e")
            }

        }
    }
}