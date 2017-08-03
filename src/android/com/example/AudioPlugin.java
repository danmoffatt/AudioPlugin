/**
 */
package com.example;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import java.util.Date;

public class MyCordovaPlugin extends CordovaPlugin {
  private static final String TAG = "AudioPlugin";

  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);

    Log.d(TAG, "Initializing AudioPlugin");
  }

  public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
      
    if(action.equals("play")) {
      String file = args.getString(0);
      Log.d(TAG, file);
    }
    else if(action.equals("stop")) {
      // An example of returning data back to the web layer
      //final PluginResult result = new PluginResult(PluginResult.Status.OK, (new Date()).toString());
      //callbackContext.sendPluginResult(result);
    }
      
    return true;
  }

}
