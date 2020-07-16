package com.openalpr.jni;

import com.openalpr.jni.json.JSONException;

public class Alpr {

    static {

      }

    private native void initialize(String country, String configFile, String runtimeDir);
    private native void dispose();

    private native boolean is_loaded();
    private native String native_recognize(String imageFile);
    private native String native_recognize(byte[] imageBytes);
    private native String native_recognize(long imageData, int bytesPerPixel, int imgWidth, int imgHeight);

    private native void set_default_region(String region);
    private native void detect_region(boolean detectRegion);
    private native void set_top_n(int topN);
    private native String get_version();



    public Alpr(String country, String configFile, String runtimeDir, String nativeLibFile, String jniFile)
    {
        loadNativeLibraries(nativeLibFile, jniFile);
        initialize(country, configFile, runtimeDir);
    }

    public void loadNativeLibraries(String nativeLibFile, String jniFile) {
        try {
            // Expecting full absolute path to file, including filname.
            System.out.println("com.openalpr.jni.Alpr - Loading native library from " + nativeLibFile);
            System.out.println("com.openalpr.jni.Alpr - Loading jni library from " + jniFile);

            System.load(nativeLibFile);
            System.load(jniFile);

        } catch (UnsatisfiedLinkError e) {
          System.err.println("Native code library failed to load.\n" + e);
          System.exit(1);
        }
    }

    public void unload()
    {
        dispose();
    }

    public boolean isLoaded()
    {
        return is_loaded();
    }

    public AlprResults recognize(String imageFile) throws AlprException
    {
        try {
            String json = native_recognize(imageFile);
            return new AlprResults(json);
        } catch (JSONException e)
        {
            throw new AlprException("Unable to parse ALPR results");
        }
    }


    public AlprResults recognize(byte[] imageBytes) throws AlprException
    {
        try {
            String json = native_recognize(imageBytes);
            return new AlprResults(json);
        } catch (JSONException e)
        {
            throw new AlprException("Unable to parse ALPR results");
        }
    }


    public AlprResults recognize(long imageData, int bytesPerPixel, int imgWidth, int imgHeight) throws AlprException
    {
        try {
            String json = native_recognize(imageData, bytesPerPixel, imgWidth, imgHeight);
            return new AlprResults(json);
        } catch (JSONException e)
        {
            throw new AlprException("Unable to parse ALPR results");
        }
    }


    public void setTopN(int topN)
    {
        set_top_n(topN);
    }

    public void setDefaultRegion(String region)
    {
        set_default_region(region);
    }

    public void setDetectRegion(boolean detectRegion)
    {
        detect_region(detectRegion);
    }

    public String getVersion()
    {
        return get_version();
    }
}
