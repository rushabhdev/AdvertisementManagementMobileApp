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

public class UserActivity extends AppCompatActivity {

    ListView lvUser;
    ArrayList<HashMap<String,String>>arrayList=new ArrayList<>();
    public static final String TAG = "[User]";
    public static final String TAG_USER_ID = "User_Id";
    public static final String TAG_USER_NAME = "User_Name";
    public static final String TAG_USER_ADDRESS = "User_Address";
    public static final String TAG_USER_PASSWORD = "User_Password";
    public static final String TAG_USER_EMAIL = "User_Email";
    public static final String TAG_USER_GENDER = "User_Gender";
    public static final String TAG_USER_MOBILE = "User_Mobile";
    public static final String TAG_LOCATION_ID = "Location_Id";
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_user);
        lvUser=(ListView)findViewById(R.id.lvUser);
        new getUser().execute();
    }
    class getUser extends AsyncTask<Void,Void,Void>{
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(UserActivity.this);
            progressDialog.setMessage("Loading Please Wait...");
            progressDialog.show();
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            UserAdapter userAdapter = new UserAdapter(UserActivity.this,arrayList);
            lvUser.setAdapter(userAdapter);
            progressDialog.dismiss();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getUser"); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_USER_ID ,jsonObject1.getString(TAG_USER_ID)); // change name
                    hashMap.put(TAG_USER_NAME, jsonObject1.getString(TAG_USER_NAME));
                    hashMap.put(TAG_USER_ADDRESS, jsonObject1.getString(TAG_USER_ADDRESS)); // change name
                    hashMap.put(TAG_USER_PASSWORD, jsonObject1.getString(TAG_USER_PASSWORD));
                    hashMap.put(TAG_USER_EMAIL, jsonObject1.getString(TAG_USER_EMAIL));
                    hashMap.put(TAG_USER_GENDER, jsonObject1.getString(TAG_USER_GENDER));
                    hashMap.put(TAG_USER_MOBILE, jsonObject1.getString(TAG_USER_MOBILE));
                    hashMap.put(TAG_LOCATION_ID, jsonObject1.getString(TAG_LOCATION_ID));
                    arrayList.add(hashMap);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
