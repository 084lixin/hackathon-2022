package com.baidu.paddle.lite.demo.image_classification.Acitivity;

import android.Manifest;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.baidu.paddle.lite.demo.image_classification.Predictor;
import com.baidu.paddle.lite.demo.image_classification.R;
import com.baidu.paddle.lite.demo.image_classification.SettingsActivity;
import com.baidu.paddle.lite.demo.image_classification.Util_view;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class aIActivitya extends AppCompatActivity {
    private static final String TAG = aIActivitya.class.getSimpleName();
    public static final int OPEN_GALLERY_REQUEST_CODE = 0;
    public static final int TAKE_PHOTO_REQUEST_CODE = 1;

    public static final int REQUEST_LOAD_MODEL = 0;
    public static final int REQUEST_RUN_MODEL = 1;
    public static final int RESPONSE_LOAD_MODEL_SUCCESSED = 0;
    public static final int RESPONSE_LOAD_MODEL_FAILED = 1;
    public static final int RESPONSE_RUN_MODEL_SUCCESSED = 2;
    public static final int RESPONSE_RUN_MODEL_FAILED = 3;

    protected ProgressDialog pbLoadModel = null;
    protected ProgressDialog pbRunModel = null;

    protected Handler receiver = null; // Receive messages from worker thread
    protected Handler sender = null; // Send command to worker thread
    protected HandlerThread worker = null; // Worker thread to load&run model

    // UI components of image classification
    protected TextView tvInputSetting;
    protected ImageView ivInputImage;
    protected TextView tvTop1Result;
    protected TextView tvInferenceTime;

    // Model settings of image classification
    protected String modelPath = "";
    protected String labelPath = "";
    protected String imagePath = "";
    protected int cpuThreadNum = 1;
    protected String cpuPowerMode = "";
    protected String inputColorFormat = "";
    protected long[] inputShape = new long[]{};
    protected float[] inputMean = new float[]{};
    protected float[] inputStd = new float[]{};
    protected Button photo;
    protected Button setting;
    protected Bitmap imagse;
    byte[] res;  //接收传递过来的byte数组
    Bitmap mImageIds ;  //转换后的bitmap

    public static final String IMG = "1";

    protected Predictor predictor = new Predictor();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ai);


        initview();
        //下面这句表示在intent中拿到bitmap对应的数组
        res = getIntent().getByteArrayExtra(IMG);
        Log.d("TAG", "onCreate: " + res);
        InputStream inputStream = new ByteArrayInputStream(res);
        imagse = BitmapFactory.decodeStream(inputStream);

        // Clear all setting items to avoid app crashing due to the incorrect settings
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.clear();
        editor.commit();

        // Prepare the worker thread for mode loading and inference
        receiver = new Handler() {
            @Override
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case RESPONSE_LOAD_MODEL_SUCCESSED:
                        pbLoadModel.dismiss();
                        onLoadModelSuccessed();
                        break;
                    case RESPONSE_LOAD_MODEL_FAILED:
                        pbLoadModel.dismiss();
                        Toast.makeText(aIActivitya.this, "Load model failed!", Toast.LENGTH_SHORT).show();
                        onLoadModelFailed();
                        break;
                    case RESPONSE_RUN_MODEL_SUCCESSED:
                        pbRunModel.dismiss();
                        onRunModelSuccessed();
                        break;
                    case RESPONSE_RUN_MODEL_FAILED:
                        pbRunModel.dismiss();
                        Toast.makeText(aIActivitya.this, "Run model failed!", Toast.LENGTH_SHORT).show();
                        onRunModelFailed();
                        break;
                    default:
                        break;
                }
            }
        };

        worker = new HandlerThread("Predictor Worker");
        worker.start();
        sender = new Handler(worker.getLooper()) {
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case REQUEST_LOAD_MODEL:
                        // Load model and reload test image
                        if (onLoadModel()) {
                            receiver.sendEmptyMessage(RESPONSE_LOAD_MODEL_SUCCESSED);
                        } else {
                            receiver.sendEmptyMessage(RESPONSE_LOAD_MODEL_FAILED);
                        }
                        break;
                    case REQUEST_RUN_MODEL:
                        // Run model if model is loaded
                        if (onRunModel()) {
                            receiver.sendEmptyMessage(RESPONSE_RUN_MODEL_SUCCESSED);
                        } else {
                            receiver.sendEmptyMessage(RESPONSE_RUN_MODEL_FAILED);
                        }
                        break;
                    default:
                        break;
                }
            }
        };

        // Setup the UI components
        tvInputSetting = findViewById(R.id.tv_input_setting);
        ivInputImage = findViewById(R.id.iv_input_image);
        tvTop1Result = findViewById(R.id.tv_top1_result);
        tvInferenceTime = findViewById(R.id.tv_inference_time);
        tvInputSetting.setMovementMethod(ScrollingMovementMethod.getInstance());
    }

    private void initview() {
        photo = (Button) findViewById(R.id.open_gallery);
        setting = (Button) findViewById(R.id.settings);

        photo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (requestAllPermissions()) {
                    openGallery();
                }
            }
        });

        setting.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (requestAllPermissions()) {
                    onSettingsClicked();
                }
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        boolean settingsChanged = false;
        String model_path = sharedPreferences.getString(getString(R.string.MODEL_PATH_KEY),
                getString(R.string.MODEL_PATH_DEFAULT));
        String label_path = sharedPreferences.getString(getString(R.string.LABEL_PATH_KEY),
                getString(R.string.LABEL_PATH_DEFAULT));
        String image_path = sharedPreferences.getString(getString(R.string.IMAGE_PATH_KEY),
                getString(R.string.IMAGE_PATH_DEFAULT));
        settingsChanged |= !model_path.equalsIgnoreCase(modelPath);
        settingsChanged |= !label_path.equalsIgnoreCase(labelPath);
        settingsChanged |= !image_path.equalsIgnoreCase(imagePath);
        int cpu_thread_num = Integer.parseInt(sharedPreferences.getString(getString(R.string.CPU_THREAD_NUM_KEY),
                getString(R.string.CPU_THREAD_NUM_DEFAULT)));
        settingsChanged |= cpu_thread_num != cpuThreadNum;
        String cpu_power_mode =
                sharedPreferences.getString(getString(R.string.CPU_POWER_MODE_KEY),
                        getString(R.string.CPU_POWER_MODE_DEFAULT));
        settingsChanged |= !cpu_power_mode.equalsIgnoreCase(cpuPowerMode);
        String input_color_format =
                sharedPreferences.getString(getString(R.string.INPUT_COLOR_FORMAT_KEY),
                        getString(R.string.INPUT_COLOR_FORMAT_DEFAULT));
        settingsChanged |= !input_color_format.equalsIgnoreCase(inputColorFormat);
        long[] input_shape =
                Util_view.parseLongsFromString(sharedPreferences.getString(getString(R.string.INPUT_SHAPE_KEY),
                        getString(R.string.INPUT_SHAPE_DEFAULT)), ",");
        float[] input_mean =
                Util_view.parseFloatsFromString(sharedPreferences.getString(getString(R.string.INPUT_MEAN_KEY),
                        getString(R.string.INPUT_MEAN_DEFAULT)), ",");
        float[] input_std =
                Util_view.parseFloatsFromString(sharedPreferences.getString(getString(R.string.INPUT_STD_KEY)
                        , getString(R.string.INPUT_STD_DEFAULT)), ",");
        settingsChanged |= input_shape.length != inputShape.length;
        settingsChanged |= input_mean.length != inputMean.length;
        settingsChanged |= input_std.length != inputStd.length;
        if (!settingsChanged) {
            for (int i = 0; i < input_shape.length; i++) {
                settingsChanged |= input_shape[i] != inputShape[i];
            }
            for (int i = 0; i < input_mean.length; i++) {
                settingsChanged |= input_mean[i] != inputMean[i];
            }
            for (int i = 0; i < input_std.length; i++) {
                settingsChanged |= input_std[i] != inputStd[i];
            }
        }
        if (settingsChanged) {
            modelPath = model_path;
            labelPath = label_path;
            imagePath = image_path;
            cpuThreadNum = cpu_thread_num;
            cpuPowerMode = cpu_power_mode;
            inputColorFormat = input_color_format;
            inputShape = input_shape;
            inputMean = input_mean;
            inputStd = input_std;
            // Update UI
            tvInputSetting.setText("Model: " + modelPath.substring(modelPath.lastIndexOf("/") + 1) + "\n" + "CPU" +
                    " Thread Num: " + Integer.toString(cpuThreadNum) + "\n" + "CPU Power Mode: " + cpuPowerMode + "\n");
            tvInputSetting.scrollTo(0, 0);
            // Reload model if configure has been changed
            loadModel();
        }
    }

    public void loadModel() {
        pbLoadModel = ProgressDialog.show(this, "", "Loading model...", false, false);
        sender.sendEmptyMessage(REQUEST_LOAD_MODEL);
    }

    public void runModel() {
        pbRunModel = ProgressDialog.show(this, "", "Running model...", false, false);
        sender.sendEmptyMessage(REQUEST_RUN_MODEL);
    }

    public boolean onLoadModel() {
        return predictor.init(aIActivitya.this, modelPath, labelPath, cpuThreadNum,
                cpuPowerMode,
                inputColorFormat,
                inputShape, inputMean,
                inputStd);
    }
    //下面的这个方法是将byte数组转化为Bitmap对象的一个方法
    public static Bitmap getPicFromBytes(byte[] bytes, BitmapFactory.Options opts) {

        if (bytes != null)
            if (opts != null)
                return BitmapFactory.decodeByteArray(bytes, 0, bytes.length,  opts);
            else
                return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        return null;

    }

    public boolean onRunModel() {
        return predictor.isLoaded() && predictor.runModel();
    }

    public void onLoadModelSuccessed() {
        // Load test image from path and run model
        try {
            if (imagePath.isEmpty()) {
                return;
            }
            Bitmap image = null;
            // Read test image file from custom path if the first character of mode path is '/', otherwise read test
            // image file from assets
            if (!imagePath.substring(0, 1).equals("/")) {
                InputStream imageStream = getAssets().open(imagePath);
                image = BitmapFactory.decodeStream(imageStream);
            } else {
                if (!new File(imagePath).exists()) {
                    return;
                }
                image = BitmapFactory.decodeFile(imagePath);
            }
            if (image != null && predictor.isLoaded()) {
                predictor.setInputImage(image);
                runModel();
            }
        } catch (IOException e) {
            Toast.makeText(aIActivitya.this, "Load image failed!", Toast.LENGTH_SHORT).show();
            e.printStackTrace();
        }
    }

    public void onLoadModelFailed() {
    }

    public void onRunModelSuccessed() {
        // Obtain results and update UI
        tvInferenceTime.setText("Inference time: " + predictor.inferenceTime() + " ms");
        Bitmap inputImage = predictor.inputImage();
        if (inputImage != null) {
            ivInputImage.setImageBitmap(inputImage);
//            ivInputImage.setImageBitmap(imagse);

        }
        tvTop1Result.setText(predictor.top1Result());
        //获取检测结果数据
    }

    public void onRunModelFailed() {
    }

    public void onImageChanged(Bitmap image) {
        // Rerun model if users pick test image from gallery or camera
        if (image != null && predictor.isLoaded()) {
            predictor.setInputImage(image);
            runModel();
        }
    }

    public void onSettingsClicked() {
        startActivity(new Intent(aIActivitya.this, SettingsActivity.class));
    }

//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        MenuInflater inflater = getMenuInflater();
//        inflater.inflate(R.menu.menu_action_options, menu);
//        return true;
//    }

//    public boolean onPrepareOptionsMenu(Menu menu) {
//        boolean isLoaded = predictor.isLoaded();
//        menu.findItem(R.id.open_gallery).setEnabled(isLoaded);
//        menu.findItem(R.id.take_photo).setEnabled(isLoaded);
//        return super.onPrepareOptionsMenu(menu);
//    }

//    @Override
//    public boolean onOptionsItemSelected(MenuItem item) {
//        switch (item.getItemId()) {
//            case android.R.id.home:
//                finish();
//                break;
//            case R.id.open_gallery:
//                if (requestAllPermissions()) {
//                    openGallery();
//                }
//                break;
//            case R.id.take_photo:
//                if (requestAllPermissions()) {
//                    takePhoto();
//                }
//                break;
//            case R.id.settings:
//                if (requestAllPermissions()) {
//                    // Make sure we have SDCard r&w permissions to load model from SDCard
//                    onSettingsClicked();
//                }
//                break;
//        }
//        return super.onOptionsItemSelected(item);
//    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
                                           @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (grantResults[0] != PackageManager.PERMISSION_GRANTED || grantResults[1] != PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(this, "Permission Denied", Toast.LENGTH_SHORT).show();
        }
    }

    private boolean requestAllPermissions() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED || ContextCompat.checkSelfPermission(this,
                Manifest.permission.CAMERA)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE,
                            Manifest.permission.CAMERA},
                    0);
            return false;
        }
        return true;
    }

    private void openGallery() {
        Intent intent = new Intent(Intent.ACTION_PICK, null);
        intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, "image/*");
        startActivityForResult(intent, OPEN_GALLERY_REQUEST_CODE);
    }

    private void takePhoto() {
        Intent takePhotoIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (takePhotoIntent.resolveActivity(getPackageManager()) != null) {
            startActivityForResult(takePhotoIntent, TAKE_PHOTO_REQUEST_CODE);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == RESULT_OK && data != null) {
            switch (requestCode) {
                case OPEN_GALLERY_REQUEST_CODE:
                    try {
                        ContentResolver resolver = getContentResolver();
                        Uri uri = data.getData();
                        Bitmap image = MediaStore.Images.Media.getBitmap(resolver, uri);
                        String[] proj = {MediaStore.Images.Media.DATA};
                        Cursor cursor = managedQuery(uri, proj, null, null, null);
                        cursor.moveToFirst();
                        onImageChanged(image);
                    } catch (IOException e) {
                        Log.e(TAG, e.toString());
                    }
                    break;
                case TAKE_PHOTO_REQUEST_CODE:
                    Bundle extras = data.getExtras();
                    Bitmap image = (Bitmap) extras.get("data");
                    onImageChanged(image);
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    protected void onDestroy() {
        if (predictor != null) {
            predictor.releaseModel();
        }
        worker.quit();
        super.onDestroy();
    }
}
