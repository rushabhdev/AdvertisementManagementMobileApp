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

public class CityActivity extends AppCompatActivity {

    ListView lvCity;

    ArrayList<HashMap<String,String>>arrayList=new ArrayList<>();
    public static final String TAG = "City";
    public static final String TAG_CITY_ID = "City_Id";
    public static final String TAG_CITY_NAME = "City_Name";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_city);
        lvCity=(ListView)findViewById(R.id.lvCity);
        new getCity().execute();

    }

    class getCity extends AsyncTask<Void,Void,Void>{

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getCity");
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray=jsonObject.getJSONArray(TAG);
                for(int i=0 ; i<jsonArray.length();i++) {
                    JSONObject jsonObject1=jsonArray.getJSONObject(i);
                    HashMap<String,String>hashMap=new HashMap<>();
                    hashMap.put(TAG_CITY_ID,jsonObject1.getString(TAG_CITY_ID));
                    hashMap.put(TAG_CITY_NAME,jsonObject1.getString(TAG_CITY_NAME));
                    arrayList.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(CityActivity.this);
            progressDialog.setMessage("Available Cities are Loading...");
            progressDialog.show();
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            CityAdapter cityAdapter=new CityAdapter(CityActivity.this,arrayList);
            lvCity.setAdapter(cityAdapter);
            progressDialog.dismiss();
        }
    }
}
