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

public class HoardingType extends AppCompatActivity {

    ListView lvHoardingType;
    ArrayList<HashMap<String,String>> arrayList=new ArrayList<>();
    public static final String TAG = "Hoarding_Type";
    public static final String TAG_HOARDINGTYPE_ID = "HoardingType_Id";
    public static final String TAG_HOARDINGTYPE_NAME = "HoardingType_Name";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_hoarding_type);
        lvHoardingType=(ListView)findViewById(R.id.lvHoardingType);
        new getHoarding_Type().execute();
    }

    class getHoarding_Type extends AsyncTask<Void,Void,Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(HoardingType.this);
            progressDialog.setMessage("Various Hoarding Types are getting load, Please Wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getHoarding_Type"); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_HOARDINGTYPE_ID ,jsonObject1.getString(TAG_HOARDINGTYPE_ID)); // change name
                    hashMap.put(TAG_HOARDINGTYPE_NAME, jsonObject1.getString(TAG_HOARDINGTYPE_NAME));

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
            HoardingTypeAdapter hoardingTypeAdapter = new HoardingTypeAdapter(HoardingType.this,arrayList);
            lvHoardingType.setAdapter(hoardingTypeAdapter);
            lvHoardingType.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Intent i=new Intent(HoardingType.this,HoardingActivity.class);
                    i.putExtra(TAG_HOARDINGTYPE_ID,arrayList.get(position).get(TAG_HOARDINGTYPE_ID));
                    startActivity(i);
                }
            });
            progressDialog.dismiss();
        }
    }
}
