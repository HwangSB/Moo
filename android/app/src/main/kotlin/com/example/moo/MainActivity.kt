package com.example.moo

import android.content.pm.PackageManager
import android.util.Base64
import android.util.Log
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        try {
            var info = packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES)
            for (signature in info.signatures) {
                val md = MessageDigest.getInstance("SHA")
                md.update(signature.toByteArray())
                Log.d("KeyHash", Base64.encodeToString(md.digest(), Base64.DEFAULT))
            }
        } catch (e : PackageManager.NameNotFoundException) {
            e.printStackTrace();
        } catch (e : NoSuchAlgorithmException) {
            e.printStackTrace()
        }
    }
}
