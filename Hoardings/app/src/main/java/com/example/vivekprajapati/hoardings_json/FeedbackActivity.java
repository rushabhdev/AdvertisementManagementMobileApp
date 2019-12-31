package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RadioButton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class FeedbackActivity extends AppCompatActivity implements View.OnClickListener{

    ListView lvFeedback;
    Button btnFeedbackForm;

    ArrayList<HashMap<String,String>> arrayList=new ArrayList<>();
    public static final String TAG = "FeedBack";
    public static final String TAG_FEEDBACK_ID = "Feedback_Id";
    public static final String TAG_FEEDBACK_DATE = "Feedback_Date";
    public static final String TAG_FEEDBACK_DESC = "Feedback_Desc";
    public static final String TAG_USER_ID = "User_Id";
    ProgressDialog progressDialog;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_feedback);
        lvFeedback=(ListView)findViewById(R.id.lvFeedBack);
        new getFeedback().execute();
        btnFeedbackForm=(Button)findViewById(R.id.btnFeedbackForm);
        btnFeedbackForm.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.btnFeedbackForm:
                Intent i = new Intent(FeedbackActivity.this,FeedbackForm.class);
                startActivity(i);
                break;
        }
    }

    class getFeedback extends AsyncTask<Void,Void,Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(FeedbackActivity.this);
            progressDialog.setMessage("Feedbacks are loading...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getFeedBack"); // this will let android studio know that it needs to fetch data from getEmployee Method.
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    HashMap<String, String> hashMap = new HashMap<>();
                    hashMap.put(TAG_FEEDBACK_ID ,jsonObject1.getString(TAG_FEEDBACK_ID)); // change name
                    hashMap.put(TAG_FEEDBACK_DATE, jsonObject1.getString(TAG_FEEDBACK_DATE));
                    hashMap.put(TAG_FEEDBACK_DESC, jsonObject1.getString(TAG_FEEDBACK_DESC)); // change name
                    hashMap.put(TAG_USER_ID, jsonObject1.getString(TAG_USER_ID));
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
            FeedBackAdapter employeeAdapter = new FeedBackAdapter(FeedbackActivity.this,arrayList);
            lvFeedback.setAdapter(employeeAdapter);
            progressDialog.dismiss();
        }
    }
}
