package com.meandni.flutterzhihu;
import android.app.Activity;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterBridge implements MethodChannel.MethodCallHandler {

    private static final String TAG = "FlutterPluginTest";

    /**
     * 插件标识
     */
    public static String CHANNEL = "com.mmd.flutterapp/plugin";

    private static String ACTION_LOG = "log";

    private static String LOG_ARGUMENT = "data";

    static MethodChannel channel;

    private static int i=0;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterBridge instance = new FlutterBridge();
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        /**
         * 通过 method 判断调用方法
         */
        if (methodCall.method.equals(ACTION_LOG)) {
            Activity curActivity = MyActivityLifecycleCallbacks.getInstance().getCurActivity();
            /**
             * 解析参数
             */
            String text = methodCall.argument(LOG_ARGUMENT);
            if (TextUtils.isEmpty(text)) {
                /**
                 * 错误返回
                 */
                result.error("Data is Null",null,null);
            }else {
                Toast.makeText(curActivity, text, Toast.LENGTH_LONG).show();
                Log.d(TAG, "onMethodCall: "+text);
                /**
                 * 成功返回
                 */
                result.success("is ok"+i++);
            }
        }else {
            result.notImplemented();
        }
    }
}
