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
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

public class ChangePasswordActivity extends AppCompatActivity implements View.OnClickListener {

    EditText tvOldPassword;
    EditText etNewPassword, etConfirmNewPassword;
    Button btnchangepassword;
    SharedPreferences s1;
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().getTitle();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        setContentView(R.layout.activity_change_password);
        initialize();
    }

    void initialize() {
        s1 = getSharedPreferences("MyFile", 0);
        tvOldPassword = (EditText) findViewById(R.id.tvOldPassword);
        etNewPassword = (EditText) findViewById(R.id.etNewPassword);
        etConfirmNewPassword = (EditText) findViewById(R.id.etConfirmNewPassword);
        btnchangepassword = (Button) findViewById(R.id.btnchangepassword);
        btnchangepassword.setOnClickListener(this);
    }

    class ChangePassword extends AsyncTask<Void, Void, Void> {
        String result = "";

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(ChangePasswordActivity.this);
            progressDialog.setMessage("Loading Please Wait");
            progressDialog.show();
        }

        @Override
        protected Void doInBackground(Void... params) {
            String json = jsonParser.invokeJSON("setdata", "query","Update [User] set User_Password = '" + etNewPassword.getText().toString() + "' where User_Id =" + s1.getString(LoginActivity.TAG_USER_ID, ""));
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
                SharedPreferences.Editor e = s1.edit();
                e.putString(LoginActivity.TAG_USER_PASSWORD, etNewPassword.getText().toString());
                e.commit();
                Toast.makeText(ChangePasswordActivity.this, "Password Succesfully Changed", Toast.LENGTH_SHORT).show();

            } else {
                Toast.makeText(ChangePasswordActivity.this, "Invalid Password Details", Toast.LENGTH_SHORT).show();
            }
            progressDialog.dismiss();
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnchangepassword:
                if (validateForm()) {
                    new ChangePassword().execute();
                }
                break;
        }
    }
    boolean validateForm() {
        boolean flag = true;
        if (tvOldPassword.getText().toString().equals("")) {
            flag = false;
            tvOldPassword.setError("Old Password is Required");
        } else if (!s1.getString(LoginActivity.TAG_USER_PASSWORD, "").equals(tvOldPassword.getText().toString())) {
            flag = false;
            tvOldPassword.setError("Old Password does not match");
        }
        if (etNewPassword.getText().toString().equals("")) {
            flag = false;
            etNewPassword.setError("New Password is Required");
        }
        if (etConfirmNewPassword.getText().toString().equals("")) {
            flag = false;
            etNewPassword.setError("Confirm New Password is Required");
        } else if (!etConfirmNewPassword.getText().toString().equals(etNewPassword.getText().toString())) {
            flag = false;
            etConfirmNewPassword.setError("New Password and Confirm New Passwod do not match");
        }
        return flag;
    }
}
