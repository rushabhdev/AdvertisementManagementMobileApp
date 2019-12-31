package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class FeedbackForm extends AppCompatActivity implements View.OnClickListener {
    EditText etFeedbackDate, etFeedbackDesc;
    //EditText etUserId;
    Button btnFeedback;
    ProgressDialog progressDialog;
    private SharedPreferences s1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_feedback_form);
        initialize();
    }

    void initialize() {
        s1 = getSharedPreferences("MyFile", 0);
        etFeedbackDate = (EditText) findViewById(R.id.etFeedbackDate);
        etFeedbackDesc = (EditText) findViewById(R.id.etFeedbackDesc);
        // etUserId=(EditText)findViewById(R.id.etUserId);
        btnFeedback = (Button) findViewById(R.id.btnFeedback);
        btnFeedback.setOnClickListener(this);
    }

    class SetData extends AsyncTask<Void, Void, Void> {
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(FeedbackForm.this);
            progressDialog.setMessage("Loading Please Wait");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("setdata", "query", "Insert into FeedBack(Feedback_Date,Feedback_Desc,User_Id)values('" + etFeedbackDate.getText().toString() + "','" + etFeedbackDesc.getText().toString() + "'," + s1.getString(LoginActivity.TAG_USER_ID, "") + ")");
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
            if (result.equals("1")) {
                Toast.makeText(FeedbackForm.this, "Thanks For Feedback", Toast.LENGTH_SHORT).show();
                Intent i = new Intent(FeedbackForm.this, HoardingType.class);
                startActivity(i);
            } else {
                Toast.makeText(FeedbackForm.this, "Please Try Again", Toast.LENGTH_SHORT).show();
            }
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnFeedback:
                if (validateform())
                    new SetData().execute();
                break;
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        finish();
    }

    boolean validateform() {
        boolean flag = true;
        if (etFeedbackDate.getText().toString().equals("")) {
            etFeedbackDate.setError("Enter date");
            flag = false;
        }
        if (etFeedbackDesc.getText().toString().equals("")) {
            etFeedbackDesc.setError("Enter Description");
            flag = false;
        }
        return flag;
    }
}