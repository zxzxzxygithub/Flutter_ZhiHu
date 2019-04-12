package com.meandni.flutterzhihu;

import io.flutter.app.FlutterApplication;

/**
 * @author zhengyx
 * @des
 * @date 2019/4/12
 **/
public class App extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        registerActivityLifecycleCallbacks(MyActivityLifecycleCallbacks.getInstance());
    }
}
