package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class HoardingDetailsActivity extends AppCompatActivity implements View.OnClickListener {

    public static final String TAG = "Hoarding";
    public static final String TAG_HOARDING_ID = "Hoarding_Id";
    public static final String TAG_HOARDING_NAME = "Hoarding_Name";
    public static final String TAG_HOARDING_ADDRESS = "Hoarding_Address";
    public static final String TAG_LOCATION_ID = "Location_Id";
    public static final String TAG_HOARDINGTYPE_ID = "HoardingType_Id";
    public static final String TAG_HOARDING_HEIGHT = "Hoarding_Height";
    public static final String TAG_HOARDING_WIDTH = "Hoarding_Width";
    public static final String TAG_HOARDING_PRICE = "Hoarding_Price";
    public static final String TAG_HOARDING_IMAGE = "Hoarding_Image";
    public static HashMap<String, String> hashMap = new HashMap<>();
    SharedPreferences s1;
    ProgressDialog progressDialog;

    TextView tvHoardingName, tvHoardingPrice, tvHoardingHeight, tvHoardingAddress;
    Button btnAddtoCart;
    ImageView ivHoardingImage;
    private TextView tvLocationId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_hoarding_details);
        initialise();
    }

    void initialise() {
        s1 = getSharedPreferences("MyFile", 0);
        tvHoardingName = (TextView) findViewById(R.id.tvHoardingName);
        tvHoardingHeight = (TextView) findViewById(R.id.tvHoardingHeight);
        ivHoardingImage = (ImageView) findViewById(R.id.ivHoardingImage);
        tvHoardingPrice = (TextView) findViewById(R.id.tvHoardingPrice);
        tvHoardingAddress = (TextView) findViewById(R.id.tvHoardingAddress);
        tvLocationId = (TextView) findViewById(R.id.tvLocationId);
        btnAddtoCart = (Button) findViewById(R.id.btnAddtoCart);
        btnAddtoCart.setOnClickListener(this);
        new getHoarding().execute();
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnAddtoCart:
                if (getSharedPreferences("MyFile", 0).getString(LoginActivity.TAG_USER_ID, "").equals("")) {
                    Toast.makeText(this, "Login to Book Hoardings", Toast.LENGTH_SHORT).show();
                    startActivity(new Intent(HoardingDetailsActivity.this, LoginActivity.class));
                } else {
                    String hoardings[] = getSharedPreferences("MyFile", 0).getString("hoardings", "").split(",");
                    for (int i = 0; i < hoardings.length; i++) {
                        if (hoardings[i].equals(hashMap.get(TAG_HOARDING_ID))) {
                            Toast.makeText(this, "Hoarding is Already in Cart", Toast.LENGTH_SHORT).show();
                            return;
                        }
                    }
                    SharedPreferences.Editor e = getSharedPreferences("MyFile", 0).edit();
                    e.putString("hoardings", getSharedPreferences("MyFile", 0).getString("hoardings", "") + hashMap.get(TAG_HOARDING_ID) + ",");
                    e.commit();
                    new insertCart().execute();
                }
                break;
        }
    }

    class getHoarding extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(HoardingDetailsActivity.this);
            progressDialog.setMessage("Loading Please Wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getHoardingById", "Hoarding_Id", getIntent().getStringExtra(HoardingActivity.TAG_HOARDING_ID)); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    hashMap.put(TAG_HOARDING_ID, jsonObject1.getString(TAG_HOARDING_ID)); // change name
                    hashMap.put(TAG_HOARDING_NAME, jsonObject1.getString(TAG_HOARDING_NAME));
                    hashMap.put(TAG_HOARDING_ADDRESS, jsonObject1.getString(TAG_HOARDING_ADDRESS)); // change name
                    hashMap.put(TAG_LOCATION_ID, jsonObject1.getString(TAG_LOCATION_ID));
                    hashMap.put(TAG_HOARDINGTYPE_ID, jsonObject1.getString(TAG_HOARDINGTYPE_ID));
                    hashMap.put(TAG_HOARDING_HEIGHT, jsonObject1.getString(TAG_HOARDING_HEIGHT));
                    hashMap.put(TAG_HOARDING_WIDTH, jsonObject1.getString(TAG_HOARDING_WIDTH));
                    hashMap.put(TAG_HOARDING_PRICE, jsonObject1.getString(TAG_HOARDING_PRICE));
                    hashMap.put(TAG_HOARDING_IMAGE, jsonObject1.getString(TAG_HOARDING_IMAGE));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            tvHoardingName.setText(hashMap.get(TAG_HOARDING_NAME));
            tvHoardingHeight.setText("Size:" + hashMap.get(TAG_HOARDING_HEIGHT) + " * " + hashMap.get(TAG_HOARDING_WIDTH));
            tvHoardingPrice.setText("Rs." + hashMap.get(TAG_HOARDING_PRICE));
            tvHoardingAddress.setText(hashMap.get(TAG_HOARDING_ADDRESS));
            Picasso.with(HoardingDetailsActivity.this).load(jsonParser.HOARDING_IMAGE_URL + hashMap.get(HoardingActivity.TAG_HOARDING_IMAGE).replace(" ", "%20")).into(ivHoardingImage);
            tvLocationId.setText(hashMap.get(HoardingActivity.TAG_LOCATION_ID));
            progressDialog.dismiss();
        }
    }

    class insertCart extends AsyncTask<Void, Void, Void> {
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(HoardingDetailsActivity.this);
            progressDialog.setMessage("Loading please wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("setdata", "query", "Insert into Cart (User_Id,Hoarding_Id,Hoarding_Price,Banner_Url)values('" + s1.getString(LoginActivity.TAG_USER_ID, "") + "','" + hashMap.get(TAG_HOARDING_ID) + "','" + hashMap.get(TAG_HOARDING_PRICE) + "','no_image_uploaded.png')");
            try {
                JSONObject jsonObject = new JSONObject(json);
                result = jsonObject.getString("Result");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            super.onPostExecute(aVoid);
            if (result.equals("1")) {
                AlertDialog.Builder builder = new AlertDialog.Builder(HoardingDetailsActivity.this)
                        .setMessage("Do you want to upload a banner for the Hoarding?")
                        .setPositiveButton("Yes, Upload Now", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                Intent i1 = new Intent(HoardingDetailsActivity.this, UploadBannerActivity.class);
                                i1.putExtra(TAG_HOARDING_ID, hashMap.get(TAG_HOARDING_ID));
                                startActivity(i1);
                            }
                        })
                        .setNegativeButton("Not Now", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                Intent i1 = new Intent(HoardingDetailsActivity.this, ViewCart.class);
                                startActivity(i1);
                            }
                        });
                builder.show();
            } else {
                Toast.makeText(HoardingDetailsActivity.this, "Error", Toast.LENGTH_SHORT).show();
            }
            progressDialog.dismiss();
        }
    }
}