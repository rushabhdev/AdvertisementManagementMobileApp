package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class LocationActivity extends AppCompatActivity {

    ListView lvLocation;
    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
    public static final String TAG = "Location";
    public static final String TAG_LOCATION_ID = "Location_Id";
    public static final String TAG_LOCATION_NAME = "Location_Name";
    public static final String TAG_CITY_ID = "City_Id";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_location);
        lvLocation = (ListView) findViewById(R.id.lvLocation);
        new getLocation().execute();
    }

    class getLocation extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(LocationActivity.this);
            progressDialog.setMessage("Loading Various Available Locations...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getLocation");
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_LOCATION_ID, jsonObject1.getString(TAG_LOCATION_ID));
                    hashMap.put(TAG_LOCATION_NAME, jsonObject1.getString(TAG_LOCATION_NAME));
                    hashMap.put(TAG_CITY_ID, jsonObject1.getString(TAG_CITY_ID));
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
            LocationAdapter locationAdapter = new LocationAdapter(LocationActivity.this, arrayList);
            lvLocation.setAdapter(locationAdapter);
            progressDialog.dismiss();
        }
    }
}
