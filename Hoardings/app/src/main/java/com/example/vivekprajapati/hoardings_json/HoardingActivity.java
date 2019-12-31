package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class HoardingActivity extends AppCompatActivity {


    ListView lvHoarding;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
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
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_hoarding);
        lvHoarding = (ListView) findViewById(R.id.lvHoarding);
        new getHoarding().execute();
    }

    class getHoarding extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(HoardingActivity.this);
            progressDialog.setMessage("Please Wait While we retrieve Hoardings for you...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getHoarding", "HoardingType_Id", getIntent().getStringExtra(HoardingType.TAG_HOARDINGTYPE_ID)); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_HOARDING_ID, jsonObject1.getString(TAG_HOARDING_ID)); // change name
                    hashMap.put(TAG_HOARDING_NAME, jsonObject1.getString(TAG_HOARDING_NAME));
                    hashMap.put(TAG_HOARDING_ADDRESS, jsonObject1.getString(TAG_HOARDING_ADDRESS)); // change name
                    hashMap.put(TAG_LOCATION_ID, jsonObject1.getString(TAG_LOCATION_ID));
                    hashMap.put(TAG_HOARDINGTYPE_ID, jsonObject1.getString(TAG_HOARDINGTYPE_ID));
                    hashMap.put(TAG_HOARDING_HEIGHT, jsonObject1.getString(TAG_HOARDING_HEIGHT));
                    hashMap.put(TAG_HOARDING_WIDTH, jsonObject1.getString(TAG_HOARDING_WIDTH));
                    hashMap.put(TAG_HOARDING_PRICE, jsonObject1.getString(TAG_HOARDING_PRICE));
                    hashMap.put(TAG_HOARDING_IMAGE, jsonObject1.getString(TAG_HOARDING_IMAGE));
                    arrayList.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            HoardingAdapter hoardingAdapter = new HoardingAdapter(HoardingActivity.this, arrayList);
            lvHoarding.setAdapter(hoardingAdapter);
            lvHoarding.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Intent i = new Intent(HoardingActivity.this, HoardingDetailsActivity.class);
                    i.putExtra(TAG_HOARDING_ID, arrayList.get(position).get(TAG_HOARDING_ID));
                    startActivity(i);
                }
            });
            progressDialog.dismiss();
        }
    }
}
