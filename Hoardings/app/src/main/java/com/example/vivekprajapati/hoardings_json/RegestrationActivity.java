package com.example.vivekprajapati.hoardings_json;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class RegestrationActivity extends AppCompatActivity implements View.OnClickListener {

    EditText etUserName, etUserAddress, etUserPassword, etUserEmail, etUserMobile;
    Spinner etUserLocation;
    Button btnregistartion;
    ProgressDialog progressDialog;
    RadioGroup rgGender;
    RadioButton rb;
    String selLocid = "", locationid[], locationname[];
    public static final String TAG = "Location";
    public static final String TAG_LOCATION_ID = "Location_Id";
    public static final String TAG_LOCATION_NAME = "Location_Name";
    public static final String TAG_CITY_ID = "City_Id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_regestration);
        initialise();
    }

    class getLocation extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(RegestrationActivity.this);
            progressDialog.setMessage("Loading Please wait...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("getLocation");
            try {
                JSONObject jsonObject = new JSONObject(json);
                JSONArray jsonArray = jsonObject.getJSONArray(TAG);
                locationid = new String[jsonArray.length()];
                locationname = new String[jsonArray.length()];
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    locationid[i] = jsonObject1.getString(TAG_LOCATION_ID);
                    locationname[i] = jsonObject1.getString(TAG_LOCATION_NAME);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(RegestrationActivity.this, android.R.layout.simple_spinner_dropdown_item, locationname);
            etUserLocation.setAdapter(arrayAdapter);
            etUserLocation.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override
                public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                    selLocid = locationid[i];
                }

                @Override
                public void onNothingSelected(AdapterView<?> adapterView) {

                }
            });
            progressDialog.dismiss();
        }
    }

    void initialise() {
        etUserName = (EditText) findViewById(R.id.etUserName);
        etUserAddress = (EditText) findViewById(R.id.etUserAddress);
        etUserPassword = (EditText) findViewById(R.id.etUserPassword);
        etUserEmail = (EditText) findViewById(R.id.etUserEmail);
        etUserLocation = (Spinner) findViewById(R.id.etUserLocation);
        rgGender = (RadioGroup) findViewById(R.id.rgGender);
        etUserMobile = (EditText) findViewById(R.id.etUserMobile);
        btnregistartion = (Button) findViewById(R.id.btnregistration);
        btnregistartion.setOnClickListener(this);
    }

    class SetData extends AsyncTask<Void, Void, Void> { // for regestartion
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(RegestrationActivity.this);
            progressDialog.setMessage("Registering You To Chitra's Hoarding...");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("setdata", "query", "Insert into [User](User_Name,User_Address,User_Password,User_Email, User_Gender,User_Mobile,Location_Id)values('" + etUserName.getText().toString() + "','" + etUserAddress.getText().toString() + "','" + etUserPassword.getText().toString() + "','" + etUserEmail.getText().toString() + "','" + rb.getText().toString() + "','" + etUserMobile.getText().toString() + "','" + selLocid + "')");
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
                Toast.makeText(RegestrationActivity.this, "Registration Successfull", Toast.LENGTH_SHORT).show();
                Intent i = new Intent(RegestrationActivity.this, LoginActivity.class);
                startActivity(i);
            } else {
                Toast.makeText(RegestrationActivity.this, "Please Enter Valid Details", Toast.LENGTH_SHORT).show();
            }
        }
    }

    @Override
    public void onClick(View v) {
        Intent i;
        switch (v.getId()) {
            case R.id.btnregistration:
                rb = (RadioButton) findViewById(rgGender.getCheckedRadioButtonId());
                new SetData().execute();
                break;
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        finish();
    }
}
