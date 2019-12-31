package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.MarshalBase64;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

public class UploadBannerActivity extends AppCompatActivity implements View.OnClickListener {
    ImageView ivBannerImage;
    Button btnUpload;
    byte[] array;
    InputStream is = null;
    String fname = "", picturePath = "";
    private ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_upload_banner);
        initialise();
    }

    void initialise() {
        ivBannerImage = (ImageView) findViewById(R.id.ivBannerImage);
        btnUpload = (Button) findViewById(R.id.btnUpload);
        btnUpload.setOnClickListener(this);
        ivBannerImage.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.ivBannerImage:
                Intent i = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                startActivityForResult(i, 0);
                break;
            case R.id.btnUpload:
                try {
                    is = new FileInputStream(picturePath);
                    if (picturePath != null) {
                        try {
                            fname = Integer.toString(new Random().nextInt(10000)) + ".jpg";
                            array = streamToBytes(is);
                            new UploadImage().execute();
                        } finally {
                            is.close();
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    try {
                        throw new IOException("Unable to open R.raw.");
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                }
                break;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == 0 && resultCode == RESULT_OK && null != data) {
            Uri selectedImage = data.getData();
            String[] filePathColumn = {MediaStore.Images.Media.DATA};

            Cursor cursor = getContentResolver().query(selectedImage,
                    filePathColumn, null, null, null);
            cursor.moveToFirst();
            int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
            picturePath = cursor.getString(columnIndex);
            cursor.close();

            ivBannerImage.setVisibility(View.VISIBLE);
            ivBannerImage.setImageBitmap(BitmapFactory.decodeFile(picturePath));
        }
    }

    public static byte[] streamToBytes(InputStream is) throws IOException {
        ByteArrayOutputStream os = new ByteArrayOutputStream(is.available());
        byte[] buffer = new byte[is.available()];
        int len;
        Log.d("size", "" + is.available());
        try {
            while ((len = is.read(buffer)) >= 0) {
                os.write(buffer, 0, len);
            }
        } catch (java.io.IOException e) {
        }
        return os.toByteArray();
    }

    class UploadImage extends AsyncTask<Void, Integer, Void> {
        String str = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(UploadBannerActivity.this);
            progressDialog.setMessage("Please Wait...");
            progressDialog.show();
        }

        @Override
        protected void onPostExecute(Void result) {
            // TODO Auto-generated method stub
            super.onPostExecute(result);
            try {
                if (new JSONObject(str).getString("Result").equals("1")) {
                    Toast.makeText(UploadBannerActivity.this, "Banner Uploaded Successfully", Toast.LENGTH_SHORT).show();
                    Intent i = new Intent(UploadBannerActivity.this, ViewCart.class);
                    startActivity(i);
                } else {
                    Toast.makeText(UploadBannerActivity.this, "Error in Uploading, Try Again", Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
            }
        }

        @Override
        protected Void doInBackground(Void... arg0) {
            // TODO Auto-generated method stub
            final String SOAP_ACTION = "http://tempuri.org/ByteArrayToFile";
            final String METHOD_NAME = "ByteArrayToFile";
            final String NAMESPACE = "http://tempuri.org/";
            final String URL = jsonParser.URL;
            try {
                SoapObject so = new SoapObject(NAMESPACE, METHOD_NAME);
                so.addProperty("BArray", array);
                so.addProperty("fname", fname);
                so.addProperty("Hoarding_Id", getIntent().getStringExtra(HoardingDetailsActivity.TAG_HOARDING_ID));
                so.addProperty("User_Id", getSharedPreferences("MyFile", 0).getString(LoginActivity.TAG_USER_ID, ""));
                SoapSerializationEnvelope sse = new SoapSerializationEnvelope(
                        SoapEnvelope.VER11);
                new MarshalBase64().register(sse);
                sse.dotNet = true;
                sse.setOutputSoapObject(so);
                HttpTransportSE htse = new HttpTransportSE(URL);
                htse.call(SOAP_ACTION, sse);
                SoapPrimitive response = (SoapPrimitive) sse.getResponse();
                str = response.toString();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
