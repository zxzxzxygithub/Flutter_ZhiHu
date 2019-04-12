package com.meandni.flutterzhihu;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

/**
 * Description:
 * Created by FQH on 2019/3/6.
 */
public class MyActivityLifecycleCallbacks implements Application.ActivityLifecycleCallbacks {

    private Activity curActivity;

    public Activity getCurActivity() {
        return curActivity;
    }

    private MyActivityLifecycleCallbacks() {
    }

    public static MyActivityLifecycleCallbacks getInstance() {
        return Holder.sInstance;
    }

    private static class Holder {
        static MyActivityLifecycleCallbacks sInstance = new MyActivityLifecycleCallbacks();
    }

    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        curActivity = activity;
    }

    @Override
    public void onActivityStarted(Activity activity) {

    }

    @Override
    public void onActivityResumed(Activity activity) {
        curActivity = activity;
    }

    @Override
    public void onActivityPaused(Activity activity) {

    }

    @Override
    public void onActivityStopped(Activity activity) {

    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {

    }

    @Override
    public void onActivityDestroyed(Activity activity) {

    }
}
