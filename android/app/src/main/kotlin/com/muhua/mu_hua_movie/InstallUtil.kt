package com.muhua.mu_hua_movie

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.text.TextUtils
import android.util.Log
import android.widget.Toast
import androidx.core.content.FileProvider

import java.io.File

class InstallUtil {

    fun installApk(context: Activity, filePath: String, requestCode: Int) {
        Log.e("TAG", "install apk$filePath")
        if (TextUtils.isEmpty(filePath)) {
            Toast.makeText(context, "安装路径出错", Toast.LENGTH_SHORT).show()
            return
        }
        val file = File(filePath)
        var uri = Uri.fromFile(file) ?: throw RuntimeException("安装路径不正确")
        if (Build.VERSION.SDK_INT >= 24) {
            uri = FileProvider.getUriForFile(context, "${context.packageName}.FileProvider", file)
        }
        val intent = Intent()
        if (Build.VERSION.SDK_INT < 24) {
            intent.action = Intent.ACTION_INSTALL_PACKAGE
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            intent.setDataAndType(uri, "application/vnd.android.package-archive")
            intent.putExtra(Intent.EXTRA_RETURN_RESULT, true)
            intent.putExtra(Intent.EXTRA_NOT_UNKNOWN_SOURCE, true)
            intent.putExtra(Intent.EXTRA_ALLOW_REPLACE, true)
        } else {
            intent.action = Intent.ACTION_INSTALL_PACKAGE
            intent.data = uri
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            intent.putExtra(Intent.EXTRA_RETURN_RESULT, true)
            intent.putExtra(Intent.EXTRA_NOT_UNKNOWN_SOURCE, true)
            intent.putExtra(Intent.EXTRA_ALLOW_REPLACE, true)
        }
        try {
            context.startActivityForResult(intent, requestCode)
        } catch (e: Exception) {
            e.message?.let { Log.e("TAG", it) }
        }
    }
}